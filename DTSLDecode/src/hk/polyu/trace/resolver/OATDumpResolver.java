package hk.polyu.trace.resolver;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/*
 * -- Notice --
 * We use ArrayList to store ArtClass, ArtMethod and ArtInstruction since the content in oatdump file is organized in order.
 */

public class OATDumpResolver {
	
	private long mFileBaseOffset;
	private long mVirtualBaseOffset;
	
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
	
	public void resolve(String path) {
		BufferedReader br = null;
		try {
			File oatdumpFile = new File(path);
			br = new BufferedReader(new FileReader(oatdumpFile));
			
			String line = null;
			boolean findNewClass = false;
			while(true) {
				if (!findNewClass) {
					line = br.readLine();
					if (line == null)
						break;
					
					// store the file offset for code
					if (!line.startsWith("EXECUTABLE OFFSET:"))
						continue;
				
					line = br.readLine().trim(); // manually move to the next line
					assert line != null;
					mFileBaseOffset = Long.parseLong(line.replace("0x", ""), 16);
					mFileBaseOffset -= (mFileBaseOffset % 2); // even number is required
				}
				
				// This check is necessary since the previous "if" block may not always be executed.
				if (line == null)
					break;
				
				// ArtClass
				while(true) {
					if (!findNewClass)
						line = br.readLine();
					else
						findNewClass = false; // reset the flag
					
					if (line == null)
						break;
					
					if(!line.contains("type_idx="))
						continue;
					
					// Initializing an ArtClass instance.
					// Example: "0: Ljava/lang/Object; (offset=0x0000c61c) (type_idx=298) (StatusInitialized) (OatClassAllCompiled)"
					String rawClassName = line.trim().split(" ")[1];
					String className = rawClassName.replace("/", ".").substring(1, rawClassName.length() - 1);
					// System.out.println(className);
					
					ArtClass classInstance = null;
					if (ArtClass.ArtClasses.containsKey(className))
						classInstance = ArtClass.ArtClasses.get(className);
					else {
						classInstance = new ArtClass(className);
						ArtClass.ArtClasses.put(className, classInstance);
					}
					
					// ArtMethod
					while((line = br.readLine()) != null) {
						if (line.contains("type_idx=")) {
							findNewClass = true;
							break;
						}
						
						if (!line.contains("dex_method_idx="))
							continue;
						
						// Initializing an ArtMethod instance.
						// Example: "0: void java.lang.Object.<init>() (dex_method_idx=2757)"
						String methodSignature = line.trim().split(" \\(dex_method_idx=")[0].trim().split(": ")[1];
						// System.out.println(methodSignature);
						
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
						while((line = br.readLine()) != null) {
							if (!line.contains("CODE: (code_offset="))
								continue;
							
							// Example: "CODE: (code_offset=0x001ca041 size_offset=0x001ca03c size=2)"
							long startAddress = Long.parseLong(line.split("code_offset=")[1].split(" ")[0].replace("0x", ""), 16);
							startAddress -= (startAddress % 2); // even number is required
							int instructionSize = Integer.valueOf(line.split("size=")[1].split("\\)")[0]).intValue();
							long endAddress = startAddress + instructionSize;
							
							while (true) {
								line = br.readLine().trim();
								if (line.contains("NO CODE!"))
									break;
								if (!line.startsWith("0x"))
									continue;
								String backupLine = line; // backup
								
								// Initializing an ArtInstruction instance.
								// Normal Example: "0x001ca040: 4770    	bx lr"
								long sAddress = Long.parseLong(line.split(":")[0].replace("0x", ""), 16);
								line = line.split(":")[1].trim();
								String opcodesSeg = line.split("\t")[0].trim();
								long opcodes = Long.parseLong(opcodesSeg, 16);
								
								boolean willBreak = false;
								long eAddress = sAddress + (opcodesSeg.length() / 2);
								if (eAddress == endAddress)
									willBreak = true;
								if (eAddress == (endAddress + 2)) {
									System.out.println("[Warn]: abnormal case -> " + backupLine);
									willBreak = true;
								}
								
								line = line.substring(line.split("\t")[0].trim().length()).trim();
								if (line.contains(" ;")) {
									// Example: "0x00017054: 79400270	ldrh w16, [tr] ; state_and_flags"
									String disassembly = line.split(" ;")[0];
									
									ArtInstruction instructionInstance = new ArtInstruction(sAddress, opcodes, disassembly);
									instructionInstance.calculateVirtualAddress(mVirtualBaseOffset, mFileBaseOffset);
									instructionInstance.setArtMethod(methodInstance);
									if (!ArtInstruction.ArtInstructions.containsKey(instructionInstance.getVirtualAddress()))
										ArtInstruction.ArtInstructions.put(instructionInstance.getVirtualAddress(), instructionInstance);
									else
										instructionInstance = ArtInstruction.ArtInstructions.get(instructionInstance.getVirtualAddress());
									
									methodInstance.getInstructions().add(instructionInstance);
									
									if (willBreak)
										break;
									continue; // <-
								}
								if (line.contains(" (")) {
									// Example: "0x00017064: 58000440	ldr x0, pc+136 (addr 0x170ec) (0x707b1908 / 1887115528)"
									String disassembly = line.split(" \\(")[0];
									
									ArtInstruction instructionInstance = new ArtInstruction(sAddress, opcodes, disassembly);
									instructionInstance.calculateVirtualAddress(mVirtualBaseOffset, mFileBaseOffset);
									instructionInstance.setArtMethod(methodInstance);
									if (!ArtInstruction.ArtInstructions.containsKey(instructionInstance.getVirtualAddress()))
										ArtInstruction.ArtInstructions.put(instructionInstance.getVirtualAddress(), instructionInstance);
									else
										instructionInstance = ArtInstruction.ArtInstructions.get(instructionInstance.getVirtualAddress());
									
									if (line.contains("(addr ")) {
										line = line.split("\\(addr ")[1].split("\\)")[0];
										
										if (line != "") {
											if (line.charAt(0) == '-') {
												long auxiliaryAddress = -1 * Long.parseLong(line.substring(3), 16);
												instructionInstance.setHasAuxiliaryAddress(true);
												instructionInstance.setAuxiliaryAddress(auxiliaryAddress);
											}
											if (line.charAt(0) == '0') {
												long auxiliaryAddress = 1 * Long.parseLong(line.substring(2), 16);
												instructionInstance.setHasAuxiliaryAddress(true);
												instructionInstance.setAuxiliaryAddress(auxiliaryAddress);
											}
										}
									}
									
									methodInstance.getInstructions().add(instructionInstance);
									
									if (willBreak)
										break;
									continue; // <-
								}
								{
									// normal cases
									String disassembly = line;
								
									ArtInstruction instructionInstance = new ArtInstruction(sAddress, opcodes, disassembly);
									instructionInstance.calculateVirtualAddress(mVirtualBaseOffset, mFileBaseOffset);
									instructionInstance.setArtMethod(methodInstance);
									if (!ArtInstruction.ArtInstructions.containsKey(instructionInstance.getVirtualAddress()))
										ArtInstruction.ArtInstructions.put(instructionInstance.getVirtualAddress(), instructionInstance);
									else
										instructionInstance = ArtInstruction.ArtInstructions.get(instructionInstance.getVirtualAddress());
								
									methodInstance.getInstructions().add(instructionInstance);
									
									if (willBreak)
										break;
									continue;
								}
							}
							
							break;
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
