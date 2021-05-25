package hk.polyu.trace.resolver;

import java.util.ArrayList;
import java.util.Arrays;

import hk.polyu.utility.BashRunner;

public class ArtMethodSearcher {
	
	public static ArtMethod search(String className, String methodSignature, String type) {
		ArrayList<ArtMethod> artMethods = new ArrayList<ArtMethod>();
		
		ArtClass artClass = ArtClass.ArtClasses.get(className);
		for (ArtMethod artMethod : artClass.getMethods()) {
			String mangledSignature = artMethod.getMethodSignature();
			if (type == "native") {
				mangledSignature = mangledSignature.replace(className + ".", "").replace("<", "").replace(">", "");
				if (mangledSignature.startsWith("__dl_")) {
					// mangled method name in "linker" begins with this suffix
					mangledSignature = mangledSignature.replace("__dl_", "");
					
					// execute c++filt to decode the mangled name
					ArrayList<String> commands = new ArrayList<String>();
					String[] commonCmd = { "/bin/sh", "-c" };
					commands.addAll(Arrays.asList(commonCmd));
					commands.add(String.format("%s %s", "c++filt", mangledSignature.replace("$", "\\$")));
					BashRunner bash = new BashRunner(commands, false);
					String demangledSignature = bash.runOutput();
					if (demangledSignature.startsWith(methodSignature)) {
						// System.out.println(artMethod.getMethodSignature() + " -->> " + demangledSignature); // debug
						artMethods.add(artMethod);
					}
				} else {
					// normal cases
					// execute c++filt to decode the mangled name
					ArrayList<String> commands = new ArrayList<String>();
					String[] commonCmd = { "/bin/sh", "-c" };
					commands.addAll(Arrays.asList(commonCmd));
					commands.add(String.format("%s %s", "c++filt", mangledSignature.replace("$", "\\$")));
					BashRunner bash = new BashRunner(commands, false);
					String demangledSignature = bash.runOutput();
					if (demangledSignature.equals(methodSignature)) {
						// System.out.println(artMethod.getMethodSignature() + " -->> " + demangledSignature); // debug
						artMethods.add(artMethod);
					}
				}
			}
			if (type == "java") {
				if (artMethod.getMethodSignature().equals(methodSignature)) {
					artMethods.add(artMethod);
				}
			}
		}
		
		assert artMethods.size() == 1;
		return artMethods.get(0);
	}

}
