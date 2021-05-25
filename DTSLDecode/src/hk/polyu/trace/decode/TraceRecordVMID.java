package hk.polyu.trace.decode;

public class TraceRecordVMID extends TraceMessageRecord {

	public TraceRecordVMID(String text) {
        super(text);
    }
    
    @Override
    public MessageType getMessageType() {
        return MessageType.VMID;
    }
	
}
