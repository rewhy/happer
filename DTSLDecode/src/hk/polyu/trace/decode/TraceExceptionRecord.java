package hk.polyu.trace.decode;

public class TraceExceptionRecord extends TraceMessageRecord {

	private boolean mCanceled;
	
	public void setCanceled() {
        mCanceled = true;
    }
	public boolean getCanceled() {
		return mCanceled;
	}
	
	public TraceExceptionRecord(ITraceException exception) {
		super("TRACE_RECORD_EXCEPTION" + " " + exception.getTitle() + " " + exception.getNumber());
	}
	
	public TraceExceptionRecord() {
        super("PROCESSOR_EXCEPTION");
    }
	
	@Override
    public MessageType getMessageType() {
        return MessageType.EXCEPTION;
    }

}
