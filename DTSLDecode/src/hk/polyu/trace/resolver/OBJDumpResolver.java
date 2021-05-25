package hk.polyu.trace.resolver;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class OBJDumpResolver {
	
	private Long mFileBaseOffset;
	private Long mVirtualBaseOffset;
	
	public void setFileBaseOffset(long offset) {
		mFileBaseOffset = offset;
	}
	public long getFileBaseOffset() {
		return mFileBaseOffset;
	}
	
	public void setVirtualBaseOffset(long offset) {
		mVirtualBaseOffset = offset;
	}
	public long getVirtualBaseOffset() {
		return mVirtualBaseOffset;
	}
	
	public void resolve(String libraryName, String path) {
		BufferedReader br = null;
		try {
			File oatdumpFile = new File(path);
			br = new BufferedReader(new FileReader(oatdumpFile));
			
			String line = null;
			boolean readNextLine = true;
			while(true) {
				if (readNextLine)
					line = br.readLine();
				
				if (line == null)
					break;
				
				if (!line.startsWith("Disassembly of section .plt:") && !line.startsWith("Disassembly of section .text:") && !line.startsWith("Disassembly of section .gnu.text:")) {
					readNextLine = true;
					continue;
				} else {
					readNextLine = true;
					
					br.readLine(); // consume a blank line;
					
					while((line = br.readLine()) != null) {
						if (line.trim().startsWith("Disassembly of section")) {
							readNextLine = false;
							break;
						}
							
						// Initializing an ArtClass instance.
						ArtClass classInstance = null;
						if (ArtClass.ArtClasses.containsKey(libraryName))
							classInstance = ArtClass.ArtClasses.get(libraryName);
						else {
							classInstance = new ArtClass(libraryName);
							ArtClass.ArtClasses.put(libraryName, classInstance);
						}
					
						// ArtMethod
						// Example: "0000000000015c58 <__cxa_finalize@plt-0x20>:"
						String methodSubSignature = line.split(" ")[1].split(":")[0];
						String methodSignature = classInstance.getName() + "." + methodSubSignature;
						// System.out.println(methodSubSignature);
					
						// Initializing an ArtMethod instance.
						ArtMethod methodInstance = null;
						if (ArtMethod.ArtMethods.containsKey(methodSignature))
							methodInstance = ArtMethod.ArtMethods.get(methodSignature);
						else {
							methodInstance = new ArtMethod(methodSignature);
							methodInstance.setArtClass(classInstance);
							ArtMethod.ArtMethods.put(methodSignature, methodInstance);
						}
						classInstance.getMethods().add(methodInstance);
					
						// ArtInstruction
						// Example: "15c58:	a9bf7bf0 	stp	x16, x30, [sp,#-16]!"
						while((line = br.readLine()) != null) {
							line = line.trim();
							if (line.equals(""))
								break;
							if (line.startsWith("..."))
								continue;
							if (line.contains("is out of bounds"))
								continue;
							
							// Initializing an ArtInstruction instance
							long address = Long.parseLong(line.split(":")[0], 16);
							address -= (address % 2); // even number is required
							line = line.split(":")[1].trim();
							long opcodes = Long.parseLong(line.split("\t")[0].trim().replace(" ", ""), 16);
							line = line.substring(line.split("\t")[0].length()).trim();
							String disassembly = line;
						
							ArtInstruction instructionInstance = new ArtInstruction(address, opcodes, disassembly);
							instructionInstance.calculateVirtualAddress(mVirtualBaseOffset, mFileBaseOffset);
							instructionInstance.setArtMethod(methodInstance);
							if (!ArtInstruction.ArtInstructions.containsKey(instructionInstance.getVirtualAddress()))
								ArtInstruction.ArtInstructions.put(instructionInstance.getVirtualAddress(), instructionInstance);
							else
								instructionInstance = ArtInstruction.ArtInstructions.get(instructionInstance.getVirtualAddress());
							
							// System.out.println(instructionInstance.toString());
							methodInstance.getInstructions().add(instructionInstance);
						}
					}
				}
			}
		} catch(FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
			} catch(IOException ioe) {
				ioe.printStackTrace();
			}
		}
	}

}
