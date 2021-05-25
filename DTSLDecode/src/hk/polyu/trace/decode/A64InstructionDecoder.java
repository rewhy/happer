package hk.polyu.trace.decode;

import java.util.ArrayList;

import com.arm.debug.icodec.Instruction;
import com.arm.debug.icodec.InstructionDecoder;
import com.arm.debug.icodec.swig.Architecture;
import com.arm.text.FormattedException;

public class A64InstructionDecoder {
	
	private Architecture.CoreVersion coreVersion;
	private Architecture.VFPNEONVersion vfpNeonVersion;
	private Architecture aarch64;
	private ArrayList<Architecture.ArchExtension> extension = new ArrayList<Architecture.ArchExtension>();
	
	public A64InstructionDecoder() {
		coreVersion = Architecture.CoreVersion.core_v8A_64;
		vfpNeonVersion = Architecture.VFPNEONVersion.vfpneon_v8A_fp_neon;
		aarch64 = new Architecture(coreVersion, vfpNeonVersion);
		
		extension.add(Architecture.ArchExtension.extension_cryptography);
		extension.add(Architecture.ArchExtension.extension_dotproduct);
		extension.forEach(aarch64::addExtension);
	}
	
	public Instruction decode(long encodedInstruction) {
		Instruction instruction = null;
		
		try {
			InstructionDecoder decoder = new InstructionDecoder();
			instruction = decoder.decodeA64(encodedInstruction, aarch64);
		} catch(FormattedException fe) {
			fe.printStackTrace();
		}
		
		assert instruction != null;
		return instruction;
	}

}
