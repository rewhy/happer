package hk.polyu.trace.resolver;

import java.util.ArrayList;
import java.util.HashMap;

public class ArtMethod {
	// fake methods
	public static ArtMethod AppMethod = new ArtMethod("AppMethod");
	public static ArtMethod SysMethod = new ArtMethod("SysMethod");
	public static ArtMethod UNKNOW = new ArtMethod("Unknow");
	// initialize fake methods
	static {
		AppMethod.setArtClass(ArtClass.AppClass);
		SysMethod.setArtClass(ArtClass.SysClass);
		UNKNOW.setArtClass(ArtClass.UNKNOW);
	}
	
	public static HashMap<String, ArtMethod> ArtMethods = new HashMap<String, ArtMethod>(); // method signature -> ArtMethod
	
	private ArtClass mArtClass;
	private String mSignature;
	private ArrayList<ArtInstruction> mInstructions;
	
	public void setArtClass(ArtClass artClass) {
		mArtClass = artClass;
	}
	public ArtClass getArtClass() {
		return mArtClass;
	}
	
	public void setMethodSignature(String signature) {
		mSignature = signature;
	}
	public String getMethodSignature() {
		return mSignature;
	}
	
	public void setInstructions(ArrayList<ArtInstruction> list) {
		mInstructions = list;
	}
	public ArrayList<ArtInstruction> getInstructions() {
		return mInstructions;
	}
	
	public boolean hasCode() {
		return mInstructions.size() > 0;
	}
	
	public Long getFileAddress() {
		if (mInstructions.size() > 0)
			return mInstructions.get(0).getFileAddress();
		else
			return 0L;
	}
	
	public Long getVirtualAddress() {
		if (mInstructions.size() > 0)
			return mInstructions.get(0).getVirtualAddress();
		else
			return 0L;
	}
	
	public ArtMethod(String signature) {
		mSignature = signature;
		mInstructions = new ArrayList<ArtInstruction>();
	}
	
	public boolean isConcrete() {
		if (this == AppMethod || this == SysMethod || this == UNKNOW)
			return false;
		else
			return true;
	}
	
	public boolean isApplication() {
		return this == AppMethod;
	}
	
	public boolean isSystem() {
		return this == SysMethod;
	}
	
	public boolean isUnknow() {
		return this == UNKNOW;
	}
	
	public String toString() {
		String name = "";
		if (getVirtualAddress() > 0xffffffffL)
			name = String.format("Method Signature -> %s at 0x%10x", mSignature, getVirtualAddress());
		else
			name = String.format("Method Signature -> %s at 0x%08x", mSignature, getVirtualAddress());
		return name;
	}
	
	public int compareTo(ArtMethod another) {
        return mSignature.compareTo(another.getMethodSignature());
    }
	
	public int hashCode() {
        return mSignature.hashCode();
    }
	
	public boolean equals(Object another) {
        if (another instanceof ArtMethod) {
            return compareTo((ArtMethod) another) == 0;
        }
        
        return super.equals(another);
    }
}
