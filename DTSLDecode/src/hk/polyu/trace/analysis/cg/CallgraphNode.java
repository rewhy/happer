package hk.polyu.trace.analysis.cg;

import hk.polyu.trace.resolver.ArtMethod;

public class CallgraphNode {

	private ArtMethod mMethod;
	
	public ArtMethod getArtMethod() { 
		return mMethod; 
	}
	public void setArtMethod(ArtMethod method) { 
		mMethod = method; 
	}
	
	public CallgraphNode(ArtMethod method) { 
		mMethod = method; 
	}
	
	public String toString() {
		String label = String.format("CallgraphNode label: %s", mMethod.getMethodSignature());
		return label;
	}
	
	public int compareTo(CallgraphNode another) {
        return mMethod.compareTo(another.getArtMethod());
    }
	
	public int hashCode() {
        return mMethod.hashCode();
    }
	
}
