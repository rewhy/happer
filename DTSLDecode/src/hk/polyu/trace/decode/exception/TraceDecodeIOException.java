package hk.polyu.trace.decode.exception;

import java.io.IOException;

public class TraceDecodeIOException extends TraceDecodeStopException {
	
	private static final long serialVersionUID = 1; // by default
	
	public TraceDecodeIOException(IOException ioe) {
		super(ioe);
	}

}
