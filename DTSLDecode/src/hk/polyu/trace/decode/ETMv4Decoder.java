package hk.polyu.trace.decode;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

import hk.polyu.Configuration;
import hk.polyu.trace.analysis.TraceReporter;
import hk.polyu.trace.analysis.cg.Callgraph;
import hk.polyu.trace.analysis.cg.CallgraphBuilder;
import hk.polyu.trace.analysis.unpack.InvocationChainBuilder;
import hk.polyu.trace.analysis.unpack.InvocationChainReporter;
import hk.polyu.trace.decode.exception.TraceCorruptedException;
import hk.polyu.trace.decode.exception.TraceDecodeEndOfBufferException;
import hk.polyu.trace.decode.exception.TraceDecodeIOException;
import hk.polyu.trace.decode.exception.TraceDecodeStopException;
import hk.polyu.trace.resolver.ArtInstruction;
import hk.polyu.trace.resolver.ArtMethod;
import hk.polyu.trace.resolver.ArtMethodSearcher;
import hk.polyu.trace.resolver.MemoryBlock;
import hk.polyu.trace.resolver.MemoryBlock.MemoryBlockOwner;
import hk.polyu.trace.resolver.MemoryMapResolver;
import hk.polyu.trace.resolver.OATDumpResolver;
import hk.polyu.trace.resolver.OBJDumpHeaderResolver;
import hk.polyu.trace.resolver.OBJDumpResolver;
import hk.polyu.utility.PerformanceMonitor;

public class ETMv4Decoder extends TraceDecoderAbstract {
	
	private static int ASYNC_ZERO_COUNT = 11;
	private static final int MAX_TRACE_INFO_SKIP = 100;
	private static final int IS_ARM = 0;
    private static final int IS_THUMB = 1;
	private static final int N_ATOM = 0;
	private static final int E_ATOM = 1;
    private int mP0KeyMax;
    private int mMaxSpecDepth;
    private boolean mCommitOpt;
    protected int mVMIDBytes;
    AddressRegister[] mAddressRegisters;
    private ETMv4ReturnStack mReturnStack;
    int mExceptionLevel;
    SecurityLevel mSecurityLevel;
    boolean mSixtyFourBit;
    int mCycleCountThreshold;
    int mCurrentSpeculationDepth;
    int mP0Key;
    int mConditionCKey;
    int mConditionRKey;
    protected boolean mCycleCountEnabled;
    protected boolean mP0Load;
    protected boolean mP0Store;
    protected boolean mConditionalLoad;
    protected boolean mConditionalStore;
    protected boolean mConditionalAll;
    private ContextElement mLastContext;
    private static int[] mAtomPacketDecodeTable;
    private Queue<TraceRecord> mOutputDelayQueue;
    PacketType[] mPacketLookupTable;
    private P0Element[] mP0ElementQueue;
    
    {
    	ETMv4Decoder.mAtomPacketDecodeTable = new int[256];
    	BitPatternList bpList = new BitPatternList();
    	bpList.add("b1111011x", 1);		// indicate one Atom element
    	bpList.add("b110110xx", 2);    	// indicate two Atom elements
    	bpList.add("b11111xxx", 3);    	// indicate three Atom elements
    	bpList.add("b110111xx", 4);    	// indicate a sequence of four Atom elements
    	bpList.add("b11110101", 5101); 	// indicate a sequence of five Atom elements
    	bpList.add("b11010101", 5001); 	// indicate a sequence of five Atom elements
    	bpList.add("b11010110", 5010); 	// indicate a sequence of five Atom elements
    	bpList.add("b11010111", 5011); 	// indicate a sequence of five Atom elements
    	bpList.add("b11xxxxxx", 6);    	// indicate 4-24 Atom elements
    	for (int i = 0; i < 256; ++i) {
    		ETMv4Decoder.mAtomPacketDecodeTable[i] = bpList.findKey(i);
    	}
    }
    
    ArtInstructionRecord addRecord() {
        if (mCurrentArtInstruction == null) {
            throw new NullPointerException();
        }
        
        mArtInstructionRecord.setArtInstruction(mCurrentArtInstruction);
        addTraceRecord(mArtInstructionRecord); // add to the queue
        ArtInstructionRecord oldRecord = mArtInstructionRecord;
        mArtInstructionRecord = new ArtInstructionRecord(); // update mArtInstructionRecord
        return oldRecord;
    }
    
    @Override
    protected void addTraceRecord(TraceRecord record) {
        mOutputDelayQueue.add(record);
    }
    
    // ---- Extension packets ---- //
	
    // The A-Sync instruction trace packet is a unique sequence of bits that identifies the boundary of another packet.
 	// header = 0b00000000, payload (11 bytes) = 0b00000000 + 9 * 0b00000000 + 1 * 0b10000000
    protected void processASyncPacket(boolean read) throws TraceDecodeStopException, TraceCorruptedException {
        // The first byte of the payload has already been read, therefore, the constraint for the loop is "i < 9".
 		for (int i = 0; i < 9; i++) {
            int data = readTraceByte();
            if (data != 0b00000000) { // 0
            	throw new TraceCorruptedException("MALFORMED A SYNC PACKET");
            }
        }
        
        int data = readTraceByte();
        if (data != 0b10000000) { // 128
        	throw new TraceCorruptedException("MALFORMED A SYNC PACKET");
        }
    }
    
 	// A Discard instruction trace packet indicates that tracing has become inactive while uncommitted P0 elements remain.
 	// header = 0b00000000, payload = 1 * 0b00000011
    protected void processDiscardPacket(boolean read) throws TraceCorruptedException {
        if (read) {
        	addTraceRecord(new TraceRecordDiscard("TRACING_DISABLED"));
            conditionalFlush();
        	mCurrentSpeculationDepth = 0;
        }
    	// throw new TraceCorruptedException("UNSUPPORTTED DISCARD PACKET");
    }
 	
    // An Overflow instruction trace packet is output whenever the instruction trace buffer overflows.
 	// header = 0b00000000, payload = 1 * 0b00000101
    protected void processOverflowPacket(boolean read) throws TraceCorruptedException {    	
        if (read) {
            addTraceRecord(new TraceRecordOverflow("OVERFLOW"));
            processDiscardPacket(read);
        }
    }
    
    // ---- Q packets ---- //
    
    // A Q packet indicates that Q elements have occurred.
    // A trace unit can generate a Q element to imply that at least one instruction has been executed, possibly including branch or ISB instructions.
    // header = 0b1010xxxx
    protected AddressRegister processQPacket(int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
    	int field = field(3, 0, headerByte); // TYPE
    	AddressRegister address = null;
    	switch (field) {
    		case 0: 
    		case 1: 
    		case 2: 
    			if (read) {
    				address = exactMatch(field); // an Exact Match Address packet
    			}
    			break;
    		case 3: 
    		case 4: 
    			throw new TraceCorruptedException("RESERVED ADDRESS HEADER");
    		case 5: 
    			address = readShortAddress(read, 0); // Short IS0 Address
    			break;
    		case 6: 
    			address = readShortAddress(read, 1); // Short IS1 Address
    			break;
    		case 7: 
    		case 8: 
    		case 9: 
    			throw new TraceCorruptedException("RESERVED ADDRESS HEADER");
    		case 10: 
    			address = read32BitArmAddress(read); // 32-bit Long IS0 Address
    			break;
    		case 11: 
    			address = read32BitThumbAddress(read); // 32-bit Long IS1 Address
    			break;
    		case 13: 
    			throw new TraceCorruptedException("RESERVED ADDRESS HEADER");
    		case 14: 
    			throw new TraceCorruptedException("RESERVED_ADDRESS_HEADER");
    	}

    	int count;
    	if (field != 0b1111) {
    		count = readVariableLengthInt();
    	} else {
    		count = 0;
    	}
    	    
    	if (read) {
    		emitP0Element(new QElement(count, address));
    	}
    	
    	return address;
    }
    
    // ---- Address tracing ---- //
    
    // An Address packet indicates that Address elements have occurred.
    // An Address element contains the instruction address and an indication of the instruction set of the next instruction that is executed by PE.
    // header = 0b1001000x, 0b10010010				-> Exact Match Address
    // header = 0b10010101, 0b10010110             	-> Short Address
    // header = 0b1001101x, 0b10011101, 0b10011110	-> Long Address
    protected AddressRegister readAddressPacket(int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
    	AddressRegister address = null;
    	int field = field(3, 0, headerByte);
    	switch (field) {
    		case 0: 
    		case 1: 
    		case 2: 
    			if (read) {
    				address = exactMatch(field);
    			}
    			break;
    		case 3: 
    		case 4: 
    			throw new TraceCorruptedException("RESERVED ADDRESS HEADER");
    		case 5: 
    			address = readShortAddress(read, 0); // Short IS0 Address
    			break;
    		case 6: 
    			address = readShortAddress(read, 1); // Short IS1 Address
    			break;
    		case 7: 
    		case 8: 
    		case 9: 
    			throw new TraceCorruptedException("RESERVED ADDRESS HEADER");
    		case 10: 
    			address = read32BitArmAddress(read); // 32-bit Long IS0 Address
    			break;
    		case 11: 
    			address = read32BitThumbAddress(read); // 32-bit Long IS1 Address
    			break;
    		case 12: 
    			throw new TraceCorruptedException("RESERVED ADDRESS HEADER");
    		case 13: 
    			address = read64BitArmAddress(read); // 64-bit Long IS0 Address
    			break;
    		case 14: 
    			address = read64BitThumbAddress(read); // 64-bit Long IS1 Address
    			break;
    		case 15: 
    			throw new TraceCorruptedException("RESERVED ADDRESS HEADER");
    	}
    	
    	return address;
	}
    
    private AddressRegister exactMatch(int field) throws TraceCorruptedException {
    	AddressRegister address = mAddressRegisters[field];
    	if (address == null) {
    		throw new TraceCorruptedException("UNINITIALIZED ADDRESS REGISTER");
    	}
    	updateAddressRegisters(address);
    	
    	return address;
	}
    
    private AddressRegister readShortAddress(boolean read, int instructionSet) throws TraceDecodeStopException, TraceCorruptedException {
    	int addressBytes = readTraceByte();
    	boolean c = bit(7, addressBytes);
    	if (c) {
    		addressBytes = field(6, 0, addressBytes) | readTraceByte() << 7;
    	}
    	int bits = c ? 0b1111 : 0b0111;
    	if (read) {
    		AddressRegister oldAddress = mAddressRegisters[0];
    		if (oldAddress == null) {
    			throw new TraceCorruptedException("UNINITIALIZED ADDRESS REGISTER");
    		}
    		
    		AddressRegister address = new AddressRegister(oldAddress, addressBytes, bits, instructionSet);
    		updateAddressRegisters(address);
    		return address;
    	}
    	
    	return null;
	}
    
    private AddressRegister read32BitArmAddress(boolean read) throws TraceDecodeStopException, TraceCorruptedException {
    	if (read) {
    		AddressRegister oldAddress = mAddressRegisters[0];
    		if (oldAddress == null) {
    			throw new TraceCorruptedException("UNINITIALIZED ADDRESS REGISTER");
    		}
    		
    		long addressBytes = (long) oldAddress.getAddress() & 0xffffffff00000000L;
    		addressBytes |= (long) field(6, 0, readTraceByte()) << 2;
    		addressBytes |= (long) field(6, 0, readTraceByte()) << 9;
    		addressBytes |= (long) readTraceByte() << 16;
    		addressBytes |= (long) readTraceByte() << 24;
    	      
    		int instructionSet = IS_ARM;
    		AddressRegister address = fullAddress(addressBytes, instructionSet);
    		return address;
    	}
    	
    	advance(4L);
    	return null;
	}
    
    private AddressRegister read32BitThumbAddress(boolean read) throws TraceDecodeStopException, TraceCorruptedException {
    	if (read) {
    		AddressRegister oldAddress = mAddressRegisters[0];
    		if (oldAddress == null) {
    			throw new TraceCorruptedException("UNINITIALIZED ADDRESS REGISTER");
    		}
    		
    		long addressBytes = (long) oldAddress.getAddress() & 0xffffffff00000000L;  
    		addressBytes |= (long) field(6, 0, readTraceByte()) << 1;
    		addressBytes |= (long) readTraceByte() << 8;
    		addressBytes |= (long) readTraceByte() << 16;
    		addressBytes |= (long) readTraceByte() << 24;
    	      
    		int instructionSet = IS_THUMB;
    		AddressRegister address = fullAddress(addressBytes, instructionSet);
    		return address;
    	}
    	
    	advance(4L);
    	return null;
	}
    
    private AddressRegister read64BitArmAddress(boolean read) throws TraceDecodeStopException {
    	if (read) {
    		long addressBytes = (long) field(6, 0, readTraceByte()) << 2;
    		addressBytes |= (long) field(6, 0, readTraceByte()) << 9;
    		addressBytes |= (long) readTraceByte() << 16;
    		addressBytes |= (long) readTraceByte() << 24;
    		addressBytes |= (long) readTraceByte() << 32;
    		addressBytes |= (long) readTraceByte() << 40;
    		addressBytes |= (long) readTraceByte() << 48;
    		addressBytes |= (long) readTraceByte() << 56;
    	      
    		int instructionSet = IS_ARM;
    		AddressRegister address = fullAddress(addressBytes, instructionSet);
    		return address;
    	}
    	
    	advance(8L);
    	return null;
	}
    
    private AddressRegister read64BitThumbAddress(boolean read) throws TraceDecodeStopException {
    	if (read) {
    		long addressBytes = (long) field(6, 0, readTraceByte()) << 1;
    		addressBytes |= (long) readTraceByte() << 8;
    		addressBytes |= (long) readTraceByte() << 16;
    		addressBytes |= (long) readTraceByte() << 24;
    		addressBytes |= (long) readTraceByte() << 32;
    		addressBytes |= (long) readTraceByte() << 40;
    		addressBytes |= (long) readTraceByte() << 48;
    		addressBytes |= (long) readTraceByte() << 56;
    	      
    		int instructionSet = IS_THUMB;
    		AddressRegister address = fullAddress(addressBytes, instructionSet);
    		return address;
    	}
    	
    	advance(8L);
    	return null;
	}
    
    // ---- Event tracing ---- //
    
    // An Event packet indicates that 1-4 Event elements have been generated.
    // The Event element indicates when a programmed event occurs and its payload contains a number to identify the event number.
    // header = 0b01110001 ~ 0b01111111
    protected void processEventPacket(int headerByte, boolean read) {
        if (read) {
            for (int i = 0; i < 4; ++i) {
                if (bit(i, headerByte)) {
                    emitEventElement(i);
                }
            }
        }
    }
    
    private void emitEventElement(int type) {
        addInfoRecord(String.format("Trace event type %d", type));
    }
    
    void addInfoRecord(String info) {
        addTraceRecord(new TraceInfoRecord(info));
    }
    
    // ---- Conditional instructions tracing ---- //
    // TODO: Adding more details about each packet.
    
    // header = 0b0100000x, 0b01000010
    protected void processConditionalInstructionFormat2Packet(int ci) throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED CONDITIONAL INSTRUCTION FORMAT2 PACKET");
    }
    
    // header = 0b01000011
    void conditionalFlush() throws TraceCorruptedException {
    	// null
    }
    
    // header = 0b0100010x, 0b01000110
    protected void processConditionalResultFormat4Packet(int headerByte, boolean read) throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED CONDITIONAL RESULT FORMAT4 PACKET");
    }
    
    // header = 0b0100100x, 0b01001010, 0b0100110x, 0b01001110
    protected void processConditionalResultFormat2Packet(int token2bit, boolean k) throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED CONDITIONAL RESULT FORMAT2 PACKET");
    }
    
    // header = 0b0101xxxx
    protected void processConditionalResultFormat3Packet(int headerByte, boolean read) throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED CONDITIONAL RESULT FORMAT3 PACKET");
    }
    
    // header = 0b011010xx
    protected void processConditionalResultFormat1aPacket(int headerByte, boolean read) throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED CONDITIONAL RESULT FORMAT1A PACKET");
    }
    
    // processConditionalInstructionFormat1Packet
    // header = 0b01101100
    protected void processConditionKey(int key) throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED CONDITIONAL INSTRUCTION FORMAT1 PACKET");
    }
    
    // header = 0b01101101
    protected void processConditionalInstructionFormat3Packet(int payloadByte) throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED CONDITIONAL INSTRUCTION FORMAT3 PACKET");
    }
    
    // header = 0b0110111x
    protected void processConditionalResultFormat1bPacket(int headerByte, boolean read) throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED CONDITIONAL RESULT FORMAT1B PACKET");
    }
    
    // ---- Speculation resolution ---- //
    
    // A Commit packet indicates a number of Commit elements.
    // A Commit instruction trace element indicates the number of oldest uncommitted P0 elements that have been committed of execution.
    // header = 0b00101101
    protected void commit(int commit) throws TraceCorruptedException, TraceDecodeStopException {
        while (commit > 0) {
            commitOldestElement();
            --commit;
        }
    	
        // throw new TraceCorruptedException("UNSUPPORTTED COMMIT PACKET");
    }
    
    // A Cancel packet indicates that the trace unit has generated one or more Cancel elements.
    // A Cancel element indicates the number of youngest uncommitted and uncanceled P0 elements that are canceled from execution.
    // header = 0b0010111x, 0b001101xx, 0b00111xxx
    protected void cancel(int cancelCount, boolean misPredict) throws TraceCorruptedException {
    	for (int i = 0; i < cancelCount; i++)
            cancelOne();
        
        if (misPredict)
            mispredict();
    }
    
    private void cancelOne() {
        if (this.mMaxSpecDepth == 0) {
            return;
        }
        
        mCurrentSpeculationDepth -= 1;
        mP0Key = normalizeP0ElementQueueIndex(mP0Key - 1);
        P0Element canceledElement = mP0ElementQueue[mP0Key];
        if (canceledElement != null) {
            canceledElement.cancel();
        }
        mP0ElementQueue[mP0Key] = null;
    }
    
    // A Mispredict packet indicates 0-2 E or N Atom elements followed by one Mispredict element.
    // A Mispredict element indicates that the most recent Atom element has the incorrect E or N status.
    // header = 0b001100xx
    protected void mispredict() throws TraceCorruptedException {
    	for (int i = 0; i < mCurrentSpeculationDepth; i++) {
            int elementIndex = normalizeP0ElementQueueIndex(mP0Key - 1 - i);
            P0Element element = mP0ElementQueue[elementIndex];
            if (element instanceof AtomElement) {
                AtomElement atom = (AtomElement) element;
                atom.mispredict();
                break;
            }
        }
        conditionalFlush();
    }
    
    // ---- Data synchronization markers ---- //
    // TODO: Adding more details about each marker.
    
    // header = 0b001010xx, 0b00101100
    protected void emitSyncMarkerElement() throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED UNNUMBERED DATA SYNC MARK");
    }
    
    // header = 0b00100xxx
    protected void emitNumberedDataSyncMarker(int dataSuncMarkerNumber) throws TraceCorruptedException {
    	throw new TraceCorruptedException("UNSUPPORTTED NUMBERED DATA SYNC MARK");
    }
    
    protected boolean getCommitOpt() {
        return mCommitOpt;
    }
    
    protected int getMaxSpecDepth() {
        return mMaxSpecDepth;
    }
    
    // ---- Cycle counting ---- //
    
    // A trace unit outputs Cycle Count packets that contain processor clock cycle count values.
    // A Cycle Count element indicates the number of processor clock cycles between the two most recent Commit elements that both had a cycle count value associated with them.
    // header = 0b0000110x, 0b0000111x, 0b0001xxxx
    protected void emitCycleCounting(int commit, int cycleCount) throws TraceCorruptedException, TraceDecodeStopException {
        commit(commit);
        addCycles(cycleCount);
    }
    
    // ---- Exception PacketType ---- //
    protected void exceptionPacket(int headerByte, boolean read) throws TraceDecodeStopException, TraceCorruptedException {
        int byteValue = readTraceByte();
        
        int encoding = field(0, 0, byteValue) + (field(6, 6, byteValue) << 1);
        // if (encoding  == 0 || encoding == 3) {
        if (encoding == 3) {
        	throw new TraceCorruptedException("RESERVED EXCEPTION ENCODING");
        }
        
        int exceptionType = field(5, 1, byteValue);
        if (bit(7, byteValue)) {
            exceptionType += field(4, 0, readTraceByte()) << 5;
        }
        
        AddressRegister addressRegister = null;
        if (encoding == 1) {
            addressRegister = readAddressOrContextPacket(readTraceByte(), read, false);
        } else if (encoding == 2) {
            addressRegister = readAddressOrContextPacket(readTraceByte(), read, true);
        }
        
        if (read) {
            conditionalFlush();
            if (encoding != 0) {
                checkReturnStack();
            }
            emitP0Element(new ExceptionElement(exceptionType, addressRegister));
        }
    }
    
    // ---- Context tracing ---- //
    
    // A Context packet indicates that the trace unit has generated a Context element.
    // A Context element contains information about the context that instructions are being executed in.
    // header = 0b1000000x
    protected AddressRegister contextPacket(int headerByte, boolean read, boolean process) throws TraceCorruptedException, TraceDecodeStopException {
        int field = field(2, 0, headerByte);
        AddressRegister address = null;
        switch (field) {
        	// ---- Context packet ---- //
        	// case 1 -> Context instruction trace packet
        	// A context packet indicates that the trace unit has generated a Context element. 
        	// A Context element contains information about the context that instructions are being executed in.
            case 1: {
                readContextInfo(read);
                break;
            }
            // ---- Address with Context ---- //
            // case 2~3, 5~6 -> Address with Context instruction trace packets
            // If , for the next instruction that is executed by the PE, the address cannot be inferred and the context has changed,
            // then an Address with Context packet might be output. An Address with Context packet therefore indicates that 
            // the trace unit has generated a Context element plus an Address element.
            case 2: {
                address = read32BitArmAddress(read); // 32-bit Long IS0 Address
                readContextInfo(read);
                break;
            }
            case 3: {
                address = read32BitThumbAddress(read); // 32-bit Long IS1 Address
                readContextInfo(read);
                break;
            }
            case 4: {
                throw new TraceCorruptedException("RESERVED ADDRESS HEADER");
            }
            case 5: {
                address = read64BitArmAddress(read); // 64-bit Long IS0 Address
                readContextInfo(read);
                break;
            }
            case 6: {
                address = read64BitThumbAddress(read); // 64-bit Long IS1 Address
                readContextInfo(read);
                break;
            }
            case 7: {
                throw new TraceCorruptedException("RESERVED ADDRESS HEADER");
            }
        }
        
        if (read && process && address != null) {
            processAddress(address);
        }
        return address;
    }
    
    // An Address with Context packet indicates that the trace unit has generated a Context element plus an Address element.
    // header = 0b10000010 ~ 0b10000111
    private AddressRegister readAddressOrContextPacket(int headerByte, boolean read, boolean process) throws TraceCorruptedException, TraceDecodeStopException {
        if (PacketType.Context.matches(headerByte)) {
            return contextPacket(headerByte, read, process);
        }
        if (PacketType.Address.matches(headerByte)) {
            AddressRegister address = readAddressPacket(headerByte, read);
            if (process) {
                processAddress(address);
            }
            return address;
        }
        
        throw new TraceCorruptedException("EXPECTING ADDRESS FIELD IN EXCEPTION PACKET");
    }
    
    private void readContextInfo(boolean read) throws TraceDecodeStopException {
    	int informationByte = readTraceByte();
    	
    	int exceptionLevel = field(1, 0, informationByte);
    	boolean sixtyFoutBit = bit(4, informationByte);
    	boolean nonSecure = bit(5, informationByte);
    	boolean vmidTraced = bit(6, informationByte);
    	boolean contextIDTraced = bit(7, informationByte);
    	int vmid = vmidTraced ? readVMIDBytes() : 0;
    	long contextID = contextIDTraced ? readContextIDBytes() : 0L;
    	
    	if (read) {
    		if (contextIDTraced) {
    			setContextID(contextID);
    		}
    		if (vmidTraced) {
    			setVMID(vmid);
    		}
    		
    		mLastContext = new ContextElement(contextID, vmid, exceptionLevel, nonSecure, sixtyFoutBit);
    	}
	}
    
    protected int readVMIDBytes() throws TraceDecodeStopException {
    	int newVMID = 0;
    	for (int i = 0; i < mVMIDBytes; i++) {
    		int byteValue = readTraceByte();
    		newVMID = (int)(newVMID | (byteValue & 0xff) << i * 8);
    	}
    	
    	return newVMID;
	}
    
    // ---- utility functions ---- //
    
    void processAddress(AddressRegister address) {
    	if (address != null && mLastContext != null) {
    		mNonSecure = mLastContext.isNonSecure();
    		mExceptionLevel = mLastContext.getExceptionLevel();
    		mHypervisorMode = (mExceptionLevel == 2 && mNonSecure);
    		mSixtyFourBit = mLastContext.isSixtyFoutBit();
        
    		long addressValue = address.getAddress();
    		ArtInstruction artInstruction = ArtInstruction.ArtInstructions.get(addressValue);
    		if (artInstruction == null) {
    			MemoryBlockOwner owner = MemoryMapResolver.getSingleInstance().getOwnerOfAddress(addressValue);
    			artInstruction = ArtInstruction.UNKNOW; // by default
    			if (owner == MemoryBlockOwner.App)
    				artInstruction = ArtInstruction.AppInstruction;
    			if (owner == MemoryBlockOwner.Sys)
    				artInstruction = ArtInstruction.SysInstruction;
    		}
    		mCurrentArtInstruction = artInstruction;
    	}
    }
    
    private void updateAddressRegisters(AddressRegister address) {
        mAddressRegisters[2] = mAddressRegisters[1];
        mAddressRegisters[1] = mAddressRegisters[0];
        mAddressRegisters[0] = address;
    }
    
    private AddressRegister fullAddress(long addressBytes, int instructionSet) {
        AddressRegister address = new AddressRegister(addressBytes, instructionSet);
        updateAddressRegisters(address);
        return address;
    }
    
    // E Atom occurs when the instruction is a taken branch or is a load or store instruction, such as:
    // * All branches or ISB instructions that are predicted as taken.
    // * All load or store instructions, when tracing of those instructions is enabled.
    boolean isETarget() {
        if (isNTarget()) {
            return true;
        }
        
        assert mP0Load == mP0Store;
        return mP0Load && mP0Store && mCurrentArtInstruction.isMemoryAccess();
    }
    
    // N Atom occurs when the instruction is a not taken branch, such as:
    // * All branches or ISB instructions that are predicted as not taken.
    boolean isNTarget() {
        if (mCurrentArtInstruction == null) {
            return true;
        }
        boolean ret = false;
        ret = ret || mCurrentArtInstruction == ArtInstruction.AppInstruction;
        ret = ret || mCurrentArtInstruction == ArtInstruction.SysInstruction;
        ret = ret || mCurrentArtInstruction == ArtInstruction.UNKNOW;
        return ret || mCurrentArtInstruction.isBranch() || mCurrentArtInstruction.isISB();
    }
    
    protected void handleAtom(boolean e) throws TraceCorruptedException, TraceDecodeStopException {
        handleAtom(e ? 1 : 0);
    }
    
    private void handleAtom(int type) throws TraceCorruptedException, TraceDecodeStopException {
    	emitP0Element(new AtomElement(type));
	}
    
    @Override
    protected ITraceException getTraceException(int exceptionNumber) {
        return TraceExceptionNonMClassETMv4.get(exceptionNumber);
    }
    
    private int normalizeP0ElementQueueIndex(int in) {
        return (in + mP0KeyMax) % mP0KeyMax;
    }
    
    public ETMv4Decoder() {
        super();
        mAddressRegisters = new AddressRegister[3];
        mReturnStack = new ETMv4ReturnStack();
        mOutputDelayQueue = new LinkedBlockingQueue<TraceRecord>();
        mPacketLookupTable = new PacketType[256];
        for (int headerByte = 0; headerByte < 256; headerByte++) {
            PacketType packetType = PacketType.find(headerByte);
            if (packetType == null) {
                throw new NullPointerException();
            }
            mPacketLookupTable[headerByte] = packetType;
        }
        int numP0Keys = 0; // TRCIDR9 (Cortex-A53 -> 0, Cortex-A72 -> 0)
        mP0KeyMax = ((numP0Keys == 0) ? 1 : numP0Keys);
        mMaxSpecDepth = 0; // TRCIDR8 (Cortex-A53 -> 0, Cortex-A72 -> 0) ;
        mCommitOpt = true; // TRCIDR0.COMMOPT (Cortex-A53 -> ?, Cortex-A72 -> 1)
        mVMIDBytes = 4;
        mP0ElementQueue = new P0Element[mP0KeyMax];
        mP0Key = 0;
    }
    
    private void emitP0Element(P0Element element) throws TraceCorruptedException, TraceDecodeStopException {
        if (mMaxSpecDepth != 0) {
            if (mCurrentSpeculationDepth >= mMaxSpecDepth) {
                commitOldestElement();
            }
            mCurrentSpeculationDepth += 1;
        }
        
        mP0ElementQueue[mP0Key] = element;
        if (mMaxSpecDepth == 0) {
            commitElement(element);
        }
        
        mP0Key = normalizeP0ElementQueueIndex(mP0Key + 1);
    }
    
    private void commitOldestElement() throws TraceCorruptedException, TraceDecodeStopException {
        int oldestElement = normalizeP0ElementQueueIndex(mP0Key - mCurrentSpeculationDepth);
        commitElement(mP0ElementQueue[oldestElement]);
        mP0ElementQueue[oldestElement] = null;
        mCurrentSpeculationDepth -= 1;
    }
    
    private void commitElement(P0Element p0Element) throws TraceCorruptedException, TraceDecodeStopException {
        if (p0Element != null)
            p0Element.commit();
        
        processDelayQueue();
    }
    
    @Override
    protected void process(boolean findASync) throws TraceDecodeStopException {
        try {
            while (true) {
                if (findASync)
                    findASync(ASYNC_ZERO_COUNT);
                        
                try {
                	findTraceInfo(MAX_TRACE_INFO_SKIP);
                	processPackets();
                } catch (TraceCorruptedException tce) {
                	System.out.println(tce);
                	addTraceRecord(new TraceErrorRecord(tce));
                }
            }
        } catch (TraceDecodeEndOfBufferException teobe) {
            System.out.println(teobe);
        	flushDelayQueue();
            throw teobe;
        }
    }
    
    private int getNextPacketHeader() throws TraceDecodeEndOfBufferException, TraceDecodeIOException {
		return readTraceByte();
	}
    
    // Trace Info packet
 	private void findTraceInfo(int maxSkipPackets) throws TraceDecodeStopException, TraceCorruptedException {
        int skippedCount = 0;
        do {
            int byteValue = getNextPacketHeader();
            PacketType packetType = mPacketLookupTable[byteValue];
            if (packetType == PacketType.TraceInfo) {
                packetType.read(this, byteValue);
                return;
            }
            
            try {
                packetType.skip(this, byteValue);
            } catch (TraceCorruptedException tce) {
            	/* null */
            }
            
            skippedCount++;
        } while (skippedCount <= maxSkipPackets);
        
        throw new TraceCorruptedException("TRACE INFO NOT FOUND");
    }
 	
 	private void processPackets() throws TraceDecodeStopException, TraceCorruptedException {
        while (true) {
            int nextPacketHeader = getNextPacketHeader();
            mPacketLookupTable[nextPacketHeader].read(this, nextPacketHeader);
        }
    }
 	
 	@Override
    protected void clearDecodeState() {
        super.clearDecodeState();
        clearAddressRegisters();
    }
 	
 	protected void clearAddressRegisters() {
        mAddressRegisters[0] = new AddressRegister(0L, 0);
        mAddressRegisters[1] = new AddressRegister(0L, 0);
        mAddressRegisters[2] = new AddressRegister(0L, 0);
    }
 	
 	protected void flushDelayQueue() throws TraceDecodeStopException {
        for (TraceRecord traceRecord : mOutputDelayQueue) {
            super.addTraceRecord(traceRecord);
        }
        mOutputDelayQueue.clear();
    }
    
    private void processDelayQueue() throws TraceDecodeStopException {
        while (!mOutputDelayQueue.isEmpty()) {
            TraceRecord record = mOutputDelayQueue.peek();
            if (record instanceof ArtInstructionRecord) {
                ArtInstructionRecord instructionRecord = (ArtInstructionRecord) record;
                boolean canceled = instructionRecord.isCanceled();
                boolean committed = instructionRecord.isCommitted();
                if (!canceled && !committed) {
                    break;
                }
            }
            super.addTraceRecord(mOutputDelayQueue.poll());
        }
    }
    
    void checkReturnStack() throws TraceCorruptedException {
        if (mCurrentArtInstruction == null) {
            AddressRegister returnAddress = mReturnStack.popReturnStack();
            if (returnAddress == null) {
                throw new TraceCorruptedException("EMPTY_RETURN_ADDRESS_STACK");
            }
            
            processAddress(returnAddress);
        }
    }
    
    @Override
    protected void flush() throws TraceDecodeStopException {}
    
    enum PacketType {
		// Extension packets
        Extension(0, "b00000000") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
                if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS EXTENSION");
            	
            	int firstPayloadByte = decoder.readTraceByte();
                switch (firstPayloadByte) {
                    case 0: {
                    	if (Configuration.DEBUG)
                    		System.out.print(" -> " + "PROCESS ASYNC" + "\n");
                    	
                    	decoder.processASyncPacket(read);
                        break;
                    }
                    case 3: {
                    	if (Configuration.DEBUG)
                    		System.out.print(" -> " + "PROCESS DISCARD" + "\n");
                    	
                    	decoder.processDiscardPacket(read);
                        break;
                    }
                    case 5: {
                    	if (Configuration.DEBUG)
                    		System.out.print(" -> " + "PROCESS OVERFLOW" + "\n");
                    	
                    	if (Configuration.ArtMethodTracingUnpack)
                    		InvocationChainBuilder.handleArtMethodTracing(null);
                    	
                    	decoder.processOverflowPacket(read);
                        break;
                    }
                }
            }
        },
        // A Trace Info packet contains information about the configuration of the trace.
        TraceInfo(1, "b00000001") {
            @Override
            public void read(ETMv4Decoder decoder, int headerByte) throws TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": READ TRACE INFO" + "\n");
            	
                int payloadControl = decoder.readVariableLengthInt();
                int traceInfo = 0; // 1 byte for ETMv4
                int p0Key = 0; // only valid when Data tracing is implemented and enabled
                int speculationDepth = 0; 
                int cycleCountThreshold = 0;
                
                if (bit(0, payloadControl)) {
                    traceInfo = decoder.readVariableLengthInt();
                }
                if (bit(1, payloadControl)) {
                    p0Key = decoder.readVariableLengthInt();
                }
                if (bit(2, payloadControl)) {
                    speculationDepth = decoder.readVariableLengthInt();
                }
                if (bit(3, payloadControl)) {
                    cycleCountThreshold = decoder.readVariableLengthInt();
                }
                if (field(31, 4, payloadControl) != 0) {
                    // "Reserved bits set in payload control field of Trace Info packet."
                }
                
                // INFO section
                // cc_enabled: This shows whether cycle counting is enabled.
                decoder.mCycleCountEnabled = bit(0, traceInfo);
                // cond_enabled: These show what is configured with regard to conditional non-branch instruction tracing.
                int conditionalEnabled = field(3, 1, traceInfo);
                // Indicating that conditional load instructions are traced.
                boolean conditionalLoad = false;
                // Indicating that conditional store instructions are traced.
                boolean conditionalStore = false;
                // Indicating that all conditional non-branch instructions are traced.
                boolean conditionalAll = false;
                switch (conditionalEnabled) {
                    case 0: {
                    	// Tracing of conditional non-branch instructions is disabled.
                        break;
                    }
                    case 1: {
                    	// Conditional load instructions are traced.
                        conditionalLoad = true;
                        break;
                    }
                    case 2: {
                    	// Conditional store instructions are traced.
                        conditionalStore = true;
                        break;
                    }
                    case 3: {
                    	// Conditional load and store instructions are traced.
                        conditionalLoad = true;
                        conditionalStore = true;
                        break;
                    }
                    case 7: {
                    	// All conditional non-branch instructions are traced.
                        conditionalLoad = true;
                        conditionalStore = true;
                        conditionalAll = true;
                        break;
                    }
                    default: {
                        // "reserved cond_enabled in Trace Info packet"
                        break;
                    }
                }
                decoder.mConditionalLoad = conditionalLoad;
                decoder.mConditionalStore = conditionalStore;
                decoder.mConditionalAll = conditionalAll;
                // p0_load: This shows whether load instructions in the trace stream are traced explicitly
                decoder.mP0Load = bit(4, traceInfo);
                // p0_store: This shows whether store instructioins in the trace stream are traced explicitly
                decoder.mP0Store = bit(5, traceInfo);
                if (field(31, 6, traceInfo) != 0) {
                    // "Reserved bits set in info field of Trace Info packet."
                }
                
                // KEY section
                if (p0Key >= decoder.mP0KeyMax) {
                	// String exceptionMsg = String.format("Error: next key value %d >= %d in Trace Info packet.", p0Key, decoder.mP0KeyMax);
                }
                decoder.mP0Key = p0Key; // should always be "0" because we disable the data tracing
                
                // SPEC section: indicates the number of p0 elements that are speculative
                decoder.mCurrentSpeculationDepth = speculationDepth;
                
                // CYCT section
                if (decoder.mCycleCountEnabled) {
                    decoder.mCycleCountThreshold = cycleCountThreshold;
                }
                
                decoder.mRawTimestamp = 0L;
                decoder.mFullTimestampRecieved = true;
                decoder.mFirstTimestampRecieved = false;
                decoder.mBinaryTimestamp = 0L;
                decoder.clearAddressRegisters();
                decoder.mContextID = 0L;
                decoder.mVMID = 0;
                decoder.mExceptionLevel = 0;
                decoder.mSecurityLevel = SecurityLevel.SECURE;
                decoder.mSixtyFourBit = false;
                decoder.mConditionCKey = 0;
                decoder.mConditionRKey = 0;
            }
            
            @Override
            public void skip(ETMv4Decoder decoder, int headerByte) throws TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": SKIP TRACE INFO" + "\n");
            	
            	// Payload control
                int payloadControl = decoder.readVariableLengthInt();
                
                // Trace Info
                if (bit(0, payloadControl)) {
                    decoder.readVariableLengthInt();
                }
                // P0 key
                if (bit(1, payloadControl)) {
                    decoder.readVariableLengthInt();
                }
                // Speculation depth
                if (bit(2, payloadControl)) {
                    decoder.readVariableLengthInt();
                }
                // Cycle count threshold
                if (bit(3, payloadControl)) {
                    decoder.readVariableLengthInt();
                }
            }
        },
        // The Timestamp instruction trace packet
        Timestamp(2, "b0000001x") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
                if (Configuration.DEBUG)
                	System.out.print(decoder.curPosition + ": PROCESS TIMESTAMP" + "\n");
            	
            	if (read) {
            		decoder.timeStampPacket();
                    // long timestamp = decoder.timeStampPacket();
                    // InvocationChainReporter.getSingleInstance().addBranchRecord(timestamp);
                } else {
                    decoder.skipTimeStampPacket();
                }
            	
                boolean cycleCountPresent = bit(0, headerByte);
                if (cycleCountPresent) {
                    int byteValue = decoder.readTraceByte();
                    boolean cBit = bit(7, byteValue);
                    int cycleCount = field(6, 0, byteValue);
                    // at most three bytes of cycle count value
                    if (cBit) {
                        byteValue = decoder.readTraceByte();
                        cBit = bit(7, byteValue);
                        cycleCount |= field(6, 0, byteValue) << 7;
                        if (cBit) {
                            byteValue = decoder.readTraceByte();
                            cycleCount |= byteValue << 14;
                        }
                    }
                    
                    if (read) {
                        decoder.addCycles(cycleCount);
                    }
                }
            }
        },
        // The Trace On packet indicates that there has been a discontinuity in the instruction trace stream.
        TraceOn(3, "b00000100") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (read) {
            		if (Configuration.DEBUG)
            			System.out.print(decoder.curPosition + ": PROCESS TRACE ON" + "\n");
            		
                    decoder.addTraceRecord(new TraceInfoRecord("TRACING_ENABLED_1"));
                    decoder.conditionalFlush();
                }
            }
        },
        // The Function Return packet indicates the occurrence of a Function Return element.
        // The Function Return packet is only generated for an ARMv8-M PE, and only when data tracing is enabled.
        FunctionReturn(4, "b00000101") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
                if (Configuration.DEBUG)
                	System.out.print(decoder.curPosition + ": PROCESS FUNCTION RETURN" + "\n");
            	
            	throw new TraceCorruptedException("UNSUPPORTED FUNCTION RETURN PACKET");
            }
        },
        // The Exception instruction trace packet
        Exception(5, "b00000110") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS EXCEPTION(P0 Element)" + "\n");
            	
            	decoder.exceptionPacket(headerByte, read);
            }
        },
        // The Exception Return packet
        ExceptionReturn(6, "b00000111") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS EXCEPTION RETURN" + "\n");
            	
            	if (read) {
                    decoder.addInfoRecord("RETURN_FROM_EXCEPTION_1");
                }
            }
        },
        Resynchronization(7, "b00001000") {
        	@Override
        	public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
        		if (read) {
        			decoder.clearDecodeState();
        		}
        	}
        },
        Reserved_b000010xx(8, "b000010xx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS RESERVED_B000010XX" + "\n");
            	
            	throw new TraceCorruptedException("RESERVED PACKET");
            }
        },
        // The Cycle Count packets (format 1 & format 2)
        CycleCounting12(9, "b000011xx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CYCLE COUNTING12" + "\n");
            	
            	boolean format1 = bit(1, headerByte);
                int commitCount = 0;
                int cycleCount = 0;
                if (format1) {
                    boolean unknownCycleCount = bit(0, headerByte);
                    if (!decoder.getCommitOpt()) {
                        commitCount = decoder.readVariableLengthInt();
                    }
                    if (!unknownCycleCount) {
                        cycleCount = decoder.readVariableLengthInt();
                    }
                } else {
                    boolean f = bit(0, headerByte);
                    int payload = decoder.readTraceByte();
                    int aaaa = field(7, 4, payload);
                    int bbbb = field(3, 0, payload);
                    if (f) {
                        commitCount = decoder.getMaxSpecDepth() + aaaa - 15;
                    } else {
                        commitCount = aaaa + 1;
                    }
                    cycleCount = bbbb;
                }
                
                if (read) {
                	decoder.emitCycleCounting(commitCount, cycleCount);
                }
            }
        },
        // The Cycle Count packet (format 3)
        CycleCounting3(10, "b0001xxxx") {
        	@Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
        		if (Configuration.DEBUG)
        			System.out.print(decoder.curPosition + ": PROCESS CYCLE COUNTING3" + "\n");
        		
        		if (read) {
                    int aa = field(3, 2, headerByte);
                    int bb = field(1, 0, headerByte);
                    int commit = 0;
                    int cycleCount = 0;
                    if (!decoder.getCommitOpt()) {
                        commit = aa + 1;
                    }
                    cycleCount = bb;
                    
                    decoder.emitCycleCounting(commit, cycleCount);
                }
        	}
        },
        // A numbered data synchronization marker provides an approximate correlation of the instruction stream with the data trace stream.
        DataSyncMarkers1(11, "b00100xxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS DATA SYNC MARKERS1" + "\n");
            	
            	if (read) {
                    int dataSyncMarkerNumber = field(2, 0, headerByte);
                    decoder.emitNumberedDataSyncMarker(dataSyncMarkerNumber);
                }
            }
        },
        // When used in conjunction with Numbered Data Synchronization Marker packets, this packet type provides an accurate correlation of the data trace stream with the instruction trace stream.
        DataSyncMarkers2(12, "b001010xx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS DATA SYNC MARKERS2" + "\n");
            	
            	if (read) {
                    for (int eCount = field(2, 0, headerByte), i = 0; i < eCount; ++i) {
                        decoder.handleAtom(1);
                    }
                    decoder.emitSyncMarkerElement();
                }
            }
        }, 
        // When used in conjunction with Numbered Data Synchronization Marker packets, this packet type provides an accurate correlation of the data trace stream with the instruction trace stream.
        DataSyncMarkers3(13, "b00101100") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS DATA SYNC MARKERS3" + "\n");
            	
            	if (read) {
                    for (int eCount = field(2, 0, headerByte), i = 0; i < eCount; ++i) {
                        decoder.handleAtom(1);
                    }
                    decoder.emitSyncMarkerElement();
                }
            }
        }, 
        // The Commit instruction trace packet
        CommitPacket(14, "b00101101") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS COMMIT PACKET" + "\n");
            	
            	int commit = decoder.readVariableLengthInt();
                if (read) {
                	decoder.commit(commit);
                }
            }
        }, 
        // The Cancel Format 1 instruction trace packet
        CancelFormat1(15, "b0010111x") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CANCEL FORMAT1" + "\n");
            	
            	boolean misPredict = bit(0, headerByte);
                int cancel = decoder.readVariableLengthInt();
                if (read) {
                    decoder.cancel(cancel, misPredict);
                }
            }
        }, 
        // The Cancel Format 2 instruction trace packet
        CancelFormat2(16, "b001101xx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CANCEL FORMAT2" + "\n");
            	
            	if (read) {
                    int a = field(1, 0, headerByte);
                    switch(a) {
                    	// One E Atom element has occurred.
                        case 1: {
                            decoder.handleAtom(1);
                            break;
                        }
                        // Two E Atom elements have occurred.
                        case 2: {
                            decoder.handleAtom(1);
                            decoder.handleAtom(1);
                            break;
                        }
                        // One N Atom element has occurred.
                        case 3: {
                            decoder.handleAtom(0);
                            break;
                        }
                    }
                    
                    decoder.cancel(1, true);
                }
            }
        }, 
        // The Cancel Format 3 instruction trace packet
        CancelFormat3(17, "b00111xxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CANCEL FORMAT3" + "\n");
            	
            	if (read) {
                    boolean a = bit(0, headerByte);
                    int cancel = 2 + field(2, 1, headerByte);
                    
                    if (a)
                        decoder.handleAtom(1);
                                       
                    decoder.cancel(cancel, true);
                }
            }
        }, 
        // The Mispredict instruction trace packet
        MispredictPacket(18, "b001100xx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS MISPREDICT PACKET" + "\n");
            	
            	if (read) {
                    int a = field(1, 0, headerByte);
                    switch (a) {
                        case 1: {
                            decoder.handleAtom(1);
                            break;
                        }
                        case 2: {
                            decoder.handleAtom(1);
                            decoder.handleAtom(1);
                            break;
                        }
                        case 3: {
                            decoder.handleAtom(0);
                            break;
                        }
                    }
                    decoder.mispredict();
                }
            }
        }, 
        ConditionalInstructionFormat1ReservedPacket(19, "b01100xxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL INSTRUCTION FORMAT1 RESERVED PACKET" + "\n");
            	
            	throw new TraceCorruptedException("RESERVED PACKET");
            }
        }, 
        // The Conditional Instruction Format 1 instruction trace packet
        ConditionalInstructionFormat1Packet(20, "b01101100") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL INSTRUCTION FORMAT1 PACKET" + "\n");
            	
            	int key = decoder.readVariableLengthInt();
                if (read) {
                    decoder.processConditionKey(key);
                }
            }
        }, 
        // The Conditional Instruction Format 2 instruction trace packet
        ConditionalInstructionFormat2Packet(21, "b010000xx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL INSTRUCTION FORMAT2 PACKET" + "\n");
            	
            	if (read) {
                    int ci = field(1, 0, headerByte);
                    decoder.processConditionalInstructionFormat2Packet(ci);
                }
            }
        }, 
        // The Conditional Instruction Format 3 instruction trace packet
        ConditionalInstructionFormat3Packet(22, "b01101101") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL INSTRUCTION FORMAT3 PACKET" + "\n");
            	
            	int payloadByte = decoder.readTraceByte();
                if (read) {
                    decoder.processConditionalInstructionFormat3Packet(payloadByte);
                }
            }
        }, 
        // The Conditional Result Format 1 instruction trace packet
        ConditionalResultFormat1aPacket(23, "b0110111x") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL RESULT FORMAT1A PACKET" + "\n");
            	
            	decoder.processConditionalResultFormat1aPacket(headerByte, read);
            }
        }, 
        // The Conditional Result Format 1 instruction trace packet
        ConditionalResultFormat1bPacket(24, "b011010xx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL RESULT FORMAT1B PACKET" + "\n");
            	
            	decoder.processConditionalResultFormat1bPacket(headerByte, read);
            }
        }, 
        ConditionalResultFormat2ReservedPacket(25, "b01001x11)") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL RESULT FORMAT2 RESERVED PACKET" + "\n");
            	
            	throw new TraceCorruptedException("RESERVED PACKET");
            }
        }, 
        // The Conditional Result Format 2 instruction trace packet
        ConditionalResultFormat2Packet(26, "b01001xxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL RESULT FORMAT2 PACKET" + "\n");
            	
            	if (read) {
                    int token = field(1, 0, headerByte);
                    boolean k = bit(2, headerByte);
                    decoder.processConditionalResultFormat2Packet(token, k);
                }
            }
        }, 
        // The Conditional Result Format 3 instruction trace packet
        ConditionalResultFormat3Packet(27, "b0101xxxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL RESULT FORMAT3 PACKET" + "\n");
            	
            	decoder.processConditionalResultFormat3Packet(headerByte, read);
            }
        }, 
        ConditionalResultFormat4ReservedPacket(28, "b01000111") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL RESULT FORMAT4 RESERVED PACKET" + "\n");
            	
            	throw new TraceCorruptedException("RESERVED PACKET");
            }
        }, 
        // The Conditional Result Format 4 instruction trace packet
        ConditionalResultFormat4Packet(29, "b010001xx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS CONDITIONAL RESULT FORMAT4 PACKET" + "\n");
            	
            	decoder.processConditionalResultFormat4Packet(headerByte, read);
            }
        }, 
        IgnorePacketInstStream(30, "b01110000") {
        	/* null */
        }, 
        // The Event tracing instruction trace packet
        EventTrace(31, "b0111xxxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS EVENT TRACE" + "\n");
            	
            	decoder.processEventPacket(headerByte, read);
            }
        }, 
        // The Context instruction trace packet & The Address with Context instruction trace packets
        Context(32, "b10000xxx") {
            @Override
            public final void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	AddressRegister address = decoder.contextPacket(headerByte, read, read);
            	if (address != null) {
            		if (Configuration.DEBUG)
            			System.out.print(decoder.curPosition + ": PROCESS CONTEXT" + " -> " + Long.toHexString(address.getAddress()) + "\n");
            		
            		if (Configuration.ArtMethodTracingUnpack) {
            			assert address != null;
            			InvocationChainBuilder.handleArtMethodTracing(address);
            		}
            	}
            }
        }, 
        Reserved_b10001xxx(33, "b10001xxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS RESERVED_B10001XXX" + "\n");
            	
            	throw new TraceCorruptedException("RESERVED PACKET");
            }
        }, 
        // Exact Match Address & Short Address & Long Address packet
        Address(34, "b1001xxxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	AddressRegister address = decoder.readAddressPacket(headerByte, read);
            	assert address != null;
            	
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS ADDRESS -> " + Long.toHexString(address.getAddress()));
            	
            	if (Configuration.ArtMethodTracingUnpack) {
            		InvocationChainBuilder.handleArtMethodTracing(address);
            	}
            	
            	if (read) {
                    decoder.processAddress(address);
                }
            }
        }, 
        Reserved_b1011xxxx(35, "b1011xxxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS RESERVED_B1011XXXX" + "\n");
            	
            	throw new TraceCorruptedException("RESERVED PACKET");
            }
        }, 
        // The Q instruction trace packet (commonly, it should not be occurred)
        QPacket(36, "b1010xxxx") {
            @Override
            public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
            	AddressRegister address = decoder.processQPacket(headerByte, read);
            	
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": PROCESS QPACKET(P0 Element)" + " -> " + Long.toHexString(address.getAddress()) + "\n");
            }
        }, 
        // The Atom instruction trace packets
        // * All direct branch instructions
        // * All indirect branch instructions
        // * Instruction Synchronization Barrier
        // * Load instructions, if data tracing is supported and the tracing of data loads is enabled
        // * Store instructions, if data tracing is supported and the tracing of data stores is enabled
        Atoms(37, "b11xxxxxx") {
            @Override
            public void read(ETMv4Decoder decoder, int headerByte) throws TraceCorruptedException, TraceDecodeStopException {
            	if (Configuration.DEBUG)
            		System.out.print(decoder.curPosition + ": READ ATOMS(P0 Element)");
            	
            	Label_outer: {
                switch (mAtomPacketDecodeTable[headerByte]) {
                    case 1: {
                    	if (Configuration.DEBUG)
                       		System.out.print(" -> " + "Handle 1 ATOM" + "\n");
                        
                    	decoder.handleAtom(bit(0, headerByte));
                        break;
                    }
                    case 2: {
                       	if (Configuration.DEBUG)
                       		System.out.print(" -> " + "Handle 2 ATOMs" + "\n");
                        
                       	decoder.handleAtom(bit(0, headerByte));
                       	decoder.handleAtom(bit(1, headerByte));
                        break;
                    }
                    case 3: {
                       	if (Configuration.DEBUG)
                    		System.out.print(" -> " + "Handle 3 ATOMs" + "\n");
                        
                       	decoder.handleAtom(bit(0, headerByte));
                       	decoder.handleAtom(bit(1, headerByte));
                       	decoder.handleAtom(bit(2, headerByte));
                        break;
                    }
                    case 4: {
                       	if (Configuration.DEBUG)
                       		System.out.print(" -> " + "Handle 4 ATOMs" + "\n");
                           
                       	switch (field(1, 0, headerByte)) {
                            case 0: {
                            	decoder.handleAtom(N_ATOM);
                                decoder.handleAtom(E_ATOM);
                                decoder.handleAtom(E_ATOM);
                                decoder.handleAtom(E_ATOM);
                                break Label_outer;
                            }
                            case 1: {
                            	decoder.handleAtom(N_ATOM);
                            	decoder.handleAtom(N_ATOM);
                            	decoder.handleAtom(N_ATOM);
                            	decoder.handleAtom(N_ATOM);
                                break Label_outer;
                            }
                            case 2: {
                            	decoder.handleAtom(N_ATOM);
                            	decoder.handleAtom(E_ATOM);
                            	decoder.handleAtom(N_ATOM);
                            	decoder.handleAtom(E_ATOM);
                            	break Label_outer;
                            }
                            case 3: {
                                decoder.handleAtom(E_ATOM);
                                decoder.handleAtom(N_ATOM);
                                decoder.handleAtom(E_ATOM);
                                decoder.handleAtom(N_ATOM);
                                break Label_outer;
                            }
                            default: {
                                break Label_outer;
                            }
                        }
                    }
                    case 5101: {
                    	if (Configuration.DEBUG)
                       		System.out.print(" -> " + "Handle 5 ATOMs" + "\n");
                        
                    	decoder.handleAtom(N_ATOM);
                    	decoder.handleAtom(E_ATOM);
                    	decoder.handleAtom(E_ATOM);
                    	decoder.handleAtom(E_ATOM);
                    	decoder.handleAtom(E_ATOM);
                        break;
                    }
                    case 5001: {
                    	if (Configuration.DEBUG)
                      		System.out.print(" -> " + "Handle 5 ATOMs" + "\n");
                        
                    	decoder.handleAtom(N_ATOM);
                    	decoder.handleAtom(N_ATOM);
                    	decoder.handleAtom(N_ATOM);
                    	decoder.handleAtom(N_ATOM);
                    	decoder.handleAtom(N_ATOM);
                        break;
                    }
                    case 5010: {
                     	if (Configuration.DEBUG)
                       		System.out.print(" -> " + "Handle 5 ATOMs" + "\n");
                        
                     	decoder.handleAtom(N_ATOM);
                     	decoder.handleAtom(E_ATOM);
                     	decoder.handleAtom(N_ATOM);
                     	decoder.handleAtom(E_ATOM);
                     	decoder.handleAtom(N_ATOM);
                        break;
                    }
                    case 5011: {
                      	if (Configuration.DEBUG)
                       		System.out.print(" -> " + "Handle 5 ATOMs" + "\n");
                        
                      	decoder.handleAtom(E_ATOM);
                      	decoder.handleAtom(N_ATOM);
                      	decoder.handleAtom(E_ATOM);
                      	decoder.handleAtom(N_ATOM);
                      	decoder.handleAtom(E_ATOM);
                        break;
                    }
                    default: {
                     	if (Configuration.DEBUG)
                       		System.out.print(" -> " + "Handle multiple ATOMs" + "\n");
                            
                       	for (int count = field(4, 0, headerByte), i = 0; i <= count + 2; ++i) {
                            decoder.handleAtom(E_ATOM);
                        }
                        boolean isE = !bit(5, headerByte);
                        decoder.handleAtom(isE);
                        break;
                    }
                }
                }
            }
        }; // packet type end
        
        private int mMask;
        private int mValue;
        
        private PacketType(int index, String pattern) {
            int mask = 0;
            int value = 0;
            char[] charArray = pattern.toCharArray();
            int length = charArray.length;
            
            for (int i = 0; i < length; i++) {
                char c = charArray[i];
                switch (c) {
                    case '0': {
                        mask = (mask << 1) + 1;
                        value = (value << 1) + 0;
                        break;
                    }
                    case '1': {
                        mask = (mask << 1) + 1;
                        value = (value << 1) + 1;
                        break;
                    }
                    case 'X':
                    case 'x': {
                        mask = (mask << 1) + 0;
                        value = (value << 1) + 0;
                        break;
                    }
                }
            }
            
            mMask = mask;
            mValue = value;
        }
        
        private boolean matches(int headerByte) {
            return (headerByte & mMask) == mValue;
        }
        
        public static PacketType find(int headerByte) {
            PacketType[] values = values();
            int length = values.length;
            
            for (int i = 0; i < length; i++) {
                PacketType packetType = values[i];
                if (packetType.matches(headerByte)) {
                    return packetType;
                }
            }
            
            return null;
        }
        
        public void process(ETMv4Decoder decoder, int headerByte, boolean read) throws TraceCorruptedException, TraceDecodeStopException {
        	/* null */
        }
        
        public void read(ETMv4Decoder decoder, int headerByte) throws TraceDecodeStopException, TraceCorruptedException {
            process(decoder, headerByte, true);
        }
        
        public void skip(ETMv4Decoder decoder, int headerByte) throws TraceDecodeStopException, TraceCorruptedException {
            process(decoder, headerByte, false);
        }
    }
    
    // declaration of SecurityLevel
    enum SecurityLevel {
        SECURE("SECURE", 0), 
        NONSECURE("NONSECURE", 1);
        
        private SecurityLevel(String label, int flag) {}
    }
    
    // declaration of AddressRegister class and its functions
    public static class AddressRegister implements Cloneable {
        private long mAddress;
        private int mInstructionSet;
        
        public AddressRegister(long address, int instructionSet) {
            mAddress = address;
            mInstructionSet = instructionSet;
        }
        
        public AddressRegister(AddressRegister oldAddress, long pack, int bits, int instructionSet) throws TraceCorruptedException {
            int shift = 0;
            switch (instructionSet) {
                case IS_ARM: {
                    shift = 2;
                    break;
                }
                case IS_THUMB: {
                    shift = 1;
                    break;
                }
                default: {
                    throw new TraceCorruptedException("RESERVED INSTRUCTION SET ENCODING");
                }
            }
            
            bits += shift;
            if (bits > 64) {
                bits = 64;
            }
            
            pack <<= shift;
            long mask = -1L >>> 64 - bits;
            
            mAddress = (pack & mask) | (~mask & oldAddress.getAddress());
            mInstructionSet = instructionSet;
        }
        
        protected Object clone() throws CloneNotSupportedException {
            return super.clone();
        }
        
        public long getAddress() {
            return mAddress;
        }
        
        public int getInstructionSet() {
            return mInstructionSet;
        }
        
        public String toString() {
            return String.format("0x%s %s", new Object[] {Long.toHexString(mAddress), mInstructionSet == 0 ? "ARM" : "THUMB"});
        }
    }
    
    // declaration of P0Element class and its functions
    public abstract class P0Element {
        private final ArtInstruction mSaveCurrentArtInstruction;
        protected final ArrayList<ArtInstructionRecord> mRecords;
        
        protected P0Element() {
            mRecords = new ArrayList<ArtInstructionRecord>();
            mSaveCurrentArtInstruction = mCurrentArtInstruction;
        }
        
        public void cancel() {
            for (ArtInstructionRecord record : mRecords) {
            	record.setCanceled();
            }
            
            mCurrentArtInstruction = mSaveCurrentArtInstruction;
            mRecords.clear();
        }
        
        public void commit() {
            for (ArtInstructionRecord record : mRecords) {
                record.setCommitted();
            }
            
            mRecords.clear();
        }
    }
    
    // declaration of AtomElement class and its functions
    public class AtomElement extends P0Element {
        private int mAtomType;
        private ArtInstructionRecord mLastRecord;
        
        public AtomElement(int type) throws TraceCorruptedException {
        	mAtomType = type;
        	
            switch (mAtomType) {
                case 1: {
                    checkReturnStack();
                    
                    while (!isETarget()) {
                        mRecords.add(addRecord());
                        mCurrentArtInstruction = getNextArtInstruction();
                    }
                    
                    if (mCurrentArtInstruction.isBranch() && mCurrentArtInstruction.isLink()) {
                    	ArtInstruction nextArtInstruction = getNextArtInstruction();
                        Long address = nextArtInstruction.getVirtualAddress();
                        mReturnStack.pushReturnAddress(new AddressRegister(address, 0));
                    }
                    
                    mLastRecord = addRecord();
                    mRecords.add(mLastRecord);
                    pass();
                    break;
                }
                case 0: {
                    checkReturnStack();
                    
                    while (!isNTarget()) {
                        mRecords.add(addRecord());
                        mCurrentArtInstruction = getNextArtInstruction();
                    }
                    
                    mLastRecord = addRecord();
                    mRecords.add(mLastRecord);
                    mCurrentArtInstruction = getNextArtInstruction();
                    break;
                }
            }
        }
        
        public void commit() {
            super.commit();
            if (mAtomType == 0) {
                mLastRecord.setFailed();
            }
        }
        
        private ArtInstruction getNextArtInstruction() {
        	if (mCurrentArtInstruction == ArtInstruction.AppInstruction)
        		return ArtInstruction.AppInstruction;
        	if (mCurrentArtInstruction == ArtInstruction.SysInstruction)
        		return ArtInstruction.SysInstruction;
        	if (mCurrentArtInstruction == ArtInstruction.UNKNOW)
        		return ArtInstruction.UNKNOW;
        		
        	long address = mCurrentArtInstruction.getNextVirtualAddress();
        	ArtInstruction artInstruction = ArtInstruction.ArtInstructions.get(address);
        	if (artInstruction == null) {
        		MemoryBlockOwner owner = MemoryMapResolver.getSingleInstance().getOwnerOfAddress(address);
        		artInstruction = ArtInstruction.UNKNOW; // by default
        		if (owner == MemoryBlockOwner.App)
    				artInstruction = ArtInstruction.AppInstruction;
    			if (owner == MemoryBlockOwner.Sys)
    				artInstruction = ArtInstruction.SysInstruction;
        	}
        	
            return artInstruction;
        }
        
        public void mispredict() {
            if (mAtomType == 1) {
                mAtomType = 0;
            } else {
                mAtomType = 1;
            }
            
            mLastRecord.setMispredicted();
            mCurrentArtInstruction = mLastRecord.getArtInstruction();
            if (mAtomType == 1) {
                pass();
            } else {
            	mCurrentArtInstruction = getNextArtInstruction();
            }
        }
    }
    
    // declaration of ExceptionElement class and its functions
    public class ExceptionElement extends P0Element {
        private TraceExceptionRecord mExceptionRecord;
        
        public ExceptionElement(int type, AddressRegister addressRegister) {
            ITraceException traceException = getTraceException(type);
            
            if (addressRegister != null) {
                long address = addressRegister.getAddress();
                assert(mCurrentArtInstruction != null);
                while ((mCurrentArtInstruction.getVirtualAddress() - address) != 0L) {
                    mRecords.add(addRecord());
                    if (mCurrentArtInstruction.isApplication()) {
                        addTraceRecord(new TraceWarningRecord("UNABLE_TO_DECODE" + " " + mCurrentArtInstruction.getVirtualAddress() + " " + address));
                        break;
                    }
                    if (mCurrentArtInstruction.isSystem()) {
                        addTraceRecord(new TraceWarningRecord("UNABLE_TO_DECODE" + " " + mCurrentArtInstruction.getVirtualAddress() + " " + address));
                        break;
                    }
                    if (mCurrentArtInstruction.isUnknow()) {
                        addTraceRecord(new TraceWarningRecord("UNABLE_TO_DECODE" + " " + mCurrentArtInstruction.getVirtualAddress() + " " + address));
                        break;
                    }
                    mCurrentArtInstruction = ArtInstruction.ArtInstructions.get(mCurrentArtInstruction.getNextVirtualAddress());
                    if (mCurrentArtInstruction == null)
                    	break;
                }
            }
            
            if (type != 0) {
            	mExceptionRecord = new TraceExceptionRecord(traceException);
                addTraceRecord(mExceptionRecord);
            }
            
            processAddress(addressRegister);
        }
        
        public void cancel() {
            super.cancel();
            mExceptionRecord.setCanceled();
        }
    }
    
    // declaration of QElement class and its functions
    public class QElement extends P0Element {
        public QElement(int count, AddressRegister addressRegister) throws TraceCorruptedException {
            checkReturnStack();
            for (int i = 0; i < count; i++) {
                mRecords.add(addRecord());
                executeInstruction();
            }
            
            if (addressRegister != null)
                processAddress(addressRegister);
        }
    }
    
    // declaration of ContextElement class and its functions
    private class ContextElement {
    	private final long mContextID;
    	private final int mVMID;
    	private final int mExceptionLevel;
    	private final boolean mNonSecure;
    	private final boolean mSixtyFoutBit;
      
    	public ContextElement(long contextID, int vmid, int exceptionLevel, boolean nonSecure, boolean sixtyFoutBit) {
    		mContextID = contextID;
    		mVMID = vmid;
    		mExceptionLevel = exceptionLevel;
    		mNonSecure = nonSecure;
    		mSixtyFoutBit = sixtyFoutBit;
    	}
      
    	@SuppressWarnings("unused")
		public long getContextID() {
    		return mContextID;
    	}
      
    	@SuppressWarnings("unused")
		public int getVMID() {
    		return mVMID;
    	}
      
    	public int getExceptionLevel() {
    		return mExceptionLevel;
    	}
      
    	public boolean isNonSecure() {
    		return mNonSecure;
    	}
      
    	public boolean isSixtyFoutBit() {
    		return mSixtyFoutBit;
    	}
      
    	public String toString() {
    		return String.format("ContextID:%d, ExceptionLevel:%d, VMID:%d, NS:%b, 64b:%b", new Object[] {Long.valueOf(mContextID), Integer.valueOf(mExceptionLevel), Integer.valueOf(mVMID), Boolean.valueOf(mNonSecure), Boolean.valueOf(mSixtyFoutBit)});
    	}
    }
	
    ////////////////////////////////////////
	//////// -------- main -------- ////////
    ////////////////////////////////////////
	
	public static void main(String[] args) {
		
		System.load("/home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/lib/libicodec.so");
		// System.load("/home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/lib/libVex.so");
		
		boolean isArm = false;
		boolean isAArch64 = false;
		
		// memory map
		{
			PerformanceMonitor.getMemInfo();
			MemoryMapResolver memoryResolver = MemoryMapResolver.getSingleInstance();
			memoryResolver.resolve(Configuration.MemoryMapFile);
			// memoryResolver.printExecutableMemoryBlockMap();
			PerformanceMonitor.getMemInfo();
			
			isArm = memoryResolver.inferArm();
			isAArch64 = memoryResolver.inferAArch64();
			assert isArm != isAArch64; // in normal cases, isArm and isAArch64 should be different
			
			memoryResolver.printExecutableMemoryBlockMap(); // debug
		}
		//
		
		// Debug: show the architecture of the analyzed application
		if (isArm)
			System.out.println("[Info] 32-bit instructions are traced");
		if (isAArch64)
			System.out.println("[Info] 64-bit instructions are traced");
		
		/* application-related
		{
			PerformanceMonitor.getMemInfo();
			
			MemoryMapResolver memoryResolver = MemoryMapResolver.getSingleInstance();
			HashMap<String, HashSet<MemoryBlock>> executableMemoryBlockMap = memoryResolver.getExecutableMemoryBlockMap();
			
			for (String executablePath : executableMemoryBlockMap.keySet()) {
				// We treat files under "/data/app/packageName??" as application related files.
				
				// oatdump .odex files under "/data/app/packageName??"
				if (!executablePath.startsWith("/data/app/" + Configuration.PackageName))
					continue;
				
				// oatdump .odex files in "/data/app/packageName/ ... /oat/arm??"
				if (executablePath.contains("/oat/arm") && executablePath.endsWith(".odex")) {
					String modifiedExecutablePath = "/" + executablePath.split("/")[executablePath.split("/").length - 1];
					
					String oatdumpFilePath = retrieveOatdump(Configuration.AArch64ApplicationOatDirectory, modifiedExecutablePath, ".odex");
					assert oatdumpFilePath != null;
					// System.out.println(oatdumpFilePath + " <- " + executablePath);
					
					HashSet<MemoryBlock> blocks = executableMemoryBlockMap.get(executablePath);
					assert blocks.size() == 1;
					
					OATDumpResolver oatdumpResolver = new OATDumpResolver();
					long virtualBaseOffset = 0xffffffffffffffffL;
					for (MemoryBlock block : blocks) {
						if (virtualBaseOffset == 0xffffffffffffffffL) {
							virtualBaseOffset = block.getStartAddress();
							continue;
						}
						
						if (block.getStartAddress() < virtualBaseOffset)
							virtualBaseOffset = block.getStartAddress();
					}
					oatdumpResolver.setVirtualBaseOffset(virtualBaseOffset);
					oatdumpResolver.resolve(oatdumpFilePath);
				}
			
				// objdump .so files in "/data/app/packageName/ ... /lib/arm??"
				if (executablePath.contains("/lib/arm") && executablePath.endsWith(".so")) {
					String modifiedExecutablePath = "/" + executablePath.split("/")[executablePath.split("/").length - 1];
					
					String objdumpFilePath = retrieveObjdump(Configuration.AArch64ApplicationLibDirectory, modifiedExecutablePath, ".so");
					assert objdumpFilePath != null;
					// System.out.println(objdumpFilePath + " <- " + executablePath);
					
					String objdumpHeaderFilePath = retrieveObjdumpHeader(Configuration.AArch64ApplicationLibHeaderDirectory, modifiedExecutablePath, ".so");
					assert objdumpHeaderFilePath != null;
					// System.out.println(objdumpHeaderFilePath + " <- " + executablePath);
					
					HashSet<MemoryBlock> blocks = executableMemoryBlockMap.get(executablePath);
					assert blocks.size() >= 1;
					
					OBJDumpHeaderResolver objdumpHeaderResolver = new OBJDumpHeaderResolver();
					objdumpHeaderResolver.resolve(objdumpHeaderFilePath);
		
					OBJDumpResolver objdumpResolver = new OBJDumpResolver();
					long virtualBaseOffset = 0xffffffffffffffffL;
					for (MemoryBlock block : blocks) {
						if (virtualBaseOffset == 0xffffffffffffffffL) {
							virtualBaseOffset = block.getStartAddress();
							continue;
						}
						
						if (block.getStartAddress() < virtualBaseOffset)
							virtualBaseOffset = block.getStartAddress();
					}
					objdumpResolver.setVirtualBaseOffset(virtualBaseOffset);
					objdumpResolver.setFileBaseOffset(OBJDumpHeaderResolver.OffsetSubtractionMap.get(objdumpHeaderFilePath));
					objdumpResolver.resolve(executablePath.split("/")[executablePath.split("/").length - 1].replace(".so", ""), objdumpFilePath);
				}
			}
			
			PerformanceMonitor.getMemInfo();
		}
		*/
		
		// system-related (e.g., framework oat, system library, vendor library, system bin)
		{
			if (isArm) {
				PerformanceMonitor.getMemInfo();
				
				MemoryMapResolver memoryResolver = MemoryMapResolver.getSingleInstance();
				HashMap<String, HashSet<MemoryBlock>> executableMemoryBlockMap = memoryResolver.getExecutableMemoryBlockMap();
				
				for (String executablePath : executableMemoryBlockMap.keySet()) {
					// We treat files under "/system/lib/", "/vendor/lib/", "/system/framework/arm/", and "/system/bin/" as system related files.
					if (!(executablePath.startsWith("/system/lib/") || executablePath.startsWith("/vendor/lib/") || executablePath.startsWith("/system/framework/arm/") || executablePath.startsWith("/system/bin/")))
						continue;
					
					// for saving time, filter out unrelated libraries
					if (filterSystemLibrary(executablePath))
						continue;
					
					// oatdump .oat files in "/system/framework/arm/"
					if (executablePath.startsWith("/system/framework/arm/") && executablePath.endsWith(".oat")) {
						String oatdumpFilePath = retrieveOatdump(Configuration.ArmSystemOatDirectory, executablePath, ".oat");
						assert oatdumpFilePath != null;
					
						HashSet<MemoryBlock> blocks = executableMemoryBlockMap.get(executablePath);
						assert blocks.size() == 1;
						
						OATDumpResolver oatdumpResolver = new OATDumpResolver();
						long virtualBaseOffset = 0xffffffffffffffffL;
						for (MemoryBlock block : blocks) {
							if (virtualBaseOffset == 0xffffffffffffffffL) {
								virtualBaseOffset = block.getStartAddress();
								continue;
							}
							
							if (block.getStartAddress() < virtualBaseOffset)
								virtualBaseOffset = block.getStartAddress();
						}
						oatdumpResolver.setVirtualBaseOffset(virtualBaseOffset);
						System.out.println(oatdumpFilePath + " <- " + executablePath); // debug
						oatdumpResolver.resolve(oatdumpFilePath);
					}
				
					// objdump .so files in "/system/lib/" and "vendor/lib/"
					if ((executablePath.startsWith("/system/lib/") || executablePath.startsWith("/vendor/lib/")) && executablePath.endsWith(".so")) {
						String objdumpFilePath = retrieveObjdump(Configuration.ArmSystemLibDirectory, executablePath, ".so");
						assert objdumpFilePath != null;
						
						String objdumpHeaderFilePath = retrieveObjdumpHeader(Configuration.ArmSystemLibHeaderDirectory, executablePath, ".so");
						assert objdumpHeaderFilePath != null;
					
						HashSet<MemoryBlock> blocks = executableMemoryBlockMap.get(executablePath);
						assert blocks.size() == 1;
						
						// process-1
						OBJDumpHeaderResolver objdumpHeaderResolver = new OBJDumpHeaderResolver();
						System.out.println(objdumpHeaderFilePath + " <- " + executablePath); // debug
						objdumpHeaderResolver.resolve(objdumpHeaderFilePath);
					
						// process-2
						OBJDumpResolver objdumpResolver = new OBJDumpResolver();
						long virtualBaseOffset = 0xffffffffffffffffL;
						for (MemoryBlock block : blocks) {
							if (virtualBaseOffset == 0xffffffffffffffffL) {
								virtualBaseOffset = block.getStartAddress();
								continue;
							}
							
							if (block.getStartAddress() < virtualBaseOffset)
								virtualBaseOffset = block.getStartAddress();
						}
						objdumpResolver.setVirtualBaseOffset(virtualBaseOffset);
						objdumpResolver.setFileBaseOffset(OBJDumpHeaderResolver.OffsetSubtractionMap.get(objdumpHeaderFilePath));
						System.out.println(objdumpFilePath + " <- " + executablePath); // debug
						objdumpResolver.resolve(executablePath.split("/")[executablePath.split("/").length - 1].replace(".so", ""), objdumpFilePath);
					}
					
					// objdump executable files (e.g., "/system/bin/linker")
					if (executablePath.equals("/system/bin/linker")) {
						String objdumpFilePath = retrieveObjdump(Configuration.ArmSystemBinDirectory, executablePath + ".bin", ".bin");
						assert objdumpFilePath != null;
						
						String objdumpHeaderFilePath = retrieveObjdumpHeader(Configuration.ArmSystemBinHeaderDirectory, executablePath + ".bin", ".bin");
						assert objdumpHeaderFilePath != null;
					
						HashSet<MemoryBlock> blocks = executableMemoryBlockMap.get(executablePath);
						assert blocks.size() == 1;
						
						// process-1
						OBJDumpHeaderResolver objdumpHeaderResolver = new OBJDumpHeaderResolver();
						System.out.println(objdumpHeaderFilePath + " <- " + executablePath); // debug
						objdumpHeaderResolver.resolve(objdumpHeaderFilePath);
					
						// process-2
						OBJDumpResolver objdumpResolver = new OBJDumpResolver();
						long virtualBaseOffset = 0xffffffffffffffffL;
						for (MemoryBlock block : blocks) {
							if (virtualBaseOffset == 0xffffffffffffffffL) {
								virtualBaseOffset = block.getStartAddress();
								continue;
							}
							
							if (block.getStartAddress() < virtualBaseOffset)
								virtualBaseOffset = block.getStartAddress();
						}
						objdumpResolver.setVirtualBaseOffset(virtualBaseOffset);
						objdumpResolver.setFileBaseOffset(OBJDumpHeaderResolver.OffsetSubtractionMap.get(objdumpHeaderFilePath));
						System.out.println(objdumpFilePath + " <- " + executablePath); // debug
						objdumpResolver.resolve(executablePath.split("/")[executablePath.split("/").length - 1], objdumpFilePath);
					}
				}
				
				PerformanceMonitor.getMemInfo();
			}
			
			if (isAArch64) {
				PerformanceMonitor.getMemInfo();
				
				MemoryMapResolver memoryResolver = MemoryMapResolver.getSingleInstance();
				HashMap<String, HashSet<MemoryBlock>> executableMemoryBlockMap = memoryResolver.getExecutableMemoryBlockMap();
			
				for (String executablePath : executableMemoryBlockMap.keySet()) {
					// We treat files under "/system/lib64/", "/vendor/lib64/", "/system/framework/arm64/", and "/system/bin/" as system related files.
					if (!(executablePath.startsWith("/system/lib64/") || executablePath.startsWith("/vendor/lib64/") || executablePath.startsWith("/system/framework/arm64/") || executablePath.startsWith("/system/bin/")))
						continue;
					
					// for saving time, filter out unrelated libraries
					if (filterSystemLibrary(executablePath))
						continue;
					
					// oatdump .oat files in "/system/framework/arm64/"
					if (executablePath.startsWith("/system/framework/arm64/") && executablePath.endsWith(".oat")) {
						String oatdumpFilePath = retrieveOatdump(Configuration.AArch64SystemOatDirectory, executablePath, ".oat");
						assert oatdumpFilePath != null;
					
						HashSet<MemoryBlock> blocks = executableMemoryBlockMap.get(executablePath);
						assert blocks.size() == 1;
						
						OATDumpResolver oatdumpResolver = new OATDumpResolver();
						long virtualBaseOffset = 0xffffffffffffffffL;
						for (MemoryBlock block : blocks) {
							if (virtualBaseOffset == 0xffffffffffffffffL) {
								virtualBaseOffset = block.getStartAddress();
								continue;
							}
							
							if (block.getStartAddress() < virtualBaseOffset)
								virtualBaseOffset = block.getStartAddress();
						}
						oatdumpResolver.setVirtualBaseOffset(virtualBaseOffset);
						System.out.println(oatdumpFilePath + " <- " + executablePath); // debug
						oatdumpResolver.resolve(oatdumpFilePath);
					}
				
					// objdump .so files in "/system/lib64/" and "vendor/lib64/"
					if ((executablePath.startsWith("/system/lib64/") || executablePath.startsWith("/vendor/lib64/")) && executablePath.endsWith(".so")) {
						String objdumpFilePath = retrieveObjdump(Configuration.AArch64SystemLibDirectory, executablePath, ".so");
						assert objdumpFilePath != null;
						
						String objdumpHeaderFilePath = retrieveObjdumpHeader(Configuration.AArch64SystemLibHeaderDirectory, executablePath, ".so");
						assert objdumpHeaderFilePath != null;
					
						HashSet<MemoryBlock> blocks = executableMemoryBlockMap.get(executablePath);
						assert blocks.size() == 1;
						
						// process-1
						OBJDumpHeaderResolver objdumpHeaderResolver = new OBJDumpHeaderResolver();
						System.out.println(objdumpHeaderFilePath + " <- " + executablePath); // debug
						objdumpHeaderResolver.resolve(objdumpHeaderFilePath);
					
						// process-2
						OBJDumpResolver objdumpResolver = new OBJDumpResolver();
						long virtualBaseOffset = 0xffffffffffffffffL;
						for (MemoryBlock block : blocks) {
							if (virtualBaseOffset == 0xffffffffffffffffL) {
								virtualBaseOffset = block.getStartAddress();
								continue;
							}
							
							if (block.getStartAddress() < virtualBaseOffset)
								virtualBaseOffset = block.getStartAddress();
						}
						objdumpResolver.setVirtualBaseOffset(virtualBaseOffset);
						objdumpResolver.setFileBaseOffset(OBJDumpHeaderResolver.OffsetSubtractionMap.get(objdumpHeaderFilePath));
						System.out.println(objdumpFilePath + " <- " + executablePath); // debug
						objdumpResolver.resolve(executablePath.split("/")[executablePath.split("/").length - 1].replace(".so", ""), objdumpFilePath);
					}
					
					// objdump executable files (e.g., "/system/bin/linker64")
					if (executablePath.equals("/system/bin/linker64")) {
						String objdumpFilePath = retrieveObjdump(Configuration.AArch64SystemBinDirectory, executablePath + ".bin", ".bin");
						assert objdumpFilePath != null;
						
						String objdumpHeaderFilePath = retrieveObjdumpHeader(Configuration.AArch64SystemBinHeaderDirectory, executablePath + ".bin", ".bin");
						assert objdumpHeaderFilePath != null;
					
						HashSet<MemoryBlock> blocks = executableMemoryBlockMap.get(executablePath);
						assert blocks.size() == 1;
						
						// process-1
						OBJDumpHeaderResolver objdumpHeaderResolver = new OBJDumpHeaderResolver();
						System.out.println(objdumpHeaderFilePath + " <- " + executablePath); // debug
						objdumpHeaderResolver.resolve(objdumpHeaderFilePath);
					
						// process-2
						OBJDumpResolver objdumpResolver = new OBJDumpResolver();
						long virtualBaseOffset = 0xffffffffffffffffL;
						for (MemoryBlock block : blocks) {
							if (virtualBaseOffset == 0xffffffffffffffffL) {
								virtualBaseOffset = block.getStartAddress();
								continue;
							}
							
							if (block.getStartAddress() < virtualBaseOffset)
								virtualBaseOffset = block.getStartAddress();
						}
						objdumpResolver.setVirtualBaseOffset(virtualBaseOffset);
						objdumpResolver.setFileBaseOffset(OBJDumpHeaderResolver.OffsetSubtractionMap.get(objdumpHeaderFilePath));
						System.out.println(objdumpFilePath + " <- " + executablePath); // debug
						objdumpResolver.resolve(executablePath.split("/")[executablePath.split("/").length - 1], objdumpFilePath);
					}
				}
				
				PerformanceMonitor.getMemInfo();
			}
		}
		//
		
		/* Test:
		for (ArtMethod method : ArtMethod.ArtMethods.values()) {
			if (method.getMethodSignature().startsWith("libc."))
			System.out.println(method.getMethodSignature() + " -> " + "0x" + Long.toHexString(method.getVirtualAddress()));
		}
		*/
		
		//
		{
			String dlopenSignature = "do_dlopen(char const*, int, android_dlextinfo const*, void const*)";
			ArtMethod dlopenMethod = ArtMethodSearcher.search("linker64", dlopenSignature, "native");
			System.out.println(dlopenMethod);
			
			String accessSignature = "access";
			ArtMethod accessMethod = ArtMethodSearcher.search("libc", accessSignature, "native");
			System.out.println(accessMethod);
			
			String loadLibrarySignature = "void java.lang.Runtime.loadLibrary(java.lang.String)";
			ArtMethod loadLibraryMethod = ArtMethodSearcher.search("java.lang.Runtime", loadLibrarySignature, "java");
			System.out.println(loadLibraryMethod);
		}
		//
		
		// decoding & analysis
		{
			PerformanceMonitor.getMemInfo();
			
			// clean-up
			File trFile = new File(Configuration.TraceReporterFile);
			if (trFile.exists())
				trFile.delete();
			File cgFile = new File(Configuration.CallgraphGephiFile);
			if (cgFile.exists())
				cgFile.delete();
			
			ETMv4Decoder decoder = new ETMv4Decoder();
			decoder.setTraceFilePath(Configuration.TraceFile);
			decoder.openTraceFile();
			decoder.decodeTrace();
			decoder.closeTraceFile();
		
			// flush the recorder
			TraceReporter.getSingleInstance().flush();
			if (Configuration.ArtMethodTracingUnpack) {
				InvocationChainReporter.getSingleInstance().flushInvocationRecords();
				InvocationChainReporter.getSingleInstance().flushHookRecords();
				InvocationChainReporter.getSingleInstance().flushBranchRecords();
				InvocationChainReporter.exportDirectedGraph();
			}
			
			// build runtime callgraph
			/*
			Callgraph cg = CallgraphBuilder.getSingleInstance().getCallgraph();
			cg.generateDirectedGraph();
			cg.exportDirectedGraph();
			cg.analyzeDirectedGraph();
			*/
		}
		//
		
		/* 
		DSScriptGenerator dsGenerator = new DSScriptGenerator();
		dsGenerator.generateDSScript();
		*/
		
		PerformanceMonitor.getMemInfo();
		
	}
	
	// ---- ---- ---- ---- //

	// Retrieving a corresponding oatdump file @param(filePath) in @param(directoryPath).
	private static String retrieveOatdump(String directoryPath, String filePath, String suffix) {
		File directory = new File(directoryPath);
		assert directory.isDirectory();
	
		File[] oats = directory.listFiles();
		for (File oat : oats) {
			String fileName = oat.getName();
			if (filePath.equals("/" + fileName.replace("_", "/").replace(".txt", suffix)))
				return oat.getAbsolutePath();
		}
		
		return null;
	}
	
	// Retrieving a corresponding objdump (-d) file @param(filePath) in @param(directoryPath).
	private static String retrieveObjdump(String directoryPath, String filePath, String suffix) {
		File directory = new File(directoryPath);
		assert directory.isDirectory();
		
		File[] objs = directory.listFiles();
		for (File obj : objs) {
			String fileName = obj.getName();
			if (filePath.equals("/" + fileName.replace("_", "/").replace(".txt", suffix)))
				return obj.getAbsolutePath();
		}
		
		return null;
	}
	
	// Retrieve a corresponding objdump (-h) file @param(filePath) in @param(directoryPath).
	private static String retrieveObjdumpHeader(String directoryPath, String filePath, String suffix) { 
		File directory = new File(directoryPath);
		assert directory.isDirectory();
		
		File[] objs = directory.listFiles();
		for (File obj : objs) {
			String fileName = obj.getName();
			if (filePath.equals("/" + fileName.replace("_", "/").replace(".txt", suffix)))
				return obj.getAbsolutePath();
		}
		
		return null;
	}
	
	private static boolean filterSystemLibrary(String library) {
		// framework oat
		if (library.endsWith("/boot.oat"))
			return false;
		if (library.endsWith("/boot-core-libart.oat"))
			return false;
		if (library.endsWith("/boot-framework.oat"))
			return false;
		
		// system library
		if (library.endsWith("/libart.so"))
			return false;
		if (library.endsWith("/libc.so"))
			return false;
		if (library.endsWith("/libdl.so"))
			return false;
		if (library.endsWith("/liblog.so"))
			return false;
		
		// system bin
		if (library.endsWith("/linker"))
			return false;
		if (library.endsWith("/linker64"))
			return false;
		
		return true;
	}
	
}
