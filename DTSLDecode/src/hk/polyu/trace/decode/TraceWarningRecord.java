package hk.polyu.trace.decode;

public class TraceWarningRecord extends TraceMessageRecord {

	public TraceWarningRecord(String text) {
        super(text);
    }
	
	@Override
    public MessageType getMessageType() {
        return MessageType.WARNING;
    }
	
}
