package hk.polyu.trace.decode.exception;

public abstract class TraceDecodeStopException extends Exception {
	
	private static final long serialVersionUID = 1; // by default

	public TraceDecodeStopException() {
		/* null */
	}
	
	public TraceDecodeStopException(Exception cause) {
		super(cause);
	}
	  
	public TraceDecodeStopException(String exceptionMsg) {
		super(exceptionMsg);
	}

}
