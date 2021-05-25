package hk.polyu;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Arrays;

import hk.polyu.repackage.ParseETMv4TraceSource;
import hk.polyu.repackage.ParseNewTraceReportCommand;
import hk.polyu.repackage.ParseTraceReaderDTSL;
import hk.polyu.repackage.SootEnvironment;
import hk.polyu.utility.BashRunner;

public class MainImpl {
	
	public static void main(String[] args) {
		// the execution order below should not be changed
		int step = 2;
		
		// step 1: parse DTSL module
		if (step == 1) {
			System.out.println("start parsing jar: " + Configuration.DTSLJar);
			SootEnvironment.env = new SootEnvironment();
			SootEnvironment.env.initSoot(Arrays.asList(new String[] {Configuration.DTSLJar}), Configuration.OutputRepackagedJarDirectory);
			
			// the internal execution order should not be changed as well
			ParseETMv4TraceSource parserETMv4TraceSource = new ParseETMv4TraceSource();
			parserETMv4TraceSource.exec();
			//
			
			SootEnvironment.env.outputJar();
			updateJar(Configuration.Workspace + Configuration.DTSLJar, "com.arm.debug.dtsl.components.ETMv4TraceSource");
			System.out.println("end parsing jar file");
		}
		//
		
		// step 2: parse TRACE module
		if (step == 2) {
			System.out.println("start parsing jar: " + Configuration.TRACEJar);
			SootEnvironment.env = new SootEnvironment();
			SootEnvironment.env.initSoot(Arrays.asList(new String[] {Configuration.TRACEJar, Configuration.EVENTSJar}), Configuration.OutputRepackagedJarDirectory);
		
			// the internal execution order should not be changed as well
			ParseTraceReaderDTSL parserTraceReaderDTSL = new ParseTraceReaderDTSL();
			parserTraceReaderDTSL.exec();
			
			// ParseTraceDecoderETM4X parserTraceDecoderETM4X = new ParseTraceDecoderETM4X();
			// parserTraceDecoderETM4X.exec();
			
			ParseNewTraceReportCommand parserNewTraceReportCommand = new ParseNewTraceReportCommand();
			parserNewTraceReportCommand.exec();
			
			//
			SootEnvironment.env.outputJar();
			updateJar(Configuration.Workspace + Configuration.TRACEJar, "com.arm.debug.trace.decode.TraceReaderDTSLSource");
			// updateJar(Configuration.crtWorkspace + Configuration.jarTRACE, "com.arm.debug.trace.decode.TraceReaderDTSLSource$Chunk");
			// updateJar(Configuration.crtWorkspace + Configuration.jarTRACE, "com.arm.debug.trace.decode.TraceDecoderETM4X");
			// updateJar(Configuration.crtWorkspace + Configuration.jarTRACE, "com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$1");
			// updateJar(Configuration.crtWorkspace + Configuration.jarTRACE, "com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$2");
			// updateJar(Configuration.crtWorkspace + Configuration.jarTRACE, "com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$4");
			// updateJar(Configuration.crtWorkspace + Configuration.jarTRACE, "com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$12");
			// updateJar(Configuration.crtWorkspace + Configuration.jarTRACE, "com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$31");
			// updateJar(Configuration.crtWorkspace + Configuration.jarTRACE, "com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$33");
			updateJar(Configuration.Workspace + Configuration.TRACEJar, "com.arm.debug.trace.commands.NewTraceReportCommand");
			//
			System.out.println("end parsing jar file");
		}
		//
		
	}
	
	// auxiliary methods
	
	public static void waitForIO(long milis) {
		try {
			Thread.sleep(milis);
		} catch(InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	public static void updateJar(String jarPath, String className) {
		String classPath = transferN2P(className);
		
		try {
			// create shell script
			File shScript = new File(Configuration.Workspace + Configuration.OutputRepackagedJarDirectory + "/" + className.replace(".", "_") + ".sh");
			if (shScript.exists()) {
				shScript.delete();
			}
			System.out.println(shScript.getAbsolutePath());
			shScript.createNewFile();
			
			BufferedWriter bw = new BufferedWriter(new FileWriter(shScript));
			bw.write("#!/bin/bash" + "\n");
			bw.write("\n");
			bw.write(String.format("%s %s", "cd", Configuration.Workspace + Configuration.OutputRepackagedJarDirectory) + "\n");
			bw.write(String.format("%s %s %s %s", "jar", "uf", jarPath, classPath.replace("$", "\\$"), ";") + "\n");
			
			bw.flush();
			bw.close();
			
			// execute shell script
			ArrayList<String> commands = new ArrayList<String>();
			String[] commonCmd = { "/bin/sh", "-c" };
			commands.addAll(Arrays.asList(commonCmd));
			commands.add(String.format("%s %s", "sh", shScript.getAbsolutePath().replace("$", "\\$")));
			
			BashRunner bash = new BashRunner(commands, false);
			bash.run();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// class name -> output class path
	public static String transferN2P(String className) {
		// String prefix = Configuration.outputJarDir;
		String suffix = ".class";
		String classPath = /*prefix + "/" +*/ className.replace(".", "/") + suffix;
		
		return classPath;
	}

}
