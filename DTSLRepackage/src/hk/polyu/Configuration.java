package hk.polyu;

public class Configuration {
	
	// ---- constants related to customizing DS-5 ---- //
	
	public static String Workspace = System.getProperty("user.dir") + "/";
	
	public static String RTJar = "/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/rt.jar";
	public static String DTSLJar = "DSJar/com.arm.debug.dtsl_2020.1.0.20201103_143658.jar";
	public static String EVENTSJar = "DSJar/com.arm.debug.events_2020.1.0.20201103_143658.jar";
	public static String TRACEJar = "DSJar/com.arm.debug.trace_2020.1.0.20201103_143658.jar";
	
	public static String OutputRepackagedJarDirectory = "output_DSJar/";
	
	// ----
	
}
