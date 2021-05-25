/*
package hk.polyu.deprecated;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;

import hk.polyu.Configuration;

public class ObjdumpSystemOatHeaderARM32 {
	private static String ObjdumpHeaderPrefix = "objdumpHeader_";

	private static String ObjdumpBin = "/home/zhouhao/Android/android-ndk-r17b/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-objdump";	
	
	private static String SystemOatDirectory = "/media/zhouhao/D313-DBB3/android/system/framework/arm/";
	
	private static String OutputDirectory = "output_PreprocessScript/";
	
	private static ArrayList<File> oats = new ArrayList<File>();
	
	private void retrieveLibrary(String path) throws IOException {
		File rootDirectory = new File(path);
		if (!rootDirectory.isDirectory() || !rootDirectory.exists()) {
			System.out.println("Root directory " + path + " which contains objdump targets is invalid, exit ...");
			System.exit(0);
		}
		
		SimpleFileVisitor<Path> finder = new SimpleFileVisitor<Path>() {
		    @Override
		    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
		    	oats.add(file.toFile());
		        return super.visitFile(file, attrs);
		    }
		};
		
		Files.walkFileTree(rootDirectory.toPath(), finder);
	}
	
	private void writeObjdumpHeader() throws IOException {
		File script = new File(OutputDirectory + "objdumpHeader_system_oat.sh");
		if (script.exists())
			script.delete();
		script.createNewFile();
		
		FileWriter fw = new FileWriter(script);
		
		fw.write("#!/bin/sh" + "\n");
		fw.write("\n");
		
		fw.write("if [ -d \"" + Configuration.Workspace + Configuration.ArmSystemOatElfHeaderDirectory + "\" ]; then" + "\n");
		fw.write("\t" + "rm -rf " + Configuration.Workspace + Configuration.ArmSystemOatElfHeaderDirectory + "\n");
		fw.write("fi" + "\n");
		fw.write("mkdir " + Configuration.Workspace + Configuration.ArmSystemOatElfHeaderDirectory + "\n");
		fw.write("\n");
		
		fw.write("OBJDUMP=" + ObjdumpBin + "\n");
		fw.write("\n");
		
		for (File oat : oats) {
			String oatPath = oat.getAbsolutePath();
			if (!oatPath.endsWith(".oat"))
				continue;
			
			String oatSubPath = oatPath;
			if (oatPath.contains(SystemOatDirectory))
				oatSubPath = "system_framework_arm_" + oatPath.replace(SystemOatDirectory, "");
			assert oatSubPath != oatPath;
			
			String objdumpHeaderPath = Configuration.Workspace + Configuration.ArmSystemOatElfHeaderDirectory + ObjdumpHeaderPrefix + oatSubPath.replace("/", "_").replace(".oat", ".txt");
			
			fw.write("$OBJDUMP" + " -h " + oatPath + " > " + objdumpHeaderPath + "\n");
		}
		
		fw.flush();
		
		fw.close();
	}
	
	public static void main(String[] args) {
		ObjdumpSystemOatHeaderARM32 generator = new ObjdumpSystemOatHeaderARM32();
		
		try {
			generator.retrieveLibrary(SystemOatDirectory);
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
		
		try {
			generator.writeObjdumpHeader();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
}
*/