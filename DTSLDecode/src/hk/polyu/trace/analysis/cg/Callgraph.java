package hk.polyu.trace.analysis.cg;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import org.gephi.graph.api.DirectedGraph;
import org.gephi.graph.api.Edge;
import org.gephi.graph.api.GraphController;
import org.gephi.graph.api.GraphModel;
import org.gephi.graph.api.Node;
import org.gephi.io.exporter.api.ExportController;
import org.gephi.io.exporter.spi.GraphExporter;
import org.gephi.project.api.ProjectController;
import org.gephi.project.api.Workspace;
import org.openide.util.Lookup;

import hk.polyu.Configuration;
import hk.polyu.trace.resolver.ArtMethod;

public class Callgraph {
	// raw graph
	private HashMap<String, CallgraphNode> labelNodeMap;
	private HashMap<String, CallgraphEdge> labelEdgeMap;
	// Gephi graph
	private Workspace gephiWorkspace;
	private DirectedGraph directedGraph;
	private HashMap<String, Node> labelGephiNodeMap;
	private HashMap<String, Edge> labelGephiEdgeMap;
	
	public CallgraphNode getNode(String label) {
		return labelNodeMap.get(label);
	}
	public Collection<CallgraphNode> getNodes() { 
		return labelNodeMap.values();
	}
	public void addNode(CallgraphNode node) {
		// It is not recommended to leverage "node.toString()" directly.
		String label = node.getArtMethod().getMethodSignature();
		labelNodeMap.put(label, node);
	}
			
	public CallgraphEdge getEdge(String label) {
		return labelEdgeMap.get(label);
	}
	public Collection<CallgraphEdge> getEdges() {
		return labelEdgeMap.values();
	}
	public void addEdge(CallgraphEdge edge) {
		String label = edge.toString();
		labelEdgeMap.put(label, edge);
	}
	
	public Node getGephiNode(String label) {
		return labelGephiNodeMap.get(label);
	}
	public Collection<Node> getGephiNodes() {
		return labelGephiNodeMap.values();
	}
	
	public Edge getGephiEdge(String label) {
		return labelGephiEdgeMap.get(label);
	}
	public Collection<Edge> getGephiEdges() {
		return labelGephiEdgeMap.values();
	}
	
	public DirectedGraph getDirectedGraph() {
		return directedGraph;
	}
			
	public Callgraph() {
		labelNodeMap = new HashMap<String, CallgraphNode>();
		labelEdgeMap = new HashMap<String, CallgraphEdge>();
		
		gephiWorkspace = null;
		directedGraph = null;
		labelGephiNodeMap = new HashMap<String, Node>();
		labelGephiEdgeMap = new HashMap<String, Edge>();
	}
			
	public void generateDirectedGraph() {
		// Initialize a project controller and a workspace, which is stored in gephiWorkspace.
		ProjectController projectController = Lookup.getDefault().lookup(ProjectController.class);
		projectController.newProject();
		gephiWorkspace = projectController.getCurrentWorkspace();
		        
		// Construct a graph model.
		GraphModel graphModel = Lookup.getDefault().lookup(GraphController.class).getGraphModel(gephiWorkspace);

		// Build an empty graph.
		directedGraph = graphModel.getDirectedGraph();
				
		// Add nodes.
		long nodeIndex = 0L;
		for (CallgraphNode node : getNodes()) {
			String label = node.getArtMethod().getMethodSignature();
			Node newNode = graphModel.factory().newNode("CallgraphNode_" + nodeIndex);
			newNode.setLabel(label);
					
			assert (!labelGephiNodeMap.containsKey(label));
			labelGephiNodeMap.put(label, newNode);
			directedGraph.addNode(newNode);
					
			nodeIndex++;
		}
				
		// Add edges.
		for (CallgraphEdge edge : getEdges()) {
			CallgraphNode caller = edge.getCaller();
			Node callerGephiNode = labelGephiNodeMap.get(caller.getArtMethod().getMethodSignature());
			CallgraphNode callee = edge.getCallee();
			Node calleeGephiNode = labelGephiNodeMap.get(callee.getArtMethod().getMethodSignature());
					
			String label = edge.toString();
			Edge newEdge = graphModel.factory().newEdge(callerGephiNode, calleeGephiNode, 0, 1.0, true);
					
			assert (!labelGephiEdgeMap.containsKey(label));
			labelGephiEdgeMap.put(label, newEdge);
			directedGraph.addEdge(newEdge);
		}
	}
			
	public void analyzeDirectedGraph() {
		// TODO: Analyzing the directed graph based on Gephi APIs.
		// getEntryNodes();
		getAppLinkedNodes();
	}
			
	public ArrayList<Node> getEntryNodes() {
		ArrayList<Node> entryNodeList = new ArrayList<Node>();
				
		for (Node node : directedGraph.getNodes()) {
			if (directedGraph.getInDegree(node) == 0) {
				entryNodeList.add(node);
				System.out.println("(Directed Graph) Entry Node -> " + node.getLabel());
			}
		}
				
		return entryNodeList;
	}
	
	public ArrayList<Node> getAppLinkedNodes() {
		ArrayList<Node> targetNodeList = new ArrayList<Node>();
		
		// find app node
		Node appNode = null;
		for (Node node : directedGraph.getNodes()) {
			if (node.getLabel().equals(ArtMethod.AppMethod.getMethodSignature())) {
				appNode = node;
				break;
			}	
		}
		assert appNode != null;
		// collect linked nodes
		for (Edge edge : directedGraph.getOutEdges(appNode)) {
			Node target = edge.getTarget();
			targetNodeList.add(target);
			System.out.println("(Directed Graph) App Node -> " + target.getLabel());
		}
		
		return targetNodeList;
	}
			
	public void exportDirectedGraph() {
		assert directedGraph != null;
				
		// Initialize a export controller.
		ExportController exportController = Lookup.getDefault().lookup(ExportController.class);
				
		// Get a GEXF exporter.
		GraphExporter exporter = (GraphExporter) exportController.getExporter("gexf");
		exporter.setExportVisible(true);
		exporter.setWorkspace(gephiWorkspace);
		try {
			exportController.exportFile(new File(Configuration.CallgraphGephiFile), exporter);
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
}
