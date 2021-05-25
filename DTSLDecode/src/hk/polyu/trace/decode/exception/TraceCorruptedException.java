package hk.polyu.trace.decode.exception;

public class TraceCorruptedException extends Exception {

	private static final long serialVersionUID = 1; // by default

	public TraceCorruptedException(String exceptionMsg) {
        super(exceptionMsg);
    }
    
    public String getShortMessage() {
        return getMessage();
    }
	
}
