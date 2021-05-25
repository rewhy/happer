package hk.polyu.trace.decode;

import hk.polyu.trace.resolver.ArtInstruction;
import hk.polyu.trace.resolver.ArtMethod;

public class ArtInstructionRecord extends TraceRecord {

	public static int INTERNAL_BRANCH_FORWARD = 1;
    public static int INTERNAL_BRANCH_BACKWARD = 2;
    public static int BRANCH_TO_FUNCTION = 3;
    private static int BRANCH_TYPE_MASK = 3;
    private static int IS_CANCELED_MASK = 256;
    private static int IS_COMMITED_MASK = 512;
    private static int IS_FAILED_MASK = 1024;
    private static int IS_MISPREDICTED = 2048;
    private ArtInstruction mArtInstruction;
    private int mCycles;
    private int mBits;
    private int mIndex;
    
    private void setBits(int mask) {
        mBits |= mask;
    }
    
    private boolean isAnyBitSet(int mask) {
        return (mBits & mask) != 0x0;
    }
    
    @Override
    public int getIndex() {
        return mIndex;
    }
    @Override
    public boolean hasIndex() {
        return !isCanceled();
    }
    public void setIndex(int index) {
        mIndex = index;
    }
    
    @Override
    public Long getVirtualAddress() {
        return mArtInstruction.getVirtualAddress();
    }
    
    public int getCycles() {
        return mCycles;
    }
    public void addCycles(int cycles) {
        mCycles += cycles;
    }
    
    public int getBranchType() {
        return mBits & BRANCH_TYPE_MASK;
    }
    public void setBranchType(int type) {
        mBits &= 0xFFFFFFFC;
        mBits |= (type & BRANCH_TYPE_MASK);
    }
    
    @Override
    public boolean isArtMethod() {
        return false;
    }
    
    public boolean isBranch() {
        return mArtInstruction.isBranch();
    }
    
    public boolean isFailed() {
        return isAnyBitSet(IS_FAILED_MASK);
    }
    public void setFailed() {
        setBits(IS_FAILED_MASK);
    }
    
    public boolean isCommitted() {
        return isAnyBitSet(IS_COMMITED_MASK);
    }
    public void setCommitted() {
        setBits(IS_COMMITED_MASK);
    }
    
    public boolean isCanceled() {
        return isAnyBitSet(IS_CANCELED_MASK);
    }
    public void setCanceled() {
        setBits(IS_CANCELED_MASK);
    }
    
    public boolean isMemoryAccess() {
        return mArtInstruction.isMemoryAccess();
    }
    
    public String getDisassembly() {
        return mArtInstruction.getDisassembly();
    }
    
    @Override
    public String toString() {
        return copyText();
    }
    
    @Override
    public String copyText() {
        return String.format("Trace #%d : %s", getIndex(), mArtInstruction.toString());
    }
    
    @Override
    public ArtMethod getArtMethod() {
        return mArtInstruction.getArtMethod();
    }
    
    public void setArtInstruction(ArtInstruction artInstruction) {
    	mArtInstruction = artInstruction;
    }
    public ArtInstruction getArtInstruction() {
        return mArtInstruction;
    }
    
    @Override
    public String getText() {
        return getDisassembly();
    }
    
    @Override
    public ArtInstructionRecord getArtInstructionRecord() {
        return this;
    }
    
    @Override
    public boolean isArtInstruction() {
        return true;
    }
    
    public void setMispredicted() {
        setBits(IS_MISPREDICTED);
    }
    public boolean isMispredicted() {
        return isAnyBitSet(IS_MISPREDICTED);
    }
	
}
