package hk.polyu.utility;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;

public class OatdumpSystemOatARM32 {
	
	private static String OatdumpBin = "oatdump";
	private static String SystemOatDirectory = "/media/zhouhao/27E6-0188/android/system/framework/arm/"; // <- adjust this constant
	private static String OutputDirectory = "PreprocessScripts/";
	
	private static ArrayList<File> oats = new ArrayList<File>();
	
	private void retrieveLibrary(String path) throws IOException {
		File rootDirectory = new File(path);
		if (!rootDirectory.isDirectory() || !rootDirectory.exists()) {
			System.out.println("Root directory " + path + " is invalid, exit ...");
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
		File script = new File(OutputDirectory + "oatdump_arm.sh");
		if (script.exists())
			script.delete();
		script.createNewFile();
		
		FileWriter fw = new FileWriter(script);
		
		fw.write("#!/system/bin/sh" + "\n");
		fw.write("\n");
		// directory "/sdcard/sdcard/oatdump" restores the output of oatdump
		fw.write("if [ ! -d \"" + "/sdcard/sdcard/oatdump/" + "\" ]; then" + "\n");
		fw.write("\t" + "mkdir " + "/sdcard/sdcard/oatdump/" + "\n");
		fw.write("fi" + "\n");
		fw.write("if [ ! -d \"" + "/sdcard/sdcard/oatdump/arm/" + "\" ]; then" + "\n");
		fw.write("\t" + "mkdir " + "/sdcard/sdcard/oatdump/arm/" + "\n");
		fw.write("fi" + "\n");
		fw.write("\n");
		
		fw.write("OATDUMP=" + OatdumpBin + "\n");
		fw.write("\n");
		
		for (File oat : oats) {
			String oatOriginPath = oat.getAbsolutePath();
			if (!oatOriginPath.endsWith(".oat"))
				continue;
				
			String oatPath = oatOriginPath.replace(SystemOatDirectory, "/sdcard/sdcard/android/system/framework/arm/");
			
			String oatSubPath = oatOriginPath;
			if (oatOriginPath.contains(SystemOatDirectory))
				oatSubPath = "system_framework_arm_" + oatOriginPath.replace(SystemOatDirectory, "");
			assert oatSubPath != oatOriginPath;
			
			String oatdumpPath = "/sdcard/sdcard/oatdump/arm/" + oatSubPath.replace("/", "_").replace(".oat", ".txt");
			
			fw.write("echo " + oatPath + "\n");
			fw.write("$OATDUMP" + " --oat-file=" + oatPath + " --output=" + oatdumpPath + "\n");
		}
		
		fw.flush();
		fw.close();
	}
	
	public static void main(String[] args) {
		OatdumpSystemOatARM32 generator = new OatdumpSystemOatARM32();
		
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
