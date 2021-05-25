package hk.polyu.trace.decode;

public class TraceRecordTimestamp extends TraceMessageRecord implements Comparable<TraceRecordTimestamp> {
	
	private long mTimestamp;
    private int mNearestIndex;
    private long mNumCycles;
    private float mTicksPerCycle;
    private boolean mDiscard;
    
    public long getTimestamp() {
        return mTimestamp;
    }
    
    public void setNearestIndex(int index) {
        mNearestIndex = index;
    }
    public int getNearestIndex() {
        return mNearestIndex;
    }
    
    public void setTicksPerCycle(long nextTimestamp) {
        if (mNumCycles > 0L) {
            mTicksPerCycle = (nextTimestamp - mTimestamp) / mNumCycles;
        }
    }
    public void setTicksPerCycle(float ticksPerCycle) {
        mTicksPerCycle = ticksPerCycle;
    }
    public float getTicksPerCycle() {
        return mTicksPerCycle;
    }
    
    public boolean isDiscard() {
        return mDiscard;
    }
    public void setDiscard(boolean discard) {
        mDiscard = discard;
    }
    
    public TraceRecordTimestamp(long timestamp) {
        super("TIMESTAMP_1" + " " + timestamp);
        mTicksPerCycle = 1.0f;
        mDiscard = false;
        mTimestamp = timestamp;
    }
    
    @Override
    public MessageType getMessageType() {
        return MessageType.TIMESTAMP;
    }
    
    public void tallyInstruction(ArtInstructionRecord instructionRecord) {
        int cycles = instructionRecord.getCycles();
        if (cycles <= 0) {
            ++mNumCycles;
        } else {
            mNumCycles += cycles;
        }
    }
    
    public String toString() {
        return super.getText() + ", index=" + mNearestIndex + ", cycles=" + mNumCycles + ", TPC=" + mTicksPerCycle;
    }
    
    public int hashCode() {
        return (int) (mTimestamp ^ mTimestamp >>> 32);
    }
    
    public boolean equals(Object obj) {
        return obj == this || (obj instanceof TraceRecordTimestamp && mTimestamp == ((TraceRecordTimestamp) obj).mTimestamp);
    }
    
    public int compareTo(TraceRecordTimestamp other) {
        if (mTimestamp == other.mTimestamp) {
            return 0;
        }
        
        if (mTimestamp < other.mTimestamp) {
            return -1;
        }
        
        return 1;
    }
    
    public TraceRecordTimestamp constructDummy() {
        TraceRecordTimestamp traceRecordTimestamp = new TraceRecordTimestamp(mTimestamp);
        traceRecordTimestamp.setDiscard(true);
        
        return traceRecordTimestamp;
    }

}
