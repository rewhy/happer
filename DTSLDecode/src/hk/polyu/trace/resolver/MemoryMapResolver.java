package hk.polyu.trace.resolver;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;

import hk.polyu.Configuration;
import hk.polyu.trace.resolver.MemoryBlock.MemoryBlockOwner;

/*
 * -- Notice --
 * We use a HashMap to store executable MemoryBlocks since we do not care about the order of the blocks.
 */

public class MemoryMapResolver {
	// single instance
	private static MemoryMapResolver instance = null;
	public static MemoryMapResolver getSingleInstance() {
		if (instance == null)
			instance = new MemoryMapResolver();
		
		return instance;
	}
			
	// ---- //
	
	private HashMap<String, HashSet<MemoryBlock>> mExecutableMemoryBlockMap = new HashMap<String, HashSet<MemoryBlock>>(); // name -> HashSet<MemoryBlock>
	public HashMap<String, HashSet<MemoryBlock>> getExecutableMemoryBlockMap() {
		return mExecutableMemoryBlockMap;
	}
	
	public void resolve(String path) {
		BufferedReader br = null;
		try {
			File memoryFile = new File(path);
			br = new BufferedReader(new FileReader(memoryFile));
			
			String line = null;
			while((line = br.readLine()) != null) {
				// example: "70535000-70b6e000 r-xp 001da000 08:02 3811			/system/framework/arm64/boot.oat"
				
				String[] elements = line.split(" ");
				
				// elements[0] -> address range
				String range = elements[0];
				long start = Long.parseLong(range.split("-")[0], 16);
				long end = Long.parseLong(range.split("-")[1], 16);
				
				// elements[1] -> rwxp
				String property = elements[1];
				boolean readable = property.charAt(0) == 'r' ? true : false;
				boolean writable = property.charAt(1) == 'w' ? true : false;
				boolean executable = property.charAt(2) == 'x' ? true : false;
				
				// elements[?] -> name (name always contains '/' character)
				String fileName = "";
				for(int i = 2; i < elements.length; i++) {
					if (elements[i].contains("/") || elements[i].equals("[vdso]")) {
						fileName = elements[i];
						break;
					}
				}
				
				// In some cases, the name of the loaded memory block maybe "" or contains "(deleted)".
				// Currently, we just ignore these cases.
				if (fileName == "" || fileName.contains("(deleted)"))
					continue;
				
				// System.out.println(line);
				// System.out.println(String.format("start: 0x%08x, end: 0x%08x, name: %s", start, end, fileName));
				
				MemoryBlock block = new MemoryBlock(start, end, readable, writable, executable, fileName);
				if (block.isExecutable()) {
					// set the owner of the memory block
					if (fileName.startsWith("/system") || fileName.startsWith("/vendor") || fileName.startsWith("/dev") || fileName.equals("[vdso]"))
						block.setOwner(MemoryBlockOwner.Sys);
					if (fileName.contains(Configuration.PackageName))
						block.setOwner(MemoryBlockOwner.App);
					
					if (mExecutableMemoryBlockMap.containsKey(fileName)) {
						mExecutableMemoryBlockMap.get(block.getFileName()).add(block);
					} else {
						mExecutableMemoryBlockMap.put(block.getFileName(), new HashSet<MemoryBlock>());
						mExecutableMemoryBlockMap.get(block.getFileName()).add(block);
					}
				}
				
				// TODO: Dealing with none-executable blocks.
			}
		} catch(FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		} catch(RuntimeException re) {
			re.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		
		// Debug: show the file that has multiple executable MemoryBlocks
		for (String executableName : mExecutableMemoryBlockMap.keySet()) {
			HashSet<MemoryBlock> executableBlocks = mExecutableMemoryBlockMap.get(executableName);
			if (executableBlocks.size() > 1) {
				System.out.println("[Warn] " + executableName + " has multiple executable memory regions");
				for (MemoryBlock executableBlock : executableBlocks) {
					System.out.println("\t" + executableBlock.toString());
				}
			}
		}
	}
	
	public boolean inferArm() {
		boolean isArm = false;
		
		boolean cArm = false;
		boolean cLib = false;
		boolean cLinker = false;
		for (String executableName : mExecutableMemoryBlockMap.keySet()) {
			if (executableName.startsWith("/system/framework/arm/"))
				cArm = true;
			if (executableName.startsWith("/system/lib/"))
				cLib = true;
			if (executableName.equals("/system/bin/linker"))
				cLinker = true;
				
			if (cArm && cLib && cLinker) {
				isArm = true;
				break;
			}
		}
		
		return isArm;
	}
	
	public boolean inferAArch64() {
		boolean isAArch64 = false;
		
		boolean cArm64 = false;
		boolean cLib64 = false;
		boolean cLinker64 = false;
		for (String executableName : mExecutableMemoryBlockMap.keySet()) {
			if (executableName.startsWith("/system/framework/arm64/"))
				cArm64 = true;
			if (executableName.startsWith("/system/lib64/"))
				cLib64 = true;
			if (executableName.equals("/system/bin/linker64"))
				cLinker64 = true;
			
			if (cArm64 && cLib64 && cLinker64) {
				isAArch64 = true;
				break;
			}
		}
		
		return isAArch64;
	}
	
	public Long getExecutableStartAddress(String path) {
		HashSet<MemoryBlock> executableMemoryBlocks = mExecutableMemoryBlockMap.get(path);
		Long startAddress = null;
		for (MemoryBlock block : executableMemoryBlocks) {
			Long curAddress = block.getStartAddress();
			if (startAddress == null)
				startAddress = curAddress;
			else
				startAddress = Long.max(startAddress, curAddress);
		}
		
		return startAddress;
	}
	
	public MemoryBlockOwner getOwnerOfAddress(Long address) {
		for (HashSet<MemoryBlock> blocks : mExecutableMemoryBlockMap.values()) {
			for (MemoryBlock block : blocks) {
				if (address >= block.getStartAddress() && address <= block.getEndAddress())
					return block.getOwner();
			}
		}
		
		return MemoryBlockOwner.Unknow;
	}
	
	public void printExecutableMemoryBlockMap() {
		for (String fileName : mExecutableMemoryBlockMap.keySet()) {
			for (MemoryBlock block : mExecutableMemoryBlockMap.get(fileName)) {
				System.out.println(block);
			}
		}
	}

}
