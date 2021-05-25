package hk.polyu.trace.resolver;

import java.util.HashMap;

import com.arm.debug.icodec.Instruction;
import com.arm.debug.icodec.swig.GenericBarrierOperation;
import com.arm.debug.icodec.swig.GenericBranchImmOperation;
import com.arm.debug.icodec.swig.GenericBranchRegOperation;
import com.arm.debug.icodec.swig.GenericConditionalExecution;
import com.arm.debug.icodec.swig.GenericHandlerBranchOperation;
import com.arm.debug.icodec.swig.GenericInstruction;
import com.arm.debug.icodec.swig.GenericInstructionMajorOpcode;
import com.arm.debug.icodec.swig.GenericProcStateOperation;
import com.arm.debug.icodec.swig.GenericRegisterModel;

import hk.polyu.trace.decode.A64InstructionDecoder;

public class ArtInstruction {
	// fake instructions
	public static ArtInstruction AppInstruction = new ArtInstruction();
	public static ArtInstruction SysInstruction = new ArtInstruction();
	public static ArtInstruction UNKNOW = new ArtInstruction();
	// initialize fake instructions
	static {
		AppInstruction.setArtMethod(ArtMethod.AppMethod);
		SysInstruction.setArtMethod(ArtMethod.SysMethod);
		UNKNOW.setArtMethod(ArtMethod.UNKNOW);
	}
	
	public static HashMap<Long, ArtInstruction> ArtInstructions = new HashMap<Long, ArtInstruction>(); // virtual address -> ArtInstruction
	
	private ArtMethod mArtMethod;
	private Long mFileAddress;
	private Long mVirtualAddress;
	private Long mOpcodes;
	private String mDisassembly;
	private boolean mHasAuxiliaryAddress;
	private Long mAuxiliaryAddress; // whether this field is meaningful depends on "mHasAuxiliaryAddress" field
	
	private boolean mIsBranch;
    private boolean mIsBranchDirect;
    private int mBranchOffset;
    private boolean mIsConditional;
    private boolean mIsMemoryAccess;
    private boolean mIsDiscardAtom;
    private boolean mIsLink;
    private boolean mIsExchange;
    private boolean mIsRet;
    private boolean mIsSpecialWaypoint;
    private boolean mIsISB;
    private boolean mIsDataBarrier;
    
    private boolean mIsInitialized;
    private ArtInstruction mPassArtInstruction;
    private ArtInstruction mFailArtInstruction;
	
	public void setArtMethod(ArtMethod artMethod) {
		mArtMethod = artMethod;
	}
	public ArtMethod getArtMethod() {
		return mArtMethod;
	}
	
	public void setFileAddress(long address) {
		mFileAddress = address;
	}
	public long getFileAddress() {
		return mFileAddress;
	}
	
	public void setVirtualAddress(long virtualAddress) {
		mVirtualAddress = virtualAddress;
	}
	public long getVirtualAddress() {
		if (mVirtualAddress == null)
			return 0L;
		else
			return mVirtualAddress;
	}
	public void calculateVirtualAddress(long virtualBaseOffset, long fileBaseOffset) {
		mVirtualAddress = virtualBaseOffset + (mFileAddress - fileBaseOffset);
	}
	
	public void setOpcodes(long opcodes) {
		mOpcodes = opcodes;
	}
	public long getOpcodes() {
		if (mOpcodes == null)
			return 0L;
		else
			return mOpcodes;
	}
	
	public void setDisassembly(String disassembly) {
		mDisassembly = disassembly;
	}
	public String getDisassembly() {
		return mDisassembly;
	}
	
	public void setHasAuxiliaryAddress(boolean flag) {
		mHasAuxiliaryAddress = flag;
	}
	public boolean getHasAuxiliaryAddress() {
		return mHasAuxiliaryAddress;
	}
	
	public void setAuxiliaryAddress(long auxiliaryAddress) {
		assert mHasAuxiliaryAddress;
		mAuxiliaryAddress = auxiliaryAddress;
	}
	public long getAuxiliaryAddress() {
		assert mHasAuxiliaryAddress;
		return mAuxiliaryAddress;
	}
	
	public boolean isBranch() {
		return mIsBranch;
	}
	
	public boolean isBranchDirect() {
	    return mIsBranchDirect;
	}
	  
	public boolean isConditional() {
		return mIsConditional;
	}
	
	public boolean couldBeConditional() {
        return (this != ArtInstruction.UNKNOW) && mIsConditional;
    }
	
	public boolean isDeterminate() {
		if (isBranch()) {
			if (isConditional()) {
				return false;
			}
	      
			if (!isBranchDirect()) {
				return false;
			}
	    }
		
	    return true;
	}
	
	public boolean isMemoryAccess() {
		return mIsMemoryAccess;
	}
	
	public boolean isConcrete() {
		if (this == AppInstruction || this == SysInstruction || this == UNKNOW)
			return false;
		else
			return true;
	}
	
	public boolean isApplication() {
		return this == AppInstruction;
	}
	
	public boolean isSystem() {
		return this == SysInstruction;
	}
	
	public boolean isUnknow() {
        return this == UNKNOW;
    }
	
	public void setDiscardAtom(boolean set) {
		if (set)
			mIsDiscardAtom = true;
	}
	public boolean isDiscardAtom() {
		return mIsDiscardAtom;
	}
	
	public boolean isLink() {
		return mIsLink;
	}
	  
	public boolean isExchange() {
		return mIsExchange;
	}
	
	public boolean isRet() {
		return mIsRet;
	}
	
	public boolean isSpecialWaypoint() {
		return mIsSpecialWaypoint;
	}
	
	public boolean isISB() {
        return mIsISB;
    }
	
	public boolean isDataBarrier() {
		return mIsDataBarrier;
	}
	
	private void init() {
		mArtMethod = null;
		mFileAddress = null;
		mVirtualAddress = null;
		mOpcodes = null;
		mDisassembly = "UNKNOW";
		mHasAuxiliaryAddress = false;
		mAuxiliaryAddress = null;
		
		mIsBranch = false;
	    mIsBranchDirect = false;
	    mBranchOffset = 0;
	    mIsConditional = false;
	    mIsMemoryAccess = false;
	    mIsDiscardAtom = false;
	    mIsLink = false;
	    mIsExchange = false;
	    mIsRet = false;
	    mIsSpecialWaypoint = false;
	    mIsISB = false;
	    mIsDataBarrier = false;
	    
	    mIsInitialized = false;
	    mPassArtInstruction = null;
	    mFailArtInstruction = null;
	}
	
	public ArtInstruction() {
		init();
	}
	
	public ArtInstruction(long address, long opcodes, String disassembly) {
		init();
		
		mFileAddress = address;
		mOpcodes = opcodes;
		mDisassembly = disassembly;
		
		A64InstructionDecoder decoder = new A64InstructionDecoder();
		Instruction instruction = decoder.decode(mOpcodes);
		GenericInstruction genericInstruction = instruction.getInstruction();
		GenericConditionalExecution genericConditionalExecution = genericInstruction.condex();
		
		mIsMemoryAccess = (genericInstruction.memoryReadSize() != 0L) || (genericInstruction.memoryWriteSize() != 0L);
		if (genericConditionalExecution != GenericConditionalExecution.gice_al) {
			mIsConditional = true;
		}
		
		GenericInstructionMajorOpcode majorOpcode = genericInstruction.majorOpcode();
		if (majorOpcode == GenericInstructionMajorOpcode.gimop_barrier) {
			GenericBarrierOperation minorOpcode = GenericBarrierOperation.swigToEnum(genericInstruction.minorOpcode());
			if (minorOpcode == GenericBarrierOperation.giop_isb) {
				mIsISB = true;
			} else {
				mIsDataBarrier = true;
			}
		} else if (majorOpcode == GenericInstructionMajorOpcode.gimop_proc_state) {
        	GenericProcStateOperation minorOpcode = GenericProcStateOperation.swigToEnum(genericInstruction.minorOpcode());
            if ((minorOpcode == GenericProcStateOperation.giop_leavex) || (minorOpcode == GenericProcStateOperation.giop_enterx)) {
            	mIsSpecialWaypoint = true;
            }
        } else if (majorOpcode == GenericInstructionMajorOpcode.gimop_branch_imm) {
        	long immediate = genericInstruction.signedImmediate();
        	mIsBranch = true;
        	mIsBranchDirect = true;
        	mBranchOffset = (int) immediate;
            
        	GenericBranchImmOperation minorOpcode = GenericBranchImmOperation.swigToEnum(genericInstruction.minorOpcode());
        	boolean link = minorOpcode != GenericBranchImmOperation.giop_b;
        	mIsLink = link;
            boolean exchange = (minorOpcode == GenericBranchImmOperation.giop_blx_imm) || (minorOpcode == GenericBranchImmOperation.giop_blx_imm_h2);
            mIsExchange = exchange;
        } else if (majorOpcode == GenericInstructionMajorOpcode.gimop_compare_branch) {
        	long immediate = genericInstruction.signedImmediate();
        	mIsBranch = true;
        	mIsBranchDirect = true;
        	mBranchOffset = (int) immediate;
        	mIsConditional = true;
        } else if (majorOpcode == GenericInstructionMajorOpcode.gimop_test_and_branch) {
        	long immediate = genericInstruction.signedImmediate();
        	mIsBranch = true;
        	mIsBranchDirect = true;
        	mBranchOffset = (int) immediate;
        	mIsConditional = true;
        } else if (majorOpcode == GenericInstructionMajorOpcode.gimop_branch_table) {
        	mIsBranch = true;
        	mIsBranchDirect = false;
        } else if (majorOpcode == GenericInstructionMajorOpcode.gimop_handler_branch) {
        	mIsBranch = true;
        	mIsBranchDirect = false;
        	GenericHandlerBranchOperation minorOpcode = GenericHandlerBranchOperation.swigToEnum(genericInstruction.minorOpcode());
        	if (minorOpcode == GenericHandlerBranchOperation.giop_hbl) {
        		mIsLink = true;
        	} else if (minorOpcode == GenericHandlerBranchOperation.giop_hblp) {
        		mIsLink = true;
        	}
        } else if (majorOpcode == GenericInstructionMajorOpcode.gimop_branch_reg) {
        	mIsBranch = true;
        	mIsBranchDirect = false;
        	GenericBranchRegOperation minorOpcode = GenericBranchRegOperation.swigToEnum(genericInstruction.minorOpcode());
        	if (minorOpcode == GenericBranchRegOperation.giop_bx) {
        		mIsExchange = true;
        	} else if (minorOpcode == GenericBranchRegOperation.giop_blx_reg) {
        		mIsLink = true;
        		mIsExchange = true;
        	} else if (minorOpcode == GenericBranchRegOperation.giop_bxj) {
        		mIsExchange = true;
        	} else if (minorOpcode != GenericBranchRegOperation.giop_br) {
        		if (minorOpcode == GenericBranchRegOperation.giop_blr) {
        			mIsLink = true;
        		}
        		if (minorOpcode == GenericBranchRegOperation.giop_ret) {
        			mIsRet = true;
        		}
        	}
        }
		
		GenericRegisterModel rm = GenericRegisterModel.grm_aarch64;
		if ((genericInstruction.isBranch(rm)) &&  (!mIsBranch)) {
			mIsBranch = true;
			mIsBranchDirect = false;
		}
	}
	
	public long getNextFileAddress() {
        return mFileAddress + getOpcodeSize();
    }
	public long getNextVirtualAddress() {
		return mVirtualAddress + getOpcodeSize();
	}
    
	// For Aarch64, the size of an instruction is fixed.
    public int getOpcodeSize() {
        return 4;
    }
    
    public long getBranchTargetFileAddress() {
        return mFileAddress + (long) mBranchOffset;
    }
    public long getBranchTargetVirtualAddress() {
    	return mVirtualAddress + (long) mBranchOffset;
    }
    
    public void setBranchOffset(int offset) {
        mBranchOffset = offset;
    }
    public int getBranchOffset() {
    	return mBranchOffset;
    }
	
	public String toString() {
		if (this == ArtInstruction.UNKNOW)
			return "ArtInstruction.UNKNOW";
		
		String className = String.format("Class Name -> %s", mArtMethod.getArtClass().getName());
		String methodSignature = String.format("Method Signature -> %s", mArtMethod.getMethodSignature());
		// String fileAddress = String.format("File Address -> 0x%08x", mFileAddress);
		String virtualAddress = String.format("Virtual Address -> 0x%08x", mVirtualAddress);
		return className + " " + methodSignature + " " + virtualAddress;
		
		// String opcodes = String.format("Opcodes -> %x", mOpcodes);
		// String disassembly = String.format("Disassembly -> %s", mDisassembly);
		// String branchTargetVirtualAddress = mIsBranchDirect ? String.format("branch target: 0x%08x", getBranchTargetVirtualAddress()) : "";
		// return className + " " + methodSignature + " " + fileAddress + " " + virtualAddress + " " + opcodes + " " + disassembly + " " + branchTargetVirtualAddress;
	}
	
	public int compareTo(ArtInstruction another) {
        return Long.valueOf(mVirtualAddress).compareTo(Long.valueOf(another.getVirtualAddress()));
    }
	
	public int hashCode() {
        return Long.valueOf(mVirtualAddress).hashCode();
    }
	
	public boolean equals(Object another) {
        if (another instanceof ArtInstruction) {
            return compareTo((ArtInstruction) another) == 0;
        }
        
        return super.equals(another);
    }
	
	public void setPassFailArtInstructions(ArtInstruction pass, ArtInstruction fail) {
        mPassArtInstruction = pass;
        mFailArtInstruction = fail;
        mIsInitialized = true;
    }
	
	public boolean isInitialized() {
        return mIsInitialized;
    }
    
    public ArtInstruction getPassArtInstruction() {
        return mPassArtInstruction;
    }
    
    public ArtInstruction getFailArtInstruction() {
        return mFailArtInstruction;
    }
}
