package hk.polyu.trace.analysis.cg;

public class CallgraphEdge {
	
	private CallgraphNode callerNode;
	private CallgraphNode calleeNode;
	
	public CallgraphNode getCaller() { 
		return callerNode; 
	}
	public void setCaller(CallgraphNode node) { 
		callerNode = node; 
	}
	
	public CallgraphNode getCallee() { 
		return calleeNode; 
	}
	public void setCallee(CallgraphNode node) { 
		calleeNode = node; 
	}
	
	public CallgraphEdge(CallgraphNode caller, CallgraphNode callee) {
		callerNode = caller;
		calleeNode = callee;
	}
	
	public String toString() {
		String label = String.format("CallgraphEdge label: %s", callerNode.getArtMethod().getMethodSignature() + " -> " + calleeNode.getArtMethod().getMethodSignature());
		return label;
	}
	
	public int compareTo(CallgraphEdge another) {
        return callerNode.compareTo(another.getCaller()) + calleeNode.compareTo(another.getCallee());
    }
	
	public int hashCode() {
        return toString().hashCode();
    }

}
