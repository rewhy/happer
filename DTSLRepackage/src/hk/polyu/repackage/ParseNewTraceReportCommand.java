package hk.polyu.repackage;

import java.util.ArrayList;
import java.util.List;

import soot.Local;
import soot.LongType;
import soot.Scene;
import soot.SootClass;
import soot.SootField;
import soot.SootMethod;
import soot.Unit;
import soot.javaToJimple.LocalGenerator;
import soot.jimple.AssignStmt;
import soot.jimple.InstanceFieldRef;
import soot.jimple.InvokeStmt;
import soot.jimple.Jimple;
import soot.jimple.StringConstant;
import soot.jimple.VirtualInvokeExpr;

public class ParseNewTraceReportCommand {
	
	private SootEnvironment env = SootEnvironment.env;
	
	public void exec() {
		assert(env != null);
		customizeNewTraceReportCommand();
	}
	
	// ---- generate auxiliary fields ---- //
	
	/* null */
		
	// ---- generate auxiliary methods ---- //
	
	/* null */
	
	// ---- generate auxiliary classes ---- //
	
	/* null */
	
	// ---- modify auxiliary fields ---- //
	
	/* null */
	
	// ---- modify auxiliary methods ---- //
	
	private SootMethod modifyExecute() {
		// list dependent SootClass instances
		SootClass NewTraceReportCommandSC = getSootClass("com.arm.debug.trace.commands.NewTraceReportCommand");
		SootClass TraceReaderDTSLSC = getSootClass("com.arm.debug.trace.decode.TraceReaderDTSLSource"); 				
		
		// list dependent SootMethod instances
		SootMethod executeSM = getSootMethod(NewTraceReportCommandSC, "com.arm.debug.events.trace.TraceDecodeStopException execute()");
		SootMethod saveETMv4TraceSM = getSootMethod(TraceReaderDTSLSC, "void saveETMv4Trace(java.lang.String)");
		
		// list dependent SootField instances
		SootField mStartSF = getSootField(NewTraceReportCommandSC, "mStart");
		SootField mEndSF = getSootField(NewTraceReportCommandSC, "mEnd");
		
		LocalGenerator localGen = new LocalGenerator(executeSM.retrieveActiveBody());
		
		// obtain the target Unit
		Unit tgtUnit = getTargetUnit(executeSM, "$r3 = r0.<com.arm.debug.trace.commands.NewTraceReportCommand: com.arm.debug.trace.decode.TraceReaderDTSLSource mReader>");
		
		// [0] l25 = r0.<com.arm.debug.trace.commands.NewTraceReportCommand: long mStart>;
		Local lhs_0 = localGen.generateLocal(LongType.v());
		Local base_0 = executeSM.getActiveBody().getThisLocal();
		InstanceFieldRef rhs_0 = Jimple.v().newInstanceFieldRef(base_0, mStartSF.makeRef());
		AssignStmt stmt_0 = Jimple.v().newAssignStmt(lhs_0, rhs_0);
		
		// [1] l26 = r0.<com.arm.debug.trace.commands.NewTraceReportCommand: long mEnd>;
		Local lhs_1 = localGen.generateLocal(LongType.v());
		Local base_1 = executeSM.getActiveBody().getThisLocal();
		InstanceFieldRef rhs_1 = Jimple.v().newInstanceFieldRef(base_1, mEndSF.makeRef());
		AssignStmt stmt_1 = Jimple.v().newAssignStmt(lhs_1, rhs_1);
		
		//
		// [2] virtualinvoke r3.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void saveETMv4Trace(java.lang.String,long,long)>("D:/dump_trace.bin", l25, l26);
		Local base_2 = (Local) ((AssignStmt) tgtUnit).getLeftOp();
		VirtualInvokeExpr expr_2 = Jimple.v().newVirtualInvokeExpr(base_2, saveETMv4TraceSM.makeRef(), StringConstant.v("D:/etm_trace.bin"));
		InvokeStmt stmt_2 = Jimple.v().newInvokeStmt(expr_2);
		//
		
		/*
		// [3] virtualinvoke r3.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void saveETMv4Trace_deprecated(java.lang.String,long,long)>("D:/dump_trace_deprecated.bin", l25, l26);
		Local base_3 = (Local) ((AssignStmt) tgtUnit).getLeftOp();
		VirtualInvokeExpr expr_3 = Jimple.v().newVirtualInvokeExpr(base_3, saveETMv4TraceDeprecatedSM.makeRef(), StringConstant.v("D:/dump_trace_deprecated.bin"));
		InvokeStmt stmt_3 = Jimple.v().newInvokeStmt(expr_3);
		*/
		
		// insert the customized Stmt after the target Unit
		List<Unit> insertStmtList = new ArrayList<Unit>();
		insertStmtList.add(stmt_0);
		insertStmtList.add(stmt_1);
		insertStmtList.add(stmt_2);
		// insertStmtList.add(stmt_3);
		
		executeSM.retrieveActiveBody().getUnits().insertAfter(insertStmtList, tgtUnit);
	
		return executeSM;
	}
	
	// ---- modify auxiliary classes ---- //
	
	/* null */
	
	// ---- main ---- //
	
	private void customizeNewTraceReportCommand() {
		/*
		{
			SootClass NewTraceReportCommandSC = getSootClass("com.arm.debug.trace.commands.NewTraceReportCommand"); // "SC" refers to "SootClass"
			// NewTraceReportCommandSC should not be null
		
			for (SootMethod sm : NewTraceReportCommandSC.getMethods()) {
				System.out.println(sm.getSignature());
			}
		
			SootMethod tgtMethod = getSootMethod(NewTraceReportCommandSC, "com.arm.debug.events.trace.TraceDecodeStopException execute()");
			System.out.println(tgtMethod.retrieveActiveBody());
		}
		*/
		
		// ---- generation ---- //
		
		// for fields
		// ...		
		// for methods
		// ...
		// for classes
		// ...
				
		// ---- modification ---- //
		
		// for fields
		// ...		
		// for methods
		modifyExecute();			
		// for classes
		// ...
	}
	
	// auxiliary methods
	
	public SootClass getSootClass(String className) {
		Scene.v().loadClassAndSupport(className);
		return Scene.v().getSootClass(className);
	}
			
	public SootMethod getSootMethod(SootClass sootClass, String subSignature) {
		return sootClass.getMethod(subSignature);
	}
			
	public SootField getSootField(SootClass sootClass, String fieldName) {
		return sootClass.getFieldByName(fieldName);
	}
			
	public Unit getTargetUnit(SootMethod sootMethod, String unitStr) {
		for (Unit u : sootMethod.retrieveActiveBody().getUnits()) {
			if (u.toString().trim().equals(unitStr))
				return u;
		}
		
		return null;
	}
	
}
