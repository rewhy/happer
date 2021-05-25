package hk.polyu.trace.analysis.unpack;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.gephi.graph.api.DirectedGraph;
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

public class InvocationChainReporter {
	
	private static InvocationChainReporter singleInstance = null;
	
	private static ProjectController projectController = null;
	private static Workspace gephiWorkspace = null;
	private static GraphModel graphModel = null;
	private static DirectedGraph directedGraph = null;
	
	public static InvocationChainReporter getSingleInstance() {
		if (singleInstance == null) {
			singleInstance = new InvocationChainReporter();
			generateDirectedGraph();
			
			// delete the original files
			File file = new File(Configuration.InvocationChainReporterFile);
			if (file.exists())
				file.delete();
			file = new File(Configuration.InvocationChainGephiFile);
			if (file.exists())
				file.delete();
		}
			
		return singleInstance;
	}
	
	private static int INVOCATION_RECORDS = 1;
	private ArtMethod[] mInvocationRecords;
	private int mInvocationRecordIndex;
	private static int HOOK_RECORDS = 1;
	private ArtMethod[] mHookRecords;
	private int mHookRecordIndex;
	private static int BRANCH_RECORDS = 1;
	private Long[] mBranchRecords;
	private int mBranchRecordIndex;
	
	public InvocationChainReporter() {
		mInvocationRecords = new ArtMethod[INVOCATION_RECORDS];
		mInvocationRecordIndex = 0;
		mHookRecords = new ArtMethod[HOOK_RECORDS];
		mHookRecordIndex = 0;
		mBranchRecords = new Long[BRANCH_RECORDS];
		mBranchRecordIndex = 0;
	}
	
	public Node preNode = null;
	
    public void addInvocationRecord(ArtMethod record) {
		mInvocationRecords[mInvocationRecordIndex++] = record;
		
		if (mInvocationRecordIndex >= INVOCATION_RECORDS) {
			for (int index = 0; index < mInvocationRecordIndex; index++) {
				ArtMethod curRecord = mInvocationRecords[index];
				write("[CALL] " + curRecord.toString(), Configuration.InvocationChainReporterFile);
			}
			
			// reset
			mInvocationRecords = new ArtMethod[INVOCATION_RECORDS];
			mInvocationRecordIndex = 0;
		}
		
		/*
		Node curNode = directedGraph.getNode(record.toString());
		if (curNode == null) {
			curNode = graphModel.factory().newNode(record.toString());
			curNode.setLabel(record.toString());
		}
		directedGraph.addNode(curNode);
		
		if (preNode != null) {
			Edge curEdge = directedGraph.getEdge(preNode, curNode);
			if (curEdge == null) {
				curEdge = graphModel.factory().newEdge(preNode, curNode, 0, 1.0, true);
				directedGraph.addEdge(curEdge);
			}
    	}
		preNode = curNode;
		*/
    }
    
    public void addHookRecord(ArtMethod record) {
    	mInvocationRecords[mInvocationRecordIndex++] = record;
		
		if (mInvocationRecordIndex >= INVOCATION_RECORDS) {
			for (int index = 0; index < mInvocationRecordIndex; index++) {
				ArtMethod curRecord = mInvocationRecords[index];
				write("[HOOK] " + curRecord.toString(), Configuration.InvocationChainReporterFile);
			}
			
			// reset
			mInvocationRecords = new ArtMethod[INVOCATION_RECORDS];
			mInvocationRecordIndex = 0;
		}
		
		/*
		Node curNode = directedGraph.getNode(record.toString());
		if (curNode == null) {
			curNode = graphModel.factory().newNode(record.toString());
			curNode.setLabel(record.toString());
		}
		directedGraph.addNode(curNode);
		
		if (preNode != null) {
			Edge curEdge = directedGraph.getEdge(preNode, curNode);
			if (curEdge == null) {
				curEdge = graphModel.factory().newEdge(preNode, curNode, 0, 1.0, true);
				directedGraph.addEdge(curEdge);
			}
    	}
		preNode = curNode;
		*/
    }
    
    public void addBranchRecord(long address) {
    	mBranchRecords[mBranchRecordIndex++] = address;
    	
    	if (mBranchRecordIndex >= BRANCH_RECORDS) {
			for (int index = 0; index < mBranchRecordIndex; index++) {
				Long curRecord = mBranchRecords[index];
				write(Long.toHexString(curRecord), Configuration.InvocationChainReporterFile);
			}
			
			// reset
			mBranchRecords = new Long[BRANCH_RECORDS];
			mBranchRecordIndex = 0;
		}
    	
    	/* 
    	Node curNode = directedGraph.getNode(Long.toHexString(address));
    	if (curNode == null) {
    		curNode = graphModel.factory().newNode(Long.toHexString(address));
    		curNode.setLabel(Long.toHexString(address));
    	}
    	directedGraph.addNode(curNode);
    	
    	if (preNode != null) {
			Edge curEdge = directedGraph.getEdge(preNode, curNode);
			if (curEdge == null) {
				curEdge = graphModel.factory().newEdge(preNode, curNode, 0, 1.0, true);
				directedGraph.addEdge(curEdge);
			}
    	}
		preNode = curNode;
		*/
    }
	
	public void flushInvocationRecords() {
		for (int index = 0; index < mInvocationRecordIndex; index++) {
			ArtMethod curRecord = mInvocationRecords[index];
			write("[CALL] " + curRecord.toString(), Configuration.InvocationChainReporterFile);
		}
	}
	
	public void flushHookRecords() {
		for (int index = 0; index < mHookRecordIndex; index++) {
			ArtMethod curRecord = mHookRecords[index];
			write("[HOOK] " + curRecord.toString(), Configuration.InvocationChainReporterFile);
		}
	}
	
	public void flushBranchRecords() {
		for (int index = 0; index < mBranchRecordIndex; index++) {
			Long curRecord = mBranchRecords[index];
			write(Long.toHexString(curRecord), Configuration.InvocationChainReporterFile);
		}
	}
	
	public void write(String content, String path) {
		BufferedWriter bw = null;
		try {
			File file = new File(path);
			if (!file.exists())
				file.createNewFile();
			
			bw = new BufferedWriter(new FileWriter(file, true));
			
			bw.write(content + "\n");
			
			bw.flush();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				bw.close();
			} catch(IOException ioe) {
				ioe.printStackTrace();
			}
		}
	}
	
	// graph representation //
	
	public static void generateDirectedGraph() {
		// Initialize a project controller and a workspace, which is stored in gephiWorkspace.
        projectController = Lookup.getDefault().lookup(ProjectController.class);
        projectController.newProject();
        gephiWorkspace = projectController.getCurrentWorkspace();
        
        // Construct a graph model.
        graphModel = Lookup.getDefault().lookup(GraphController.class).getGraphModel(gephiWorkspace);
        
        // Build an empty graph.
        directedGraph = graphModel.getDirectedGraph();
	}
	
	public static void exportDirectedGraph() {
		assert directedGraph != null;
		
		// Initialize a export controller.
		ExportController exportController = Lookup.getDefault().lookup(ExportController.class);
		
		// Get a GEXF exporter.
		GraphExporter exporter = (GraphExporter) exportController.getExporter("gexf");
		exporter.setExportVisible(true);
		exporter.setWorkspace(gephiWorkspace);
		try {
		    exportController.exportFile(new File(Configuration.InvocationChainGephiFile), exporter);
		} catch (IOException ioe) {
		    ioe.printStackTrace();
		}
	}
	
}
