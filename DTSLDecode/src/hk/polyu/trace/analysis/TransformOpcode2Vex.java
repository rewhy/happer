package hk.polyu.trace.analysis;

import java.util.ArrayList;
import java.util.HashMap;

import hk.polyu.trace.decode.ETMv4Decoder;
import hk.polyu.trace.resolver.ArtInstruction;

public class TransformOpcode2Vex {
	private static TransformOpcode2Vex singleInstance = null;
	
	public static TransformOpcode2Vex getSingleInstance() {
		if (singleInstance == null)
			singleInstance = new TransformOpcode2Vex();
			
		return singleInstance;
	}
	
	private HashMap<Long, BasicBlock> BasicBlocks = new HashMap<Long, BasicBlock>();
	
	private Long pendingBinaryStartAddress = null;
	private Long pendingBinaryEndAddress = null;
	private final int MAX_PENDING_SIZE = 65536;
	private byte[] pendingBinary = new byte[MAX_PENDING_SIZE];
	
	public byte[] getPendingBinary() {
		return pendingBinary;
	}
	
	public void addPendingBinary(long opcode) {
		int binaryOffset = (int) (pendingBinaryEndAddress - pendingBinaryStartAddress);
		
		pendingBinary[binaryOffset] = (byte) ((opcode >> 0) & 0xff);
		pendingBinary[binaryOffset + 1] = (byte) ((opcode >> 8) & 0xff);
		pendingBinary[binaryOffset + 2] = (byte) ((opcode >> 16) & 0xff);
		pendingBinary[binaryOffset + 3] = (byte) ((opcode >> 24) & 0xff);
	}
	
	public void setPendingBinaryStartAddress(long start) {
		pendingBinaryStartAddress = start;
	}
	public long getPendingBinaryStartAddress() {
		return pendingBinaryStartAddress;
	}
	
	public void setPendingBinaryEndAddress(long end) {
		pendingBinaryEndAddress = end;
	}
	public long getPendingBinaryEndAddress() {
		return pendingBinaryEndAddress;
	}
	
	private void processPendingBinary() {
		while(pendingBinaryStartAddress.longValue() <= pendingBinaryEndAddress.longValue()) {		
			int consumeInstructionCount = generateIR(pendingBinaryStartAddress, pendingBinary);
			
			BasicBlock block = null;
			if (!BasicBlocks.containsKey(pendingBinaryStartAddress.longValue())) {
				// create a new BasicBlock instance
				block = new BasicBlock();
				block.setStartAddress(pendingBinaryStartAddress);
				block.setEndAddress(pendingBinaryStartAddress + (consumeInstructionCount- 1) * 4);
			
				BasicBlocks.put(pendingBinaryStartAddress.longValue(), block);
			} else {
				block = BasicBlocks.get(pendingBinaryStartAddress.longValue());
			}
		
			// System.out.println(block.toString());
			for (ArtInstruction instruction : block.getInstructions()) {
				// ETMv4Decoder.write(instruction.toString());
			}
			// ETMv4Decoder.write(block.toString() + "\n");
		
			// update pendingBinaryStartAddress and pendingBinary
			pendingBinaryStartAddress += consumeInstructionCount * 4;
			pendingBinary = updateBinary(pendingBinary, consumeInstructionCount * 4);
		} 
		
		pendingBinary = new byte[MAX_PENDING_SIZE];
	}
	
	private byte[] updateBinary(byte[] originBinary, int consumption) {
		int remainingInstructionCount = ((int) (pendingBinaryEndAddress - pendingBinaryStartAddress) / 4) + 1;
		byte[] remainingBinary = new byte[remainingInstructionCount * 4];
		for (int index = 0; index < remainingInstructionCount * 4; index++) {
			remainingBinary[index] = originBinary[consumption + index];
		}
		
		return remainingBinary;
	}
	
	public void execute(ArtInstruction curInstruction) {
		if (pendingBinaryStartAddress == null) {
        	// this branch refers that we have just started our transformation
        	setPendingBinaryStartAddress(curInstruction.getVirtualAddress());
        	setPendingBinaryEndAddress(curInstruction.getVirtualAddress());
        	
        	addPendingBinary(curInstruction.getOpcodes());
        } else {
        	if (curInstruction.getVirtualAddress() - 4 != pendingBinaryEndAddress.longValue()) {
            	// this branch refers that the path has jumped to a non-continuous place
        		processPendingBinary();
        		
        		// after the process, we need reset the pendingBinaryStartAddress and the pendingBinaryEndAddress
        		setPendingBinaryStartAddress(curInstruction.getVirtualAddress());
            	setPendingBinaryEndAddress(curInstruction.getVirtualAddress());
            	
            	addPendingBinary(curInstruction.getOpcodes());
            } else {
            	// adjust the pendingBinaryEndAddress
            	setPendingBinaryEndAddress(curInstruction.getVirtualAddress());
            	
            	addPendingBinary(curInstruction.getOpcodes());
            }
        }
	}
	
	// 
	public class BasicBlock {
		/*
		private ArrayList<ArtInstruction> instructions = new ArrayList<ArtInstruction>();
		
		public ArrayList<ArtInstruction> getInstructions() {
			return instructions;
		}
		
		// not necessary
		public byte[] getBinary() {
			int binarySize = instructions.size() * 4;
			byte[] binary = new byte[binarySize];
			
			for (int index = 0; index < instructions.size(); index++) {
				ArtInstruction instruction = instructions.get(index);
				binary[index * instruction.getOpcodeSize() + 0] = (byte) ((instruction.getOpcodes() >> 24) & 0xff);
				binary[index * instruction.getOpcodeSize() + 1] = (byte) ((instruction.getOpcodes() >> 16) & 0xff);
				binary[index * instruction.getOpcodeSize() + 2] = (byte) ((instruction.getOpcodes() >> 8) & 0xff);
				binary[index * instruction.getOpcodeSize() + 3] = (byte) ((instruction.getOpcodes() >> 0) & 0xff);
			}
			
			return binary;
		}
		
		public String toString() {
            String startAddress = String.format("Block starts at: 0x%08x", instructions.get(0).getVirtualAddress());
            String endAddress = String.format("Block ends at: 0x%08x", instructions.get(instructions.size() - 1).getVirtualAddress());
            
            return startAddress + ", " + endAddress;
        }
        */
		
		private Long startAddress = null;
		private Long endAddress = null;
		
		public void setStartAddress(long start) {
			startAddress = start;
		}
		public long getStartAddress() {
			return startAddress;
		}
		
		public void setEndAddress(long end) {
			endAddress = end;
		}
		public long getEndAddress() {
			return endAddress;
		}
		
		public ArrayList<ArtInstruction> getInstructions() {
			ArrayList<ArtInstruction> instructions = new ArrayList<ArtInstruction>();
			
			int instructionCount = (int) ((endAddress - startAddress) / 4) + 1;
			for (int i = 0; i < instructionCount; i++) {
				long curAddress = startAddress + 4 * i;
				ArtInstruction curInstruction = ArtInstruction.ArtInstructions.get(curAddress);
				instructions.add(curInstruction);
			}
			
			return instructions;
		}
		
		public String toString() {
            String startAddress = String.format("Block starts at: 0x%08x", getStartAddress());
            String endAddress = String.format("Block ends at: 0x%08x", getEndAddress());
            
            return startAddress + ", " + endAddress;
        }
	}
	
	// native method declarations
	public native int generateIR(long ip, byte[] binary);
	
}
