package hk.polyu.trace.analysis;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;

import org.gephi.graph.api.DirectedGraph;
import org.gephi.graph.api.Edge;
import org.gephi.graph.api.Node;

import hk.polyu.Configuration;
import hk.polyu.trace.analysis.cg.Callgraph;
import hk.polyu.trace.analysis.cg.CallgraphBuilder;
import hk.polyu.trace.resolver.ArtInstruction;
import hk.polyu.trace.resolver.ArtMethod;

public class DSScriptGenerator {
	
	private Callgraph callgraph;
	private DirectedGraph directedGraph;
	
	private HashSet<String> entryMethodSignatures; // only contains original entry method signatures
	private HashSet<Node> entryMethodNodes; // entry method nodes + additional entry method nodes (which are used to link target method nodes)
	private HashSet<String> targetMethodSignatures; // only contains original target method signatures
	private HashSet<Node> targetMethodNodes; // target method nodes + auxiliary method nodes (which are used to link different target method nodes)
	
	public DSScriptGenerator() {
		callgraph = CallgraphBuilder.getSingleInstance().getCallgraph();
		directedGraph = callgraph.getDirectedGraph();
		
		entryMethodSignatures = new HashSet<String>();
		entryMethodNodes = new HashSet<Node>();
		targetMethodSignatures = new HashSet<String>();
		targetMethodNodes = new HashSet<Node>();
		resolveEntryNodesAndTargetNodes();
		
		clearDSScripts(); // delete all obsoleted scripts
	}
	
	public void resolveEntryNodesAndTargetNodes() {
		// ---- Parse the file or the configuration, which contains signatures of entry methods and target methods ---- //
		
		// TODO:
		
		entryMethodSignatures.add("hk.polyu.junodemo.MainActivity$1: void hk.polyu.junodemo.MainActivity$1.onClick(android.view.View)");
		for (String methodSignature : entryMethodSignatures) {
			Node curNode = callgraph.getGephiNode(methodSignature);
			entryMethodNodes.add(curNode);
		}
		
		// targetMethodSignatures.add("android.util.Log: int android.util.Log.d(java.lang.String, java.lang.String)");
		targetMethodSignatures.add("android.util.Log: int android.util.Log.println_native(int, int, java.lang.String, java.lang.String)");
		for (String methodSignature : targetMethodSignatures) {
			Node curNode = callgraph.getGephiNode(methodSignature);
			targetMethodNodes.add(curNode);
		}
		
		// ---- Identify the entry point ---- //
		
		for (Node node : targetMethodNodes) {
			// Condition-1: If the in-degree value of a target method node is zero, this method is an entry point.
			if (directedGraph.getInDegree(node) == 0) {
				entryMethodNodes.add(node);
				continue;
			}
			
			// Condition-2: If a target method node represents an application method 
			//              and its predecessor nodes do not contain any other application method nodes,
			//              this method is treated as an entry point.
			if (node.getLabel().startsWith(Configuration.PackageName)) {
				HashSet<Node> predecessorNodes = new HashSet<Node>();
				
				// collect
				Queue<Node> pendingQueue = new LinkedList<Node>();
				pendingQueue.add(node);
				while(!pendingQueue.isEmpty()) {
					Node curNode = pendingQueue.poll();
					predecessorNodes.add(curNode);
					
					ArrayList<Node> pendingList = new ArrayList<Node>();
					for (Node preNode : directedGraph.getPredecessors(curNode)) {
						if (!predecessorNodes.contains(preNode))
							pendingList.add(preNode);
					}
					
					String dispatchMessageSignature = "android.os.Handler: void android.os.Handler.dispatchMessage(android.os.Message)";
					Node dispatchMessageNode = callgraph.getGephiNode(dispatchMessageSignature);
					if (pendingList.contains(dispatchMessageNode))
						break;
					else
						pendingQueue.addAll(pendingList);
				}
				
				// identify
				int numberApplicationNode = 0;
				for (Node preNode : predecessorNodes) {
					if (preNode.getLabel().startsWith(Configuration.PackageName)) {
						numberApplicationNode++;
					}
				}
				if (numberApplicationNode == 1) {
					entryMethodNodes.add(node);
					continue;
				}
			}
		}
		
		for (Node node : targetMethodNodes) {
			if (directedGraph.getInDegree(node) == 0)
				continue;
			
			// Condition-3: If a target method does not represent an application method,
			//              we check whether it is linked with an identified entry method.
			//              If not, we traverse the callgraph to find its entry points.
			if (!node.getLabel().startsWith(Configuration.PackageName)) {
				HashSet<Node> predecessorNodes = new HashSet<Node>();
				
				// collect
				Queue<Node> pendingQueue = new LinkedList<Node>();
				pendingQueue.add(node);
				while(!pendingQueue.isEmpty()) {
					Node curNode = pendingQueue.poll();
					predecessorNodes.add(curNode);
					
					ArrayList<Node> pendingList = new ArrayList<Node>();
					for (Node preNode : directedGraph.getPredecessors(curNode)) {
						if (!predecessorNodes.contains(preNode))
							pendingList.add(preNode);
					}
					
					String dispatchMessageSignature = "android.os.Handler: void android.os.Handler.dispatchMessage(android.os.Message)";
					Node dispatchMessageNode = callgraph.getGephiNode(dispatchMessageSignature);
					if (pendingList.contains(dispatchMessageNode))
						break;
					else
						pendingQueue.addAll(pendingList);
				}
				
				// multiplexing already identified entry method node
				boolean multiplexingFlag = false;
				for (Node entryNode : entryMethodNodes) {
					if (predecessorNodes.contains(entryNode)) {
						multiplexingFlag = true;
						break;
					}
				}
				if (multiplexingFlag)
					continue;
				
				// find new entry method node
				HashSet<Node> predecessorApplicationNodes = new HashSet<Node>();
				for (Node preNode : predecessorNodes) {
					if (preNode.getLabel().startsWith(Configuration.PackageName))
						predecessorApplicationNodes.add(preNode);
				}
				
				// the process logic is the same as Condition-2
				for (Node applicationNode : predecessorApplicationNodes) {
					HashSet<Node> applicationPredecessorNodes = new HashSet<Node>();
					
					// collect
					Queue<Node> applicationPendingQueue = new LinkedList<Node>();
					applicationPendingQueue.add(applicationNode);
					while(!applicationPendingQueue.isEmpty()) {
						Node curNode = applicationPendingQueue.poll();
						applicationPredecessorNodes.add(curNode);
						
						ArrayList<Node> pendingList = new ArrayList<Node>();
						for (Node preNode : directedGraph.getPredecessors(curNode)) {
							if (!applicationPredecessorNodes.contains(preNode))
								pendingList.add(preNode);
						}
						
						String dispatchMessageSignature = "android.os.Handler: void android.os.Handler.dispatchMessage(android.os.Message)";
						Node dispatchMessageNode = callgraph.getGephiNode(dispatchMessageSignature);
						if (pendingList.contains(dispatchMessageNode))
							break;
						else
							applicationPendingQueue.addAll(pendingList);
					}
					
					// identify
					int numberApplicationNode = 0;
					for (Node preNode : applicationPredecessorNodes) {
						if (preNode.getLabel().startsWith(Configuration.PackageName)) {
							numberApplicationNode++;
						}
					}
					if (numberApplicationNode == 1) {
						entryMethodNodes.add(applicationNode);
						continue;
					}
				}
			}
		}
		
		for (Node entryNode : entryMethodNodes) {
			System.out.println("Entry Node -> " + entryNode.getLabel());
		}
		
		// ---- Find missing nodes which are used to connect entry method nodes with target method nodes ---- //
		//
		for (Node entryNode : entryMethodNodes) {
			for (Node targetNode : targetMethodNodes) {
				HashSet<Node> additionalTargetMethods = findPath(entryNode, targetNode, new LinkedList<Node>());
				targetMethodNodes.addAll(additionalTargetMethods);
			}
		}
		//
	}
	
	//
	// Conduct deep first search from source node to target node.
	private HashSet<Node> findPath(Node source, Node target, Queue<Node> path) {
		Queue<Node> curPath = new LinkedList<Node>(path); // make an copy of the input path
		curPath.add(source);
		for (Node pathNode : curPath) {
			System.out.print(" -> " + pathNode.getLabel());
		}
		System.out.println("");
		
		HashSet<Node> targetMethodNodes = new HashSet<Node>();
		
		if (source == target) {
			// If the source node is the same as the target node, it means that we have found a path.
			for (Node pathNode : curPath) {
				targetMethodNodes.add(pathNode);
			}
			
			return targetMethodNodes;
		}
		
		for (Node sucNode : directedGraph.getSuccessors(source)) {
			if (!(sucNode.getLabel().equals("android.util.Log: int android.util.Log.d(java.lang.String, java.lang.String)") || sucNode.getLabel().equals("android.util.Log: int android.util.Log.println_native(int, int, java.lang.String, java.lang.String)")))
				continue;
			
			if (!curPath.contains(sucNode)) {
				HashSet<Node> additionalNodes = findPath(sucNode, target, curPath);
				targetMethodNodes.addAll(additionalNodes);
			}
		}
		
		return targetMethodNodes;
	}
	//
	
	/*
	// Conduct deep first search from target node to source node.
	private HashSet<Node> findPath(Node source, Node target, Queue<Node> path) {
		Queue<Node> curPath = new LinkedList<Node>(path); // make an copy of the input path
		curPath.add(target);
		for (Node pathNode : curPath) {
			System.out.print(" <- " + pathNode.getLabel());
		}
		System.out.println("");
		
		HashSet<Node> targetMethodNodes = new HashSet<Node>();
		
		if (target == source) {
			// If the target node is the same as the source node, it means that we have found a path.
			for (Node pathNode : curPath) {
				targetMethodNodes.add(pathNode);
			}
			
			return targetMethodNodes;
		}
		
		// This if-statement must be placed after the previous one.
		if (entryMethodNodes.contains(target)) {
			// If we have reached an entry method node, we do not traverse further.
			return targetMethodNodes;
		}
		
		for (Node preNode : directedGraph.getPredecessors(target)) {
			if (!curPath.contains(preNode)) {
				HashSet<Node> additionalNodes = findPath(source, preNode, curPath);
				targetMethodNodes.addAll(additionalNodes);
			}
		}
		
		return targetMethodNodes;
	}
	*/
	
	public void generateDSScript() {
		// ---- Generate DS script for each entry method and target method ---- //
		
		HashSet<Node> allMethodNodes = new HashSet<Node>();
		allMethodNodes.addAll(entryMethodNodes);
		allMethodNodes.addAll(targetMethodNodes);
		
		for (Node targetNode : allMethodNodes) {
			// ---- Preparing Phase ---- //
			
			// Obtain the start address
			long startAddress = 0L;
			String targetSignature = targetNode.getLabel();
			ArtMethod targetMethod = ArtMethod.ArtMethods.get(targetSignature);
			startAddress = targetMethod.getVirtualAddress();
			
			// Obtain the end address
			long endAddress = 0L;
			for (ArtInstruction instruction : targetMethod.getInstructions()) {
				if (instruction.isRet()) {
					endAddress = instruction.getVirtualAddress();
					break;
				}
			}
			
			// Obtain the address of the callee.
			HashSet<Node> targetCallees = new HashSet<Node>();
			HashSet<Node> normalCallees = new HashSet<Node>();
			
			for (Edge edge : directedGraph.getOutEdges(targetNode)) {
				Node callee = edge.getTarget();
				
				if (allMethodNodes.contains(callee)) {
					targetCallees.add(callee);
				} else {
					normalCallees.add(callee);
				}
			}
			
			// ---- Generating Phase ---- //
			File script = null;
			FileWriter scriptWriter = null;
			try {
				script = new File(Configuration.DSScriptDirectory + targetNode.getLabel() + ".ds");
				assert !script.exists();
				script.createNewFile();
				
				scriptWriter = new FileWriter(script);
				
				/*	
				 	while ($nexInstruction != "endAddress")
				 		if ($nexInstruction == "one of targetCalleeAddresses")
				 			source "the script for target method"
				 			
				 			loop_break
				 		end
				 		
				 		if ($nexInstruction == "one of normalCalleeAddresses")
				 			set variable $pc = $lr - 4
				 			
				 			set variable $preInstruction = $pc
				 			break ($lr + 0)
				 			continue
				 			wait 1000
				 			delete breakpoints $
				 			set variable $nexInstruction = $pc
				 			
				 			loop_break
				 		end
				 		
				 		set variable $preInstruction = $pc
				 		stepi
				 		wait 100
				 		set variable $nexInstruction = $pc
				 	end
				 	
				 	set variable $preInstruction = $pc
				 	stepi
				 	set variable $netInstruction = $pc
				 */
				
				scriptWriter.write(String.format("" 	+ "while ($nexInstruction != 0x%x)" 	+ "\n", endAddress));
				
				for (Node targetCallee : targetCallees) {
					// System.out.println(targetCallee.getLabel());
					scriptWriter.write(String.format("\t" 	+ "if ($nexInstruction == 0x%x)" 		+ "\n", ArtMethod.ArtMethods.get(targetCallee.getLabel()).getVirtualAddress()));
					String targetCalleeScript = Configuration.DSScriptDirectory + targetCallee.getLabel() + ".ds";
					scriptWriter.write(String.format("\t\t" + "source %s" 							+ "\n", targetCalleeScript));
					scriptWriter.write(String.format("\t\t" + "\n"));
					scriptWriter.write(String.format("\t\t" + "loop_break" 							+ "\n", targetCalleeScript));
					scriptWriter.write(String.format("\t" 	+ "end" 								+ "\n"));
					scriptWriter.write(String.format("\t" 	+ "\n"));
				}
				
				for (Node targetCallee : normalCallees) {
					// System.out.println(targetCallee.getLabel());
					scriptWriter.write(String.format("\t" 	+ "if ($nexInstruction == 0x%x)" 		+ "\n", ArtMethod.ArtMethods.get(targetCallee.getLabel()).getVirtualAddress()));
					scriptWriter.write(String.format("\t\t" + "set variable $pc = $lr - 4" 			+ "\n"));
					scriptWriter.write(String.format("\t\t" + "\n"));
					scriptWriter.write(String.format("\t\t" + "set variable $preInstruction = $pc" 	+ "\n"));
					scriptWriter.write(String.format("\t\t" + "break ($lr + 0)"						+ "\n"));
					scriptWriter.write(String.format("\t\t" + "continue" 							+ "\n"));
					scriptWriter.write(String.format("\t\t" + "wait 1000" 	 						+ "\n"));
					scriptWriter.write(String.format("\t\t" + "delete breakpoints $"				+ "\n"));
					scriptWriter.write(String.format("\t\t" + "set variable $nexInstruction = $pc" 	+ "\n"));
					scriptWriter.write(String.format("\t\t" + "\n"));
					scriptWriter.write(String.format("\t\t" + "loop_break" 							+ "\n"));
					scriptWriter.write(String.format("\t" 	+ "end" 								+ "\n"));
					scriptWriter.write(String.format("\t" 	+ "\n"));
				}
				
				scriptWriter.write(String.format("\t"	+ "set variable $preInstruction = $pc" 	+ "\n"));
				scriptWriter.write(String.format("\t" 	+ "stepi" 								+ "\n"));
				scriptWriter.write(String.format("\t" 	+ "wait 100" 	 						+ "\n"));
				scriptWriter.write(String.format("\t" 	+ "set variable $nexInstruction = $pc" 	+ "\n"));
				
				scriptWriter.write(String.format("" 	+ "end" 								+ "\n"));
				scriptWriter.write(String.format("" 	+ "\n"));
				
				scriptWriter.write(String.format(""		+ "set variable $preInstruction = $pc" 	+ "\n"));
				scriptWriter.write(String.format("" 	+ "stepi" 								+ "\n"));
				scriptWriter.write(String.format("" 	+ "wait 100" 	 						+ "\n"));
				scriptWriter.write(String.format("" 	+ "set variable $nexInstruction = $pc" 	+ "\n"));
				scriptWriter.write(String.format("" 	+ "\n"));
				
				scriptWriter.flush();
			} catch(IOException ioe) {
				ioe.printStackTrace();
				System.exit(0);
			} finally {
				assert scriptWriter != null;
				try {
					scriptWriter.close();
				} catch(IOException ioe) {
					ioe.printStackTrace();
				}
			}
			
		}		
		
		// ---- Generate main script for each entry point
		
		for (Node entryNode : entryMethodNodes) {
			File script = null;
			FileWriter scriptWriter = null; 
			try {
				script = new File(Configuration.DSScriptDirectory + "main_" + entryNode.getLabel() + ".ds");
				assert !script.exists();
				script.createNewFile();
				
				scriptWriter = new FileWriter(script);
				
				/* 
				 	newvar global $preInstruction = 0
				 	newvar global $nexInstruction = $pc
				 	
				 	break "the address for an entry point"
				 	break-script $ "the script for this entry point"
				 */
				
				scriptWriter.write(String.format("" + "newvar global $preInstruction = 0" 	+ "\n"));
				scriptWriter.write(String.format("" + "newvar global $nexInstruction = 0" 	+ "\n"));
				scriptWriter.write(String.format("" + "\n"));
				scriptWriter.write(String.format("" + "break 0x%x" 							+ "\n", ArtMethod.ArtMethods.get(entryNode.getLabel()).getVirtualAddress()));
				String entryPointScript = Configuration.DSScriptDirectory + entryNode.getLabel() + ".ds";
				scriptWriter.write(String.format("" + "break-script $ %s" 					+ "\n", entryPointScript));
				
				scriptWriter.flush();
			} catch(IOException ioe) {
				ioe.printStackTrace();
				System.exit(0);
			} finally {
				assert scriptWriter != null;
				try {
					scriptWriter.close();
				} catch(IOException ioe) {
					ioe.printStackTrace();
				}
			}
			
		}
	}
	
	// ---- DS script utility functions ---- //
	
	public void clearDSScripts() {
		File DSScriptDirectory = new File(Configuration.DSScriptDirectory);
		assert DSScriptDirectory.isDirectory();
		
		for (File file : DSScriptDirectory.listFiles()) {
			file.delete();
		}
	}
	
	
}
