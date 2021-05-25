package hk.polyu;

public class Configuration {
	public static boolean DEBUG = false;
	public static boolean ArtInstructionTracing = false;
	public static boolean ArtMethodTracingNormal = false;
	public static boolean ArtMethodTracingUnpack = false;
	
	// ---- constants related to customizing DS-5 ---- //
	
	public static String Workspace = System.getProperty("user.dir") + "/";
	
	// ---- constants related to trace analysis ---- //
	
	// Arm //
	public static String ArmSystemOatDirectory = "Arm/system_oat/";
	public static String ArmSystemLibDirectory = "Arm/system_lib/";
	public static String ArmSystemLibHeaderDirectory = "Arm/system_libHeader/";
	public static String ArmSystemBinDirectory = "Arm/system_bin/";
	public static String ArmSystemBinHeaderDirectory = "Arm/system_binHeader/";
	
	public static String ArmApplicationOatDirectory = "Arm/application_oat/";
	public static String ArmApplicationLibDirectory = "Arm/application_lib/";
	public static String ArmApplicationLibHeaderDirectory = "Arm/application_libHeader/";
	
	// AArch64 //
	public static String AArch64SystemOatDirectory = "AArch64/system_oat/";
	public static String AArch64SystemLibDirectory = "AArch64/system_lib/";
	public static String AArch64SystemLibHeaderDirectory = "AArch64/system_libHeader/";
	public static String AArch64SystemBinDirectory = "AArch64/system_bin/";
	public static String AArch64SystemBinHeaderDirectory = "AArch64/system_binHeader/";
	
	public static String AArch64ApplicationOatDirectory = "AArch64/application_oat/";
	public static String AArch64ApplicationLibDirectory = "AArch64/application_lib/";
	public static String AArch64ApplicationLibHeaderDirectory = "AArch64/application_libHeader/";
	
	// trace file
	public static String TraceFile = "/home/zhouhao/etm_trace.bin";
	
	// memory map (i.e., /proc/pid/maps)
	public static String MemoryMapFile = "memory_maps.txt";
	
	// TraceReporter output file path
	public static Long libart_start = 0xee7a6000L;
	public static Long libart_file_offset = 0xab800L;
	public static Long libart_memory_offset = 0x9f800L;
	public static Long art_quick_invoke_stub_internal = 0x40174eL;
	public static Long art_quick_resolution_trampoline = 0x405c04L;
	
	public static String TraceReporterFile = "/home/zhouhao/instructions.txt";
	public static String InvocationChainReporterFile = "/home/zhouhao/invocations.txt";
	
	// Callgraph (in Gephi format) output file path
	public static String InvocationChainGephiFile = "/home/zhouhao/invocations.gexf";
	public static String CallgraphGephiFile = "/home/zhouhao/callgraph.gexf";
	
	// DS scripts output directory
	public static String DSScriptDirectory = "output_DSScripts/";
	
	// ---- constants related to the application under analysis ---- //
	
	// package name
	public static String PackageName = "com.scotiabank.banking";
}
