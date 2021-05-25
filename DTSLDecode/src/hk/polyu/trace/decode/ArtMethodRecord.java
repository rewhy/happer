package hk.polyu.trace.decode;

import hk.polyu.trace.resolver.ArtMethod;

public class ArtMethodRecord extends TraceRecord {

	private ArtMethod mArtMethod;
    private int mCycles;
    private long mOffset;
    private ArtInstructionRecord mArtInstructionRecord;
    private int mFirstArtInstructionIndex;
    private int mIndex;
    private boolean mHasIndex;
    
    public ArtMethodRecord(ArtMethod artMethod, ArtInstructionRecord artInstructionRecord, int firstArtInstructionIndex) {
        mArtMethod = artMethod;
        mArtInstructionRecord = artInstructionRecord;
        mFirstArtInstructionIndex = firstArtInstructionIndex;
        Long address = mArtMethod.getVirtualAddress();
        assert address != 0L;
        mOffset = artInstructionRecord.getVirtualAddress() - address;
    }
    
    @Override
    public ArtMethod getArtMethod() {
        return mArtMethod;
    }
    
    @Override
    public Long getVirtualAddress() {
        return mArtInstructionRecord.getVirtualAddress();
    }
    
    public int getCycles() {
        return mCycles;
    }
    public void addCycles(int cycles) {
        mCycles += cycles;
    }
    
    @Override
    public String getText() {
        if (mOffset == 0L) {
            return mArtMethod.getMethodSignature();
        }
        
        return String.format("%s+%d", mArtMethod.getMethodSignature(), mOffset);
    }
    
    public ArtInstructionRecord getArtInstructionRecord() {
        return mArtInstructionRecord;
    }
    
    @Override
    public ArtMethodRecord getArtMethodRecord() {
        return this;
    }
    
    @Override
    public boolean isArtMethod() {
        return true;
    }
    
    public int getFirstArtInstructionIndex() {
        return mFirstArtInstructionIndex;
    }
    
    @Override
    public int getIndex() {
        return mIndex;
    }
    public void setIndex(int index) {
        mIndex = index;
        mHasIndex = true;
    }
    @Override
    public boolean hasIndex() {
        return mHasIndex;
    }
    
    @Override
    public String toString() {
        return getText();
    }
    
    @Override
    public String copyText() {
        String artMethod = null;
        if (mOffset == 0L) {
            artMethod = mArtMethod.getMethodSignature();
        } else {
            artMethod = String.format("%s + 0x%08X", mArtMethod.getMethodSignature(), mOffset);
        }
        
        return String.format("Function #%d : %s", getIndex(), mArtMethod.getVirtualAddress() + " " + artMethod);
    }
	
}
