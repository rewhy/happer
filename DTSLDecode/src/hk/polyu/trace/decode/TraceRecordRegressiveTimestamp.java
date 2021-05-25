package hk.polyu.trace.decode;

public class TraceRecordRegressiveTimestamp extends TraceMessageRecord {

	private long mTimestamp;
	public long getTimestamp() {
		return mTimestamp;
	}
    
    public TraceRecordRegressiveTimestamp(long timestamp) {
        super("TIMESTAMP" + " " + timestamp);
        mTimestamp = timestamp;
    }
    
    @Override
    public MessageType getMessageType() {
        return MessageType.REGRESSIVE_TIMESTAMP;
    }
    
    
	
}
