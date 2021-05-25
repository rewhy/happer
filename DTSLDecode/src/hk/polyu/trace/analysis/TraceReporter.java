package hk.polyu.trace.analysis;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import hk.polyu.Configuration;
import hk.polyu.trace.decode.TraceRecord;
import hk.polyu.trace.decode.exception.TraceDecodeStopException;

public class TraceReporter implements ITraceAnalyzer {
	
	private static TraceReporter singleInstance = null;
	
	public static TraceReporter getSingleInstance() {
		if (singleInstance == null)
			singleInstance = new TraceReporter();
			
		return singleInstance;
	}
	
	private static int TRACE_RECORDS = 65535;
	private TraceRecord[] mTraceRecords;
	private int mIndex;
	
	public TraceReporter() {
		mTraceRecords = new TraceRecord[TRACE_RECORDS];
		mIndex = 0;
	}
	
	@Override
    public void addTraceRecord(TraceRecord record) throws TraceDecodeStopException {
		mTraceRecords[mIndex++] = record;
		
		if (mIndex >= TRACE_RECORDS) {
			for (int index = 0; index < mIndex; index++) {
				TraceRecord curRecord = mTraceRecords[index];
				write(curRecord.toString(), Configuration.TraceReporterFile);
			}
			
			// reset
			mTraceRecords = new TraceRecord[TRACE_RECORDS];
			mIndex = 0;
		}
    }
	
	public void flush() {
		for (int index = 0; index < mIndex; index++) {
			TraceRecord curRecord = mTraceRecords[index];
			write(curRecord.toString(), Configuration.TraceReporterFile);
		}
	}
	
	public void write(String content, String path) {
		BufferedWriter bw = null;
		try {
			File file = new File(path);
			if (!file.exists())
				file.createNewFile();
			
			bw = new BufferedWriter(new FileWriter(file, true));
			
			bw.write(content + "\n");
			
			bw.flush();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				bw.close();
			} catch(IOException ioe) {
				ioe.printStackTrace();
			}
		}
	}
	
}
