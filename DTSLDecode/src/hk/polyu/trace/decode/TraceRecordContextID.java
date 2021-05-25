package hk.polyu.trace.decode;

public class TraceRecordContextID extends TraceMessageRecord {
	
	public TraceRecordContextID(String text) {
        super(text);
    }
    
    @Override
    public MessageType getMessageType() {
        return MessageType.CONTEXT_ID;
    }

}
