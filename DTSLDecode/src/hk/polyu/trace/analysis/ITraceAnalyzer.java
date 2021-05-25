package hk.polyu.trace.analysis;

import hk.polyu.trace.decode.TraceRecord;
import hk.polyu.trace.decode.exception.TraceDecodeStopException;

public interface ITraceAnalyzer {
	
	void addTraceRecord(TraceRecord record) throws TraceDecodeStopException;

}
