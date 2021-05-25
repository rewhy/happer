package hk.polyu.trace.decode;

public class TraceInfoRecord extends TraceMessageRecord {
	
	public TraceInfoRecord(String text) {
        super(text);
    }
	
	@Override
    public MessageType getMessageType() {
        return MessageType.INFO;
    }
}
