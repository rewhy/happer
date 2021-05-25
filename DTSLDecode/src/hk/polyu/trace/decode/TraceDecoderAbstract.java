package hk.polyu.trace.decode;

import java.io.DataInputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import hk.polyu.Configuration;
import hk.polyu.trace.analysis.TraceReporter;
import hk.polyu.trace.analysis.cg.CallgraphBuilder;
import hk.polyu.trace.decode.exception.TraceCorruptedException;
import hk.polyu.trace.decode.exception.TraceDecodeEndOfBufferException;
import hk.polyu.trace.decode.exception.TraceDecodeIOException;
import hk.polyu.trace.decode.exception.TraceDecodeStopException;
import hk.polyu.trace.resolver.ArtInstruction;

public abstract class TraceDecoderAbstract {
	
	// set the trace file path
	private String traceFilePath;
	protected String getTraceFilePath() {
		return traceFilePath;
	}
	protected void setTraceFilePath(String path) {
		traceFilePath = path;
	}
		
	// extract the stream of the trace
	private DataInputStream traceStream = null;
	protected int curPosition;
	
	protected void openTraceFile() {
		curPosition = 0;
		
		try {
			File traceFile = new File(traceFilePath);
			traceStream = new DataInputStream(new FileInputStream(traceFile));
		} catch(Exception e) {
			System.out.println("Open trace file: " + traceFilePath + " fail...");
			e.printStackTrace();
		}
	}
	
	protected void closeTraceFile() {
		try {
			traceStream.close();
		} catch(Exception e) {
			System.out.println("Close trace file: " + traceFilePath + " fail...");
			e.printStackTrace();
		}
	}
	
	protected int readTraceByte() throws TraceDecodeEndOfBufferException, TraceDecodeIOException {
		int byteValue = 0;
		try {
			byteValue = traceStream.readByte() & 0xff;
			curPosition++;
		} catch(EOFException ioe) {
			throw new TraceDecodeEndOfBufferException();
		} catch(IOException ioe) {
			throw new TraceDecodeIOException(ioe);
		}
		
		byteValue &= 0xff;
		// System.out.println(Integer.toHexString(byteValue));
		return byteValue;
	}
	
	protected void advance(long n) throws TraceDecodeEndOfBufferException, TraceDecodeIOException {
		for (int i = 0 ; i < n; i++)
			readTraceByte();
    }
	
	// get a specific bit of the value
	protected static boolean bit(int offset, int value) {
        return (value & 1 << offset) != 0x0;
    }
    
	// get a specific range (highOffset, lowOffset) of bits of the value
    protected static int field(int highOffset, int lowOffset, int value) {
        return value >> lowOffset & ~(-1 << (highOffset - lowOffset + 1));
    }
    
    // get four bytes
    protected int readInt() throws TraceDecodeEndOfBufferException, TraceDecodeIOException {
        int byteValue = readTraceByte();
        byteValue |= readTraceByte() << 8;
        byteValue |= readTraceByte() << 16;
        byteValue |= readTraceByte() << 24;
        
        return byteValue;
    }
    
    // 
    protected int readVariableLengthInt() throws TraceDecodeEndOfBufferException, TraceDecodeIOException {
        int retValue = 0;
        boolean cBit = true; // continuation bit
        
        int byteValue;
        for (int i = 0; i < 5 && cBit; i++) {
            byteValue = readTraceByte();
            retValue |= field(6, 0, byteValue) << (i * 7);
            
            cBit = bit(7, byteValue);
        }
        
        return retValue;
    }
	
	// ---- //
	
    // Initializing in Constructor
	private int mTimestampBitSize;
	protected int mContextIDBytes;
	// Initializing in cleadDecodeState()
	protected boolean mNonSecure;
	protected boolean mHypervisorMode;
	protected ArtInstructionRecord mArtInstructionRecord;
	protected ArtInstruction mCurrentArtInstruction;
	protected int mBranchAddress;
	protected long mRawTimestamp;
	protected long mBinaryTimestamp;
	protected boolean mFullTimestampRecieved;
	protected boolean mFirstTimestampRecieved;
	protected long mContextID;
	protected int mVMID;
    private TraceRecord mLastRecord = null;
    
    public TraceDecoderAbstract() {
    	mTimestampBitSize = 64; // TRCIDR0.TSSIZE (Cortex-A53 -> 64, Cortex-A72 -> 64)
    	mContextIDBytes = 4;
    }
    
    public static TraceDecoderAbstract create() {
    	return new ETMv4Decoder();
    }
    
    public TraceDecodeStopException decodeTrace() {
        clearDecodeState();
        
        try {
            process(true);
        } catch (TraceDecodeStopException tdse) {
            return tdse;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    protected void findASync(int minimumZeroCount) throws TraceDecodeStopException {
		boolean found = false;
        while (true) {
            if (readTraceByte() == 0) {
                int zeroCount = 0;
                
                int nextByteValue;
                do {
                    zeroCount++;
                    nextByteValue = readTraceByte();
                } while (nextByteValue == 0);
                
                if (nextByteValue == 128 && zeroCount >= minimumZeroCount)
                    found = true;
                
                if (found)
                    break;
                
                continue;
            }
        }
    }
    
    protected void clearDecodeState() {
    	mNonSecure = false;
        mHypervisorMode = false;
    	mArtInstructionRecord = new ArtInstructionRecord();
        mCurrentArtInstruction = ArtInstruction.UNKNOW;
        mBranchAddress = 0;
        mRawTimestamp = 0L;
        mBinaryTimestamp = 0L;
        mFullTimestampRecieved = false;
        mFirstTimestampRecieved = false;
        mContextID = -1L;
        mVMID = -1;
        mLastRecord = null;
    }
    
    protected abstract void process(boolean findAsync) throws TraceDecodeStopException;
    
    protected abstract void flush() throws TraceDecodeStopException;
    
    protected void pass() {
        setupPassAndFail();
        mCurrentArtInstruction = mCurrentArtInstruction.getPassArtInstruction();
    }
    
    protected void fail() throws TraceCorruptedException {
    	if (mCurrentArtInstruction.couldBeConditional()
    	 || mCurrentArtInstruction.isApplication()
    	 || mCurrentArtInstruction.isSystem()
    	 || mCurrentArtInstruction.isUnknow()) {
            this.setupPassAndFail();
            return;
        }
        throw new TraceCorruptedException("CURRENT INSTRUCTION IS NOT A CONDITIONAL INSTRUCTION");
    }
    
    private void setupPassAndFail() {
        if (!mCurrentArtInstruction.isInitialized()) {
            ArtInstruction passArtInstruction = null;
            ArtInstruction failArtInstruction = null;
            
            if (!mCurrentArtInstruction.isApplication() && !mCurrentArtInstruction.isSystem() && !mCurrentArtInstruction.isUnknow()) {
                if (mCurrentArtInstruction.isBranchDirect()) {
                    Long branchTarget = mCurrentArtInstruction.getBranchTargetVirtualAddress();
                    passArtInstruction = ArtInstruction.ArtInstructions.get(branchTarget);
                } else if (!mCurrentArtInstruction.isBranch()) {
                    passArtInstruction = ArtInstruction.ArtInstructions.get(mCurrentArtInstruction.getNextVirtualAddress());
                }
                
                if (mCurrentArtInstruction.couldBeConditional()) {
                    failArtInstruction = ArtInstruction.ArtInstructions.get(mCurrentArtInstruction.getNextVirtualAddress());
                }
            }
            
            if (passArtInstruction == null || failArtInstruction == null) {
                ArtInstruction unknownArtInstruction = ArtInstruction.UNKNOW;
                
                if (passArtInstruction == null) {
                    passArtInstruction = unknownArtInstruction;
                }
                if (failArtInstruction == null) {
                    failArtInstruction = unknownArtInstruction;
                }
            }
            
            mCurrentArtInstruction.setPassFailArtInstructions(passArtInstruction, failArtInstruction);
        }
    }
    
    protected void executeInstruction() {
        if (mCurrentArtInstruction.isDeterminate())
            pass();
        else
            mCurrentArtInstruction = ArtInstruction.UNKNOW;
    }
    
    protected void addCycles(int cycles) {
        mArtInstructionRecord.addCycles(cycles);
    }
    
    protected void setVMID(int vmid) throws TraceDecodeStopException {
    	if (mVMID != vmid) {
    		mVMID = vmid;
    		flush();
    		addTraceRecord(new TraceRecordVMID("VMID" + " " + vmid));
    	}
	}
    
    protected long readContextIDBytes() throws TraceDecodeStopException {
    	long newContextID = 0L;
    	for (int i = 0; i < mContextIDBytes; i++) {
    		int byteValue = readTraceByte();
    		newContextID |= (byteValue & 0xff) << i * 8;
    	}
    	
    	return newContextID;
	}
    
    protected void setContextID(long contextID) throws TraceDecodeStopException {
    	if (mContextID != contextID) {
    		mContextID = contextID;
    		flush();
    		addTraceRecord(new TraceRecordContextID("CONTEXT_ID" + " " + contextID));
    	}
	}
    
    protected void addTraceRecord(TraceRecord record) throws TraceDecodeStopException {
        /*
    	if (record instanceof ArtInstructionRecord) {
        	// System.out.println(record.toString());
            ArtInstructionRecord artInstructionRecord = (ArtInstructionRecord) record;
            ArtInstruction artInstruction = artInstructionRecord.getArtInstruction();
            
            long opcode = artInstruction.getOpcodes();
            if (opcode == 0L) {
                return;
            }
        }
        */
        
        if (!record.isDuplicate(mLastRecord, true)) {
            mLastRecord = record;
            
            // ---- Analyzing Phase ---- //
            
            // TraceReporter is used to store the etm trace
            if (Configuration.ArtInstructionTracing)
            	TraceReporter.getSingleInstance().addTraceRecord(record);
            
            // CallgraphGenerator is used to generate runtime Callgraph according to the etm trace
            CallgraphBuilder.getSingleInstance().addTraceRecord(record);
        }
        
        /* transform opcodes to vex
        if (record instanceof ArtInstructionRecord) {
        	ArtInstruction curInstruction = record.getArtInstructionRecord().getArtInstruction();
            if (curInstruction == ArtInstruction.UNKNOW)
            	System.out.println(record);

            ETMv4Decoder.write(record.toString());
            // perform the Vex transformation
            if (curInstruction != ArtInstruction.UNKNOW)
            	TransformOpcode2Vex.getSingleInstance().execute(curInstruction);
        }
        */
    }
    
    // ---- //
    
    // Timestamp PacketType
    void skipTimeStampPacket() throws TraceDecodeStopException {
        processTimeStampPacket(false);
    }
    
    long timeStampPacket() throws TraceDecodeStopException {
        return processTimeStampPacket(true);
    }
    
    long processTimeStampPacket(boolean emitRecord) throws TraceDecodeStopException {
        int numberOfBytes = 0;
        long timestamp = 0L;
        int mask = 127;
        
        int byteValue;
        do {
            byteValue = readTraceByte();
            
            if (numberOfBytes == 8)
                mask = 255;
                       
            timestamp |= ((long) (byteValue & mask)) << numberOfBytes * 7;
            numberOfBytes++;
        } while (bit(7, byteValue) && numberOfBytes < 9);
        
        if (numberOfBytes < 9) {
            updateTimestamp(timestamp, numberOfBytes * 7, emitRecord);
        } else {
            setTimestamp(timestamp, emitRecord);
        }
        
        return timestamp;
    }
    
    protected void updateTimestamp(long timestamp, int updateBitCount, boolean emitRecord) throws TraceDecodeStopException {
        if (mFullTimestampRecieved) {
            long mask = -1L << updateBitCount;
            setTimestamp((timestamp & ~mask) | (mask & mRawTimestamp), emitRecord);
        } else if (updateBitCount >= mTimestampBitSize) {
            setTimestamp(timestamp, emitRecord);
        }
    }
    
    protected void setTimestamp(long newRawTimestamp, boolean emitRecord) throws TraceDecodeStopException {
        if (mRawTimestamp != newRawTimestamp) {
            long newBinaryTimestamp = newRawTimestamp; // getTimestampEncoding() returns IARMCoreTraceSource.TimestampEncoding.BINARY under our scenario
            /*
            if (getTimestampEncoding() == IARMCoreTraceSource.TimestampEncoding.GRAY) {
                decodeGray = GrayCode.decodeGray(mRawTimestamp);
            } else {
                decodeGray = mRawTimestamp;
            }
            */
            
            if (mFirstTimestampRecieved && emitRecord && compareTimestamps(newBinaryTimestamp, mBinaryTimestamp) < 0L) {
                flush();
                addTraceRecord(new TraceRecordRegressiveTimestamp(newBinaryTimestamp));
                return;
            }
            
            mRawTimestamp = newRawTimestamp;
            mBinaryTimestamp = newBinaryTimestamp;
            mFullTimestampRecieved = true;
            mFirstTimestampRecieved = true;
            
            flush();
            if (emitRecord) {
                addTraceRecord(new TraceRecordTimestamp(newBinaryTimestamp)); // TODO
                
            }
        }
    }
    
    private long compareTimestamps(long curTimestamp, long preTimestamp) {
        return (curTimestamp << 16) - (preTimestamp << 16);
    }
    
    protected ITraceException getTraceException(int exceptionNumber) {
        return TraceExceptionNonMClass.get(exceptionNumber);
    }

}
