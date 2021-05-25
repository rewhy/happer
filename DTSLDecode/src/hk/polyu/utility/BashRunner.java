package hk.polyu.utility;

import java.io.IOException;
import java.io.InputStream;
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
	
	public String runOutput() {
		String output = "";
		
		try {
			ProcessBuilder builder = new ProcessBuilder(this.bashCommands);
			builder.redirectOutput(Redirect.PIPE);
			builder.redirectError(Redirect.INHERIT);
			Process process = builder.start();
			// wait for thread if not asynchronous
			if(!async) process.waitFor();
			// get output
			InputStream is = process.getInputStream();
			int curByte = -1;
			while((curByte = is.read()) != -1) {
				output += (char) curByte;
			}
			output = output.trim();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		} catch (InterruptedException ie) {
			ie.printStackTrace();
		}
		
		return output;
	}
	
}
