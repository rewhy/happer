package hk.polyu.utility;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;

public class BashRunner {

	private final ArrayList<String> bashCommands;
	private final boolean async;
	
	public BashRunner(ArrayList<String> bashCommands, boolean async){
		this.bashCommands = bashCommands;
		this.async = async;
	}
	
	public void run(){
		try {
			ProcessBuilder builder = new ProcessBuilder(this.bashCommands);
			builder.redirectOutput(Redirect.INHERIT);
			builder.redirectError(Redirect.INHERIT);
			Process process = builder.start();
			// wait for thread if not asynchronous
			if(!async) process.waitFor();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		} catch (InterruptedException ie) {
			ie.printStackTrace();
		}
	}
	
}
