package hk.polyu.trace.decode;

public abstract class TraceMessageRecord extends TraceRecord {
	
	private String mMessageText;
	private int mRepeatCount;
	
	protected String getMessageText() {
        return mMessageText;
    }
	protected void setMessageText(String messageText) {
        mMessageText = messageText;
    }
	
	public TraceMessageRecord(String text) {
		mRepeatCount = 1;
		setMessageText(text);
	}
	
	public abstract MessageType getMessageType();
	
	@Override
	public String getText() {
		if (mRepeatCount > 1)
			return getMessageText() + " (x" + mRepeatCount + ")";
		
        return getMessageText();
	}

	@Override
	public boolean hasIndex() {
		return false;
	}
	
	public String getMessage() {
    	return getMessageText();
    }
	
	public String toString() {
        return getText();
    }

	@Override
	public String copyText() {
		return getText();
	}
	
	public enum MessageType {
        ERROR("ERROR", 0), 
        INFO("INFO", 1), 
        CONTEXT_ID("CONTEXT_ID", 2), 
        TIMESTAMP("TIMESTAMP", 3), 
        REGRESSIVE_TIMESTAMP("REGRESSIVE_TIMESTAMP", 4), 
        TRIGGER("TRIGGER", 5), 
        VMID("VMID", 6), 
        WARNING("WARNING", 7), 
        EXCEPTION("EXCEPTION", 8), 
        DATA_TRACE("DATA_TRACE", 9), 
        CYCLE_COUNT("CYCLE_COUNT", 10);
        
        private MessageType(String type, int index) {}
    }
	
}
