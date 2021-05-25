package hk.polyu.trace.analysis.cg;

import hk.polyu.trace.analysis.ITraceAnalyzer;
import hk.polyu.trace.decode.ArtInstructionRecord;
import hk.polyu.trace.decode.TraceRecord;
import hk.polyu.trace.decode.exception.TraceDecodeStopException;
import hk.polyu.trace.resolver.ArtInstruction;
import hk.polyu.trace.resolver.ArtMethod;

public class CallgraphBuilder implements ITraceAnalyzer {
	
	private static CallgraphBuilder singleInstance = null;
	
	public static CallgraphBuilder getSingleInstance() {
		if (singleInstance == null)
			singleInstance = new CallgraphBuilder();
			
		return singleInstance;
	}
	
	private ArtMethod preArtMethod;
	private ArtInstruction preArtInstruction;
	private ArtMethod curArtMethod;
	private ArtInstruction curArtInstruction;
	private Callgraph cg;
	
	public Callgraph getCallgraph() { 
		return cg;
	}
	
	public CallgraphBuilder() {
		preArtMethod = null;
		preArtInstruction = null;
		curArtMethod = null;
		curArtInstruction = null;
		cg = new Callgraph();
	}
	
	@Override
    public void addTraceRecord(TraceRecord record) throws TraceDecodeStopException {
		// only deals with ArtInstructionRecord instances
		if (!record.isArtInstruction())
			return;
		
		ArtInstructionRecord instructionRecord = (ArtInstructionRecord) record;
		ArtInstruction instruction = instructionRecord.getArtInstruction();
		ArtMethod method = instructionRecord.getArtMethod();
		
		if (instruction == curArtInstruction) {
			// we just ignore the special case
			return;
		}
		
		preArtInstruction = curArtInstruction;
		curArtInstruction = instruction;
		
		if (method != curArtMethod) {
			preArtMethod = curArtMethod;
			curArtMethod = method;
			
			// update the node of callgraph.
			CallgraphNode newNode = new CallgraphNode(curArtMethod);
			if (cg.getNode(newNode.getArtMethod().getMethodSignature()) == null)
				cg.addNode(newNode);
				
			// build the edge of callgraph
			if (preArtMethod != null) {
				if (curArtMethod.isConcrete()) {
					if (curArtInstruction.getVirtualAddress() == curArtMethod.getInstructions().get(0).getVirtualAddress()) {
						CallgraphNode caller = cg.getNode(preArtMethod.getMethodSignature());
						CallgraphNode callee = cg.getNode(curArtMethod.getMethodSignature());
						CallgraphEdge newEdge = new CallgraphEdge(caller, callee);
						if (cg.getEdge(newEdge.toString()) == null)
							cg.addEdge(newEdge);
					}
				} else {
					CallgraphNode caller = cg.getNode(preArtMethod.getMethodSignature());
					CallgraphNode callee = cg.getNode(curArtMethod.getMethodSignature());
					CallgraphEdge newEdge = new CallgraphEdge(caller, callee);
					if (cg.getEdge(newEdge.toString()) == null)
						cg.addEdge(newEdge);
				}
			}
		}
    }
	
}
