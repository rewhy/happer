package hk.polyu.repackage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import soot.BooleanType;
import soot.IntType;
import soot.Local;
import soot.LongType;
import soot.Modifier;
import soot.Scene;
import soot.SootClass;
import soot.SootField;
import soot.SootMethod;
import soot.Type;
import soot.Unit;
import soot.VoidType;
import soot.javaToJimple.LocalGenerator;
import soot.jimple.AddExpr;
import soot.jimple.AssignStmt;
import soot.jimple.CastExpr;
import soot.jimple.DivExpr;
import soot.jimple.EqExpr;
import soot.jimple.GotoStmt;
import soot.jimple.IdentityStmt;
import soot.jimple.IfStmt;
import soot.jimple.InstanceFieldRef;
import soot.jimple.IntConstant;
import soot.jimple.InterfaceInvokeExpr;
import soot.jimple.InvokeStmt;
import soot.jimple.Jimple;
import soot.jimple.JimpleBody;
import soot.jimple.LongConstant;
import soot.jimple.MulExpr;
import soot.jimple.NeExpr;
import soot.jimple.NullConstant;
import soot.jimple.OrExpr;
import soot.jimple.ParameterRef;
import soot.jimple.ReturnVoidStmt;
import soot.jimple.ShlExpr;
import soot.jimple.StaticInvokeExpr;
import soot.jimple.ThisRef;
import soot.jimple.VirtualInvokeExpr;

public class ParseETMv4TraceSource {
	
	private SootEnvironment env = SootEnvironment.env;
	
	public void exec() {
		assert(env != null);
		customizeETMv4TraceSource();
	}
	
	// ---- generate auxiliary fields ---- //
	
	// private boolean enableBranchBroadcast
	private SootField generateEnableBranchBroadcast() {
		// list dependent SootClass instances
		SootClass ETMv4TraceSourceSC = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource");
		
		SootField enableBranchBroadcastSF = new SootField("enableBranchBroadcast", BooleanType.v(), Modifier.PRIVATE);
		enableBranchBroadcastSF.setDeclaringClass(ETMv4TraceSourceSC);
		
		ETMv4TraceSourceSC.addField(enableBranchBroadcastSF);
		
		return enableBranchBroadcastSF;
	}
	
	// private Long m_PID
	private SootField generateMPID() {
		// list dependent SootClass instances
		SootClass ETMv4TraceSourceSC = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource");
		SootClass LongSC = getSootClass("java.lang.Long");
		
		SootField mPidSF = new SootField("m_PID", LongSC.getType(), Modifier.PRIVATE);
		mPidSF.setDeclaringClass(ETMv4TraceSourceSC);
		
		ETMv4TraceSourceSC.addField(mPidSF);
		
		return mPidSF;
	}
	
	// ---- generate auxiliary methods ---- //
	
	// public void setBranchBroadcastEnabled(boolean)
	private SootMethod generateSetBranchBroadcastEnabled() {
		// list dependent SootClass instances
		SootClass ETMv4TraceSourceSC = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource");
				
		// list dependent SootField instances
		SootField enableBranchBroadcastSF = getSootField(ETMv4TraceSourceSC, "enableBranchBroadcast");
			
		// declare and add method "void setBranchBroadcastEnabled(boolean)"
		SootMethod setBranchBroadcastEnabledSM = new SootMethod("setBranchBroadcastEnabled", Arrays.asList(new Type[] {BooleanType.v()}), VoidType.v(), Modifier.PUBLIC);
		ETMv4TraceSourceSC.addMethod(setBranchBroadcastEnabledSM);
						
		// create the method body
		JimpleBody setBranchBroadcastEnabledJB = Jimple.v().newBody(setBranchBroadcastEnabledSM);
		setBranchBroadcastEnabledSM.setActiveBody(setBranchBroadcastEnabledJB);
						
		LocalGenerator localGen = new LocalGenerator(setBranchBroadcastEnabledSM.getActiveBody());
				
		// [0] r0 := @this: com.arm.debug.dtsl.components.ETMv4TraceSource;
		Local lhs_0 = localGen.generateLocal(ETMv4TraceSourceSC.getType());
		ThisRef rhs_0 = Jimple.v().newThisRef(ETMv4TraceSourceSC.getType());
		IdentityStmt stmt_0 = Jimple.v().newIdentityStmt(lhs_0, rhs_0);
				
		// [1] z0 := @parameter0: boolean;
		Local lhs_1 = localGen.generateLocal(BooleanType.v());
		ParameterRef rhs_1 = Jimple.v().newParameterRef(BooleanType.v(), 0);
		IdentityStmt stmt_1 = Jimple.v().newIdentityStmt(lhs_1, rhs_1);
				
		// [2] r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: boolean enableBranchBroadcast> = z0;
		InstanceFieldRef lhs_2 = Jimple.v().newInstanceFieldRef(lhs_0, enableBranchBroadcastSF.makeRef());
		Local rhs_2 = lhs_1;
		AssignStmt stmt_2 = Jimple.v().newAssignStmt(lhs_2, rhs_2);
				
		// [3] return;
		ReturnVoidStmt stmt_3 = Jimple.v().newReturnVoidStmt();
				
		/* ---- */
				
		List<Unit> bodyStmtList = new ArrayList<Unit>();
		bodyStmtList.add(stmt_0);
		bodyStmtList.add(stmt_1);
		bodyStmtList.add(stmt_2);
		
		bodyStmtList.add(stmt_3); // ret
				
		setBranchBroadcastEnabledJB.getUnits().addAll(bodyStmtList);
				
		// System.out.println(setBranchBroadcastEnabledJB.toString());
		
		return setBranchBroadcastEnabledSM;
	}
	
	// private void enableBranchBroadcasting(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)
	private SootMethod generateEnableBranchBroadcasting() {
		// list dependent SootClass instances
		SootClass ETMv4TraceSourceSC = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource");
		SootClass RegisterWriteSequenceSC = getSootClass("com.arm.debug.dtsl.components.Device$RegisterWriteSequence");
		SootClass RangeAddressesStoreSC = getSootClass("com.arm.debug.dtsl.components.RangeAddressesStore");
		SootClass SetSC = getSootClass("java.util.Set");
		SootClass IteratorSC = getSootClass("java.util.Iterator");
		SootClass ObjectSC = getSootClass("java.lang.Object");
		SootClass IntegerSC = getSootClass("java.lang.Integer");
			
		// list dependent SootMethod instances
		SootMethod getIdsToSetSM = getSootMethod(RangeAddressesStoreSC, "java.util.Set getIdsToSet()");
		SootMethod iteratorSM = getSootMethod(SetSC, "java.util.Iterator iterator()");
		SootMethod nextSM = getSootMethod(IteratorSC, "java.lang.Object next()");
		SootMethod intValueSM = getSootMethod(IntegerSC, "int intValue()");
		SootMethod getOffsetStartSM = getSootMethod(RangeAddressesStoreSC, "int getOffsetStart(int)");
		SootMethod hasNextSM = getSootMethod(IteratorSC, "boolean hasNext()");
		SootMethod addSM = getSootMethod(RegisterWriteSequenceSC, "void add(int,int)");
		
		// list dependent SootField instances
		SootField enableBranchBroadcastSF = getSootField(ETMv4TraceSourceSC, "enableBranchBroadcast");
		SootField m_RangesSF = getSootField(ETMv4TraceSourceSC, "m_Ranges");
		
		// declare and add method "void enableBranchBroadcasting(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)"
		SootMethod enableBranchBroadcastingSM = new SootMethod("enableBranchBroadcasting", Arrays.asList(new Type[] {RegisterWriteSequenceSC.getType()}), VoidType.v(), Modifier.PRIVATE);
		ETMv4TraceSourceSC.addMethod(enableBranchBroadcastingSM);
		
		// create the method body
		JimpleBody enableBranchBroadcastingJB = Jimple.v().newBody(enableBranchBroadcastingSM);
		enableBranchBroadcastingSM.setActiveBody(enableBranchBroadcastingJB);
			
		LocalGenerator localGen = new LocalGenerator(enableBranchBroadcastingSM.getActiveBody());
		
		// [0] r0 := @this: com.arm.debug.dtsl.components.ETMv4TraceSource;
		Local lhs_0 = localGen.generateLocal(ETMv4TraceSourceSC.getType());
		ThisRef rhs_0 = Jimple.v().newThisRef(ETMv4TraceSourceSC.getType());
		IdentityStmt stmt_0 = Jimple.v().newIdentityStmt(lhs_0, rhs_0);
		
		// [1] r1 := @parameter0: com.arm.debug.dtsl.components.Device$RegisterWriteSequence;
		Local lhs_1 = localGen.generateLocal(RegisterWriteSequenceSC.getType());
		ParameterRef rhs_1 = Jimple.v().newParameterRef(RegisterWriteSequenceSC.getType(), 0);
		IdentityStmt stmt_1 = Jimple.v().newIdentityStmt(lhs_1, rhs_1);
		
		// [2] $z1 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: boolean enableBranchBroadcast>;
		Local lhs_2 = localGen.generateLocal(BooleanType.v());
		InstanceFieldRef rhs_2 = Jimple.v().newInstanceFieldRef(lhs_0, enableBranchBroadcastSF.makeRef());
		AssignStmt stmt_2 = Jimple.v().newAssignStmt(lhs_2, rhs_2);
		
		// [3] $r4 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: com.arm.debug.dtsl.components.RangeAddressesStore m_Ranges>;
		Local lhs_3 = localGen.generateLocal(RangeAddressesStoreSC.getType());
		InstanceFieldRef rhs_3 = Jimple.v().newInstanceFieldRef(lhs_0, m_RangesSF.makeRef());
		AssignStmt stmt_3 = Jimple.v().newAssignStmt(lhs_3, rhs_3);
		
		// [4] r2 = virtualinvoke $r4.<com.arm.debug.dtsl.components.RangeAddressesStore: java.util.Set getIdsToSet()>();
		Local lhs_4 = localGen.generateLocal(SetSC.getType());
		VirtualInvokeExpr rhs_4 = Jimple.v().newVirtualInvokeExpr(lhs_3, getIdsToSetSM.makeRef());
		AssignStmt stmt_4 = Jimple.v().newAssignStmt(lhs_4, rhs_4);
		
		// [5] i15 = 0;
		Local lhs_5 = localGen.generateLocal(IntType.v());
		IntConstant rhs_5 = IntConstant.v(0);
		AssignStmt stmt_5 = Jimple.v().newAssignStmt(lhs_5, rhs_5);
		
		// [6] r3 = interfaceinvoke r2.<java.util.Set: java.util.Iterator iterator()>();
		Local lhs_6 = localGen.generateLocal(IteratorSC.getType());
		InterfaceInvokeExpr rhs_6 = Jimple.v().newInterfaceInvokeExpr(lhs_4, iteratorSM.makeRef());
		AssignStmt stmt_6 = Jimple.v().newAssignStmt(lhs_6, rhs_6);
		
		// [7] $r5 = interfaceinvoke r3.<java.util.Iterator: java.lang.Object next()>();
		Local lhs_7 = localGen.generateLocal(ObjectSC.getType());
		InterfaceInvokeExpr rhs_7 = Jimple.v().newInterfaceInvokeExpr(lhs_6, nextSM.makeRef());
		AssignStmt stmt_7 = Jimple.v().newAssignStmt(lhs_7, rhs_7);
		
		// [8] $r6 = (java.lang.Integer) $r5;
		Local lhs_8 = localGen.generateLocal(IntegerSC.getType());
		CastExpr rhs_8 = Jimple.v().newCastExpr(lhs_7, IntegerSC.getType());
		AssignStmt stmt_8 = Jimple.v().newAssignStmt(lhs_8, rhs_8);
		
		// [9] i0 = virtualinvoke $r6.<java.lang.Integer: int intValue()>();
		Local lhs_9 = localGen.generateLocal(IntType.v());
		VirtualInvokeExpr rhs_9 = Jimple.v().newVirtualInvokeExpr(lhs_8, intValueSM.makeRef());
		AssignStmt stmt_9 = Jimple.v().newAssignStmt(lhs_9, rhs_9);
		
		// [10] $r7 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: com.arm.debug.dtsl.components.RangeAddressesStore m_Ranges>;
		Local lhs_10 = localGen.generateLocal(RangeAddressesStoreSC.getType());
		InstanceFieldRef rhs_10 = Jimple.v().newInstanceFieldRef(lhs_0, m_RangesSF.makeRef());
		AssignStmt stmt_10 = Jimple.v().newAssignStmt(lhs_10, rhs_10);
		
		// [11] i1 = virtualinvoke $r7.<com.arm.debug.dtsl.components.RangeAddressesStore: int getOffsetStart(int)>(i0);
		Local lhs_11 = localGen.generateLocal(IntType.v());
		VirtualInvokeExpr rhs_11 = Jimple.v().newVirtualInvokeExpr(lhs_10, getOffsetStartSM.makeRef(), lhs_9);
		AssignStmt stmt_11 = Jimple.v().newAssignStmt(lhs_11, rhs_11);
		
		// [12] $i3 = i1 / 2;
    	Local lhs_12 = localGen.generateLocal(IntType.v());
    	DivExpr rhs_12 = Jimple.v().newDivExpr(lhs_11, IntConstant.v(2));
    	AssignStmt stmt_12 = Jimple.v().newAssignStmt(lhs_12, rhs_12);
		
		// [13] $i4 = 1 << $i3;
    	Local lhs_13 = localGen.generateLocal(IntType.v());
    	ShlExpr rhs_13 = Jimple.v().newShlExpr(IntConstant.v(1), lhs_12);
    	AssignStmt stmt_13 = Jimple.v().newAssignStmt(lhs_13, rhs_13);
    	
		// [14] i15 = i15 | $i4;
    	Local lhs_14 = lhs_5;
    	OrExpr rhs_14 = Jimple.v().newOrExpr(lhs_5, lhs_13);
		AssignStmt stmt_14 = Jimple.v().newAssignStmt(lhs_14, rhs_14);
		
		// [15] $z0 = interfaceinvoke r3.<java.util.Iterator: boolean hasNext()>();
    	Local lhs_15 = localGen.generateLocal(BooleanType.v());
		InterfaceInvokeExpr rhs_15 = Jimple.v().newInterfaceInvokeExpr(lhs_6, hasNextSM.makeRef());
		AssignStmt stmt_15 = Jimple.v().newAssignStmt(lhs_15, rhs_15);
		
		// case 1: only enable branch broadcasting in a specific range
		// [16] i15 = i15 | 256;
		Local lhs_16 = lhs_5;
		OrExpr rhs_16 = Jimple.v().newOrExpr(lhs_16, IntConstant.v(256));
		AssignStmt stmt_16 = Jimple.v().newAssignStmt(lhs_16, rhs_16);
		//
		
		/* case 2: enable branch broadcasting in the whole memory space
		// [16] i15 = i15 & 0
		Local lhs_16 = lhs_5;
		AndExpr rhs_16 = Jimple.v().newAndExpr(lhs_16, IntConstant.v(0));
		AssignStmt stmt_16 = Jimple.v().newAssignStmt(lhs_16, rhs_16);
		*/
		
		// [17] virtualinvoke r1.<com.arm.debug.dtsl.components.Device$RegisterWriteSequence: void add(int,int)>(15, i15);
		VirtualInvokeExpr expr_17 = Jimple.v().newVirtualInvokeExpr(lhs_1, addSM.makeRef(), IntConstant.v(15), lhs_16);
		InvokeStmt stmt_17 = Jimple.v().newInvokeStmt(expr_17);
		
		// [18] return
		ReturnVoidStmt stmt_18 = Jimple.v().newReturnVoidStmt();
		
		// [19] if $z1 != 1 goto label3;
		NeExpr condition_19 = Jimple.v().newNeExpr(lhs_2, IntConstant.v(1));
		Unit target_19 = stmt_18;
		IfStmt stmt_19 = Jimple.v().newIfStmt(condition_19, target_19);
		
		// [20] goto label2;
		Unit target_20 = stmt_15;
		GotoStmt stmt_20 = Jimple.v().newGotoStmt(target_20);
		
		// [21] if $z0 != 0 goto label1;
		NeExpr condition_21 = Jimple.v().newNeExpr(lhs_15, IntConstant.v(0));
		Unit target_21 = stmt_7;
		IfStmt stmt_21 = Jimple.v().newIfStmt(condition_21, target_21);
		
		/* ---- */
		
		List<Unit> bodyStmtList = new ArrayList<Unit>();
		bodyStmtList.add(stmt_0);
		bodyStmtList.add(stmt_1);
		bodyStmtList.add(stmt_2);
		bodyStmtList.add(stmt_19); // goto
		bodyStmtList.add(stmt_3);
		bodyStmtList.add(stmt_4);
		bodyStmtList.add(stmt_5);
		bodyStmtList.add(stmt_6);
		bodyStmtList.add(stmt_20); // goto
		
		bodyStmtList.add(stmt_7);
		bodyStmtList.add(stmt_8);
		bodyStmtList.add(stmt_9);
		bodyStmtList.add(stmt_10);
		bodyStmtList.add(stmt_11);
		bodyStmtList.add(stmt_12);
		bodyStmtList.add(stmt_13);
		bodyStmtList.add(stmt_14);
		
		bodyStmtList.add(stmt_15);
		bodyStmtList.add(stmt_21); // goto
		bodyStmtList.add(stmt_16);
		bodyStmtList.add(stmt_17);
		
		bodyStmtList.add(stmt_18); // ret
		
		enableBranchBroadcastingJB.getUnits().addAll(bodyStmtList);
		
		// System.out.println(enableBranchBroadcastingJB.toString());
		
		return enableBranchBroadcastingSM;
	}
	
	// public void addTraceTarget(Long)
	private SootMethod generateAddTraceTarget() {
		// list dependent SootClass instances
		SootClass ETMv4TraceSourceSC = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource");
		SootClass LongSC = getSootClass("java.lang.Long");
		
		// list dependent SootMethod instances
		SootMethod valueOfSM = getSootMethod(LongSC, "java.lang.Long valueOf(long)");
		
		// list dependent SootField instances
		SootField mPIDSF = getSootField(ETMv4TraceSourceSC, "m_PID");
		
		// declare and add method "void addTraceTarget(long)"
		SootMethod addTraceTargetSM = new SootMethod("addTraceTarget", Arrays.asList(new Type[] {LongType.v()}), VoidType.v(), Modifier.PUBLIC);
		ETMv4TraceSourceSC.addMethod(addTraceTargetSM);
		
		// create the method body
		JimpleBody addTraceTargetJB = Jimple.v().newBody(addTraceTargetSM);
		addTraceTargetSM.setActiveBody(addTraceTargetJB);
		
		LocalGenerator localGen = new LocalGenerator(addTraceTargetSM.getActiveBody());
		
		// [0] r0 := @this: com.arm.debug.dtsl.components.ETMv4TraceSource;
		Local lhs_0 = localGen.generateLocal(ETMv4TraceSourceSC.getType());
		ThisRef rhs_0 = Jimple.v().newThisRef(ETMv4TraceSourceSC.getType());
		IdentityStmt stmt_0 = Jimple.v().newIdentityStmt(lhs_0, rhs_0);
		
		// [1] l0 := @parameter0: long;
		Local lhs_1 = localGen.generateLocal(LongType.v());
		ParameterRef rhs_1 = Jimple.v().newParameterRef(LongType.v(), 0);
		IdentityStmt stmt_1 = Jimple.v().newIdentityStmt(lhs_1, rhs_1);
		
		// [2] r1 = staticinvoke <java.lang.Long: java.lang.Long valueOf(long)>(l0);
		Local lhs_2 = localGen.generateLocal(LongSC.getType());
		StaticInvokeExpr rhs_2 = Jimple.v().newStaticInvokeExpr(valueOfSM.makeRef(), lhs_1);
		AssignStmt stmt_2 = Jimple.v().newAssignStmt(lhs_2, rhs_2);
		
		// [3] r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: java.lang.Long m_PID> = r1;
		InstanceFieldRef lhs_3 = Jimple.v().newInstanceFieldRef(lhs_0, mPIDSF.makeRef());
		Local rhs_3 = lhs_2;
		AssignStmt stmt_3 = Jimple.v().newAssignStmt(lhs_3, rhs_3);
		
		// [4] return
		ReturnVoidStmt stmt_4 = Jimple.v().newReturnVoidStmt();
		
		List<Unit> bodyStmtList = new ArrayList<Unit>();
		bodyStmtList.add(stmt_0);
		bodyStmtList.add(stmt_1);
		bodyStmtList.add(stmt_2);
		bodyStmtList.add(stmt_3);
		
		bodyStmtList.add(stmt_4); // ret
		
		addTraceTargetJB.getUnits().addAll(bodyStmtList);
		
		// System.out.println(addTraceTargetJB);
		
		return addTraceTargetSM;
	}
		
	// public void clearTraceTarget()
	private SootMethod generateClearTraceTarget() {
		// list dependent SootClass instances
		SootClass ETMv4TraceSourceSC = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource");
				
		// list dependent SootField instances
		SootField mPIDSF = getSootField(ETMv4TraceSourceSC, "m_PID");
		
		// declare and add method "void clearTraceTarget()"
		SootMethod clearTraceTargetSM = new SootMethod("clearTraceTarget", Arrays.asList(new Type[] {}), VoidType.v(), Modifier.PUBLIC);
		clearTraceTargetSM.setDeclaringClass(ETMv4TraceSourceSC);
		
		ETMv4TraceSourceSC.addMethod(clearTraceTargetSM);
				
		// create the method body
		JimpleBody clearTraceTargetJB = Jimple.v().newBody(clearTraceTargetSM);
		clearTraceTargetSM.setActiveBody(clearTraceTargetJB);
				
		LocalGenerator localGen = new LocalGenerator(clearTraceTargetSM.getActiveBody());
		
		// [0] r0 := @this: com.arm.debug.dtsl.components.ETMv4TraceSource;
		Local lhs_0 = localGen.generateLocal(ETMv4TraceSourceSC.getType());
		ThisRef rhs_0 = Jimple.v().newThisRef(ETMv4TraceSourceSC.getType());
		IdentityStmt stmt_0 = Jimple.v().newIdentityStmt(lhs_0, rhs_0);
		
		// [1] r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: java.lang.Long m_PID> = null;
		InstanceFieldRef lhs_1 = Jimple.v().newInstanceFieldRef(lhs_0, mPIDSF.makeRef());
		NullConstant rhs_1 = NullConstant.v();
		AssignStmt stmt_1 = Jimple.v().newAssignStmt(lhs_1, rhs_1);
		
		// [2] return
		ReturnVoidStmt stmt_2 = Jimple.v().newReturnVoidStmt();
		
		List<Unit> bodyStmtList = new ArrayList<Unit>();
		bodyStmtList.add(stmt_0);
		bodyStmtList.add(stmt_1);
		
		bodyStmtList.add(stmt_2); // ret
		
		clearTraceTargetJB.getUnits().addAll(bodyStmtList);
		
		// System.out.println(clearTraceTargetJB);
		
		return clearTraceTargetSM;
	}
	
	// public void enableTraceTarget(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)
	private SootMethod generateEnableTraceTarget() {		
		// list dependent SootClass instances
		SootClass ETMv4TraceSourceSC = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource");
		SootClass RegisterWriteSequenceSC = getSootClass("com.arm.debug.dtsl.components.Device$RegisterWriteSequence");
		SootClass RangeAddressesStoreSC = getSootClass("com.arm.debug.dtsl.components.RangeAddressesStore");
		SootClass SetSC = getSootClass("java.util.Set");
		SootClass IteratorSC = getSootClass("java.util.Iterator");
		SootClass ObjectSC = getSootClass("java.lang.Object");
		SootClass IntegerSC = getSootClass("java.lang.Integer");
		SootClass LongSC = getSootClass("java.lang.Long");
		
		// list dependent SootMethod instances
		SootMethod getIdsToSetSM = getSootMethod(RangeAddressesStoreSC, "java.util.Set getIdsToSet()");
		SootMethod iteratorSM = getSootMethod(SetSC, "java.util.Iterator iterator()");
		SootMethod nextSM = getSootMethod(IteratorSC, "java.lang.Object next()");
		SootMethod intValueSM = getSootMethod(IntegerSC, "int intValue()");
		SootMethod getOffsetStartSM = getSootMethod(RangeAddressesStoreSC, "int getOffsetStart(int)");
		SootMethod getOffsetEndSM = getSootMethod(RangeAddressesStoreSC, "int getOffsetEnd(int)");
		SootMethod addReg64SM = getSootMethod(ETMv4TraceSourceSC, "void addReg64(com.arm.debug.dtsl.components.Device$RegisterWriteSequence,int,long)");
		SootMethod hasNextSM = getSootMethod(IteratorSC, "boolean hasNext()");
		SootMethod longValueSM = getSootMethod(LongSC, "long longValue()");
		
		// list dependent SootField instances
		SootField m_RangesSF = getSootField(ETMv4TraceSourceSC, "m_Ranges");
		SootField m_PIDSF = getSootField(ETMv4TraceSourceSC, "m_PID");
		
		// declare and add method "void enableTraceTarget(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)"
		SootMethod enableTraceTargetSM = new SootMethod("enableTraceTarget", Arrays.asList(new Type[] {RegisterWriteSequenceSC.getType()}), VoidType.v(), Modifier.PUBLIC);
		ETMv4TraceSourceSC.addMethod(enableTraceTargetSM);
		
		// create the method body
		JimpleBody enableTraceTargetJB = Jimple.v().newBody(enableTraceTargetSM);
		enableTraceTargetSM.setActiveBody(enableTraceTargetJB);
		
		LocalGenerator localGen = new LocalGenerator(enableTraceTargetSM.getActiveBody());
		
		// [0] r0 := @this: com.arm.debug.dtsl.components.ETMv4TraceSource;
		Local lhs_0 = localGen.generateLocal(ETMv4TraceSourceSC.getType());
		ThisRef rhs_0 = Jimple.v().newThisRef(ETMv4TraceSourceSC.getType());
		IdentityStmt stmt_0 = Jimple.v().newIdentityStmt(lhs_0, rhs_0);
		
		// [1] r1 := @parameter0: com.arm.debug.dtsl.components.Device$RegisterWriteSequence;
		Local lhs_1 = localGen.generateLocal(RegisterWriteSequenceSC.getType());
		ParameterRef rhs_1 = Jimple.v().newParameterRef(RegisterWriteSequenceSC.getType(), 0);
		IdentityStmt stmt_1 = Jimple.v().newIdentityStmt(lhs_1, rhs_1);
		
		// [2] $r4 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: com.arm.debug.dtsl.components.RangeAddressesStore m_Ranges>;
		Local lhs_2 = localGen.generateLocal(RangeAddressesStoreSC.getType());
		InstanceFieldRef rhs_2 = Jimple.v().newInstanceFieldRef(lhs_0, m_RangesSF.makeRef());
		AssignStmt stmt_2 = Jimple.v().newAssignStmt(lhs_2, rhs_2);
		
		// [3] r2 = virtualinvoke $r4.<com.arm.debug.dtsl.components.RangeAddressesStore: java.util.Set getIdsToSet()>();
		Local lhs_3 = localGen.generateLocal(SetSC.getType());
		VirtualInvokeExpr rhs_3 = Jimple.v().newVirtualInvokeExpr(lhs_2, getIdsToSetSM.makeRef());
		AssignStmt stmt_3 = Jimple.v().newAssignStmt(lhs_3, rhs_3);
		
		// [4] r3 = interfaceinvoke r2.<java.util.Set: java.util.Iterator iterator()>();
		Local lhs_4 = localGen.generateLocal(IteratorSC.getType());
		InterfaceInvokeExpr rhs_4 = Jimple.v().newInterfaceInvokeExpr(lhs_3, iteratorSM.makeRef());
		AssignStmt stmt_4 = Jimple.v().newAssignStmt(lhs_4, rhs_4);
		
		// [5] $r5 = interfaceinvoke r3.<java.util.Iterator: java.lang.Object next()>();
		Local lhs_5 = localGen.generateLocal(ObjectSC.getType());
		InterfaceInvokeExpr rhs_5 = Jimple.v().newInterfaceInvokeExpr(lhs_4, nextSM.makeRef());
		AssignStmt stmt_5 = Jimple.v().newAssignStmt(lhs_5, rhs_5);
		
		// [6] $r6 = (java.lang.Integer) $r5;
		Local lhs_6 = localGen.generateLocal(IntegerSC.getType());
		CastExpr rhs_6 = Jimple.v().newCastExpr(lhs_5, IntegerSC.getType());
		AssignStmt stmt_6 = Jimple.v().newAssignStmt(lhs_6, rhs_6);
		
		// [7] i0 = virtualinvoke $r6.<java.lang.Integer: int intValue()>();
		Local lhs_7 = localGen.generateLocal(IntType.v());
		VirtualInvokeExpr rhs_7 = Jimple.v().newVirtualInvokeExpr(lhs_6, intValueSM.makeRef());
		AssignStmt stmt_7 = Jimple.v().newAssignStmt(lhs_7, rhs_7);
		
		// [8] $r7 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: com.arm.debug.dtsl.components.RangeAddressesStore m_Ranges>;
		Local lhs_8 = localGen.generateLocal(RangeAddressesStoreSC.getType());
		InstanceFieldRef rhs_8 = Jimple.v().newInstanceFieldRef(lhs_0, m_RangesSF.makeRef());
		AssignStmt stmt_8 = Jimple.v().newAssignStmt(lhs_8, rhs_8);
		
		// [9] i1 = virtualinvoke $r7.<com.arm.debug.dtsl.components.RangeAddressesStore: int getOffsetStart(int)>(i0);
		Local lhs_9 = localGen.generateLocal(IntType.v());
		VirtualInvokeExpr rhs_9 = Jimple.v().newVirtualInvokeExpr(lhs_8, getOffsetStartSM.makeRef(), lhs_7);
		AssignStmt stmt_9 = Jimple.v().newAssignStmt(lhs_9, rhs_9);
		
		// [10] $r8 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: com.arm.debug.dtsl.components.RangeAddressesStore m_Ranges>;
		Local lhs_10 = localGen.generateLocal(RangeAddressesStoreSC.getType());
		InstanceFieldRef rhs_10 = Jimple.v().newInstanceFieldRef(lhs_0, m_RangesSF.makeRef());
		AssignStmt stmt_10 = Jimple.v().newAssignStmt(lhs_10, rhs_10);
		
		// [11] i2 = virtualinvoke $r8.<com.arm.debug.dtsl.components.RangeAddressesStore: int getOffsetEnd(int)>(i0);
		Local lhs_11 = localGen.generateLocal(IntType.v());
		VirtualInvokeExpr rhs_11 = Jimple.v().newVirtualInvokeExpr(lhs_10, getOffsetEndSM.makeRef(), lhs_7);
		AssignStmt stmt_11 = Jimple.v().newAssignStmt(lhs_11, rhs_11);
		
		// [12] $i8 = i1 * 2;
		Local lhs_12 = localGen.generateLocal(IntType.v());
		MulExpr rhs_12 = Jimple.v().newMulExpr(lhs_9, IntConstant.v(2));
		AssignStmt stmt_12 = Jimple.v().newAssignStmt(lhs_12, rhs_12);
		
		// [13] $i9 = 288 + $i8;
		Local lhs_13 = localGen.generateLocal(IntType.v());
		AddExpr rhs_13 = Jimple.v().newAddExpr(IntConstant.v(288), lhs_12);
		AssignStmt stmt_13 = Jimple.v().newAssignStmt(lhs_13, rhs_13);
		
		// [14] staticinvoke <com.arm.debug.dtsl.components.ETMv4TraceSource: void addReg64(com.arm.debug.dtsl.components.Device$RegisterWriteSequence,int,long)>(r1, $i9, 0L);
		StaticInvokeExpr expr_14 = Jimple.v().newStaticInvokeExpr(addReg64SM.makeRef(), lhs_1, lhs_13, LongConstant.v(4)); // 0x0004
		InvokeStmt stmt_14 = Jimple.v().newInvokeStmt(expr_14);
		
		// [15] $i13 = i2 * 2;
		Local lhs_15 = localGen.generateLocal(IntType.v());
		MulExpr rhs_15 = Jimple.v().newMulExpr(lhs_11, IntConstant.v(2));
		AssignStmt stmt_15 = Jimple.v().newAssignStmt(lhs_15, rhs_15);
		
		// [16] $i14 = 288 + $i13;
		Local lhs_16 = localGen.generateLocal(IntType.v());
		AddExpr rhs_16 = Jimple.v().newAddExpr(IntConstant.v(288), lhs_15);
		AssignStmt stmt_16 = Jimple.v().newAssignStmt(lhs_16, rhs_16);
		
    	// [17] staticinvoke <com.arm.debug.dtsl.components.ETMv4TraceSource: void addReg64(com.arm.debug.dtsl.components.Device$RegisterWriteSequence,int,long)>(r1, $i14, 0L);
		StaticInvokeExpr expr_17 = Jimple.v().newStaticInvokeExpr(addReg64SM.makeRef(), lhs_1, lhs_16, LongConstant.v(4)); // 0x0004
		InvokeStmt stmt_17 = Jimple.v().newInvokeStmt(expr_17);
		
		// [18] $z0 = interfaceinvoke r3.<java.util.Iterator: boolean hasNext()>();
		Local lhs_18 = localGen.generateLocal(BooleanType.v());
		InterfaceInvokeExpr rhs_18 = Jimple.v().newInterfaceInvokeExpr(lhs_4, hasNextSM.makeRef());
		AssignStmt stmt_18 = Jimple.v().newAssignStmt(lhs_18, rhs_18);
		
		// [19] goto label2;
		GotoStmt stmt_19 = Jimple.v().newGotoStmt(stmt_18);
		
		// [20] if $z0 != 0 goto label1;
		NeExpr condition_20 = Jimple.v().newNeExpr(lhs_18, IntConstant.v(0));
		IfStmt stmt_20 = Jimple.v().newIfStmt(condition_20, stmt_5);
		
		/* ---- */
		
		// [22] $r9 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: java.lang.Long m_PID>;
		Local lhs_22 = localGen.generateLocal(LongSC.getType());
		InstanceFieldRef rhs_22 = Jimple.v().newInstanceFieldRef(lhs_0, m_PIDSF.makeRef());
		AssignStmt stmt_22 = Jimple.v().newAssignStmt(lhs_22, rhs_22);
		
		// [23] $l10 = virtualinvoke $r9.<java.lang.Long: long longValue()>();
		Local lhs_23 = localGen.generateLocal(LongType.v());
		VirtualInvokeExpr rhs_23 = Jimple.v().newVirtualInvokeExpr(lhs_22, longValueSM.makeRef());
		AssignStmt stmt_23 = Jimple.v().newAssignStmt(lhs_23, rhs_23);
		
		// [24] staticinvoke <com.arm.debug.dtsl.components.ETMv4TraceSource: void addReg64(com.arm.debug.dtsl.components.Device$RegisterWriteSequence,int,long)>(r1, $i?, 1079L);
		StaticInvokeExpr expr_24 = Jimple.v().newStaticInvokeExpr(addReg64SM.makeRef(), lhs_1, IntConstant.v(384), lhs_23); // target pid
		InvokeStmt stmt_24 = Jimple.v().newInvokeStmt(expr_24);
		
		// [27] staticinvoke <com.arm.debug.dtsl.components.ETMv4TraceSource: void addReg64(com.arm.debug.dtsl.components.Device$RegisterWriteSequence,int,long)>(r1, $i?, 1079L);
		StaticInvokeExpr expr_27 = Jimple.v().newStaticInvokeExpr(addReg64SM.makeRef(), lhs_1, IntConstant.v(416), LongConstant.v(0)); // TRCCIDCCTLR0, TRCCIDCCTLR1
		InvokeStmt stmt_27 = Jimple.v().newInvokeStmt(expr_27);
		
		/* ---- */
		
		// [21] return
		ReturnVoidStmt stmt_21 = Jimple.v().newReturnVoidStmt();
		
		/* ---- */
		
		// [25] $l10 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: java.lang.Long m_PID>;
		Local lhs_25 = localGen.generateLocal(LongType.v());
		InstanceFieldRef rhs_25 = Jimple.v().newInstanceFieldRef(lhs_0, m_PIDSF.makeRef());
		AssignStmt stmt_25 = Jimple.v().newAssignStmt(lhs_25, rhs_25);
		
		// [26] if r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: java.lang.Long m_PID> == null goto return;
		EqExpr condition_26 = Jimple.v().newEqExpr(lhs_25, NullConstant.v());
		IfStmt stmt_26 = Jimple.v().newIfStmt(condition_26, stmt_21);
		
		/* ---- */
		
		List<Unit> bodyStmtList = new ArrayList<Unit>();
		bodyStmtList.add(stmt_0);
		bodyStmtList.add(stmt_1);
		
		bodyStmtList.add(stmt_25);
		bodyStmtList.add(stmt_26); // goto
		
		bodyStmtList.add(stmt_2);
		bodyStmtList.add(stmt_3);
		bodyStmtList.add(stmt_4);
		bodyStmtList.add(stmt_19); // goto
		bodyStmtList.add(stmt_5);
		bodyStmtList.add(stmt_6);
		bodyStmtList.add(stmt_7);
		bodyStmtList.add(stmt_8);
		bodyStmtList.add(stmt_9);
		bodyStmtList.add(stmt_10);
		bodyStmtList.add(stmt_11);
		bodyStmtList.add(stmt_12);
		bodyStmtList.add(stmt_13);
		bodyStmtList.add(stmt_14);
		bodyStmtList.add(stmt_15);
		bodyStmtList.add(stmt_16);
		bodyStmtList.add(stmt_17);
		bodyStmtList.add(stmt_18);
		bodyStmtList.add(stmt_20); // goto
		
		bodyStmtList.add(stmt_22);
		bodyStmtList.add(stmt_23);
		bodyStmtList.add(stmt_24);
		bodyStmtList.add(stmt_27);
		
		bodyStmtList.add(stmt_21); // ret
		
		enableTraceTargetJB.getUnits().addAll(bodyStmtList);
		
		// System.out.println(enableTraceTargetJB.toString());
		
		return enableTraceTargetSM;
	}
	
	// ---- generate auxiliary classes ---- //
	
	/* null */
	
	// ---- modify specific fields ---- //
	
	/* null */
	
	// ---- modify specific methods ---- //
	
	// setGeneralConfig
	private SootMethod modifySetGeneralConfig() {
		// list dependent SootClass instances
		SootClass ETMv4TraceSourceSC = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource");
		
		// list dependent SootMethod instances
		SootMethod setGeneralConfigSM = getSootMethod(ETMv4TraceSourceSC, "void setGeneralConfig(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)");
		
		// list dependent SootField instances
		SootField enableBranchBroadcastSF = getSootField(ETMv4TraceSourceSC, "enableBranchBroadcast");
		SootField mPIDSF = getSootField(ETMv4TraceSourceSC, "m_PID");
		
		LocalGenerator localGen = new LocalGenerator(setGeneralConfigSM.retrieveActiveBody());
		
		// #0
		// obtain the target Unit
		Unit tgtUnit_0 = getTargetUnit(setGeneralConfigSM, "i4 = 0");
		
		// [0-0] $z0 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: boolean enableBranchBroadcast>;
    	Local lhs_00 = localGen.generateLocal(BooleanType.v());
    	Local base_00 = setGeneralConfigSM.retrieveActiveBody().getThisLocal();
    	InstanceFieldRef rhs_00 = Jimple.v().newInstanceFieldRef(base_00, enableBranchBroadcastSF.makeRef());
    	AssignStmt stmt_00 = Jimple.v().newAssignStmt(lhs_00, rhs_00);
		
		// [0-1] if $z0 == 0 goto ??;
    	EqExpr condition_01 = Jimple.v().newEqExpr(lhs_00, IntConstant.v(0));
    	Unit target_01 = getTargetUnit(setGeneralConfigSM, "$z0 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: boolean wantCycleAccurate>");
    	IfStmt stmt_01 = Jimple.v().newIfStmt(condition_01, target_01);
    	
		// [0-2] i4 = i4 | 0x8;
    	Local local_02 = (Local) ((AssignStmt) tgtUnit_0).getLeftOp();
    	Local lhs_02 = local_02;
    	OrExpr rhs_02 = Jimple.v().newOrExpr(local_02, IntConstant.v(8));
    	AssignStmt stmt_02 = Jimple.v().newAssignStmt(lhs_02, rhs_02);
    	
    	/* ---- */
    	
    	List<Unit> insertStmtList_0 = new ArrayList<Unit>();
    	insertStmtList_0.add(stmt_00);
    	insertStmtList_0.add(stmt_01);
    	insertStmtList_0.add(stmt_02);
    	
    	setGeneralConfigSM.retrieveActiveBody().getUnits().insertAfter(insertStmtList_0, tgtUnit_0);
    	
    	// #1
    	// obtain the target Unit
    	Unit tgtUnit_1 = getTargetUnit(setGeneralConfigSM, "i4 = 0");
    			
    	// [1-0] $l0 = r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: long m_PID>;
    	Local lhs_10 = localGen.generateLocal(LongType.v());
    	Local base_10 = setGeneralConfigSM.retrieveActiveBody().getThisLocal();
    	InstanceFieldRef rhs_10 = Jimple.v().newInstanceFieldRef(base_10, mPIDSF.makeRef());
    	AssignStmt stmt_10 = Jimple.v().newAssignStmt(lhs_10, rhs_10);
    	
    	// [1-1] if $l0 == null goto ??;
    	EqExpr condition_11 = Jimple.v().newEqExpr(lhs_10, NullConstant.v());
    	Unit target_11 = stmt_00;
    	IfStmt stmt_11 = Jimple.v().newIfStmt(condition_11, target_11);
    	  	
    	// [1-2] i4 = i4 | 0x40;
    	Local local_12 = (Local) ((AssignStmt) tgtUnit_0).getLeftOp();
    	Local lhs_12 = local_12;
    	OrExpr rhs_12 = Jimple.v().newOrExpr(local_02, IntConstant.v(64));
    	AssignStmt stmt_12 = Jimple.v().newAssignStmt(lhs_12, rhs_12);
    	  	
    	/* ---- */
    	  	
    	List<Unit> insertStmtList_1 = new ArrayList<Unit>();
    	insertStmtList_1.add(stmt_10);
    	insertStmtList_1.add(stmt_11);
    	insertStmtList_1.add(stmt_12);
    	    	
    	setGeneralConfigSM.retrieveActiveBody().getUnits().insertAfter(insertStmtList_1, tgtUnit_1);
    	
		return setGeneralConfigSM;
	}
	
	// prepareStartTraceRegisterWrites
	private SootMethod modifyPrepareStartTraceRegisterWrites() {
		// list dependent SootClass instances
		SootClass ETMv4TraceSourceSC = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource");
		
		// list dependent SootMethod instances
		SootMethod prepareStartTraceRegisterWritesSM = getSootMethod(ETMv4TraceSourceSC, "void prepareStartTraceRegisterWrites(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)");
		SootMethod enableTraceTargetSM = getSootMethod(ETMv4TraceSourceSC, "void enableTraceTarget(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)");
		SootMethod enableBranchBroadcastingSM = getSootMethod(ETMv4TraceSourceSC, "void enableBranchBroadcasting(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)");
		
		// list dependent SootField instances
		
		// -- #0 -- //
		// obtain the target Unit
		Unit tgtUnit_0 = getTargetUnit(prepareStartTraceRegisterWritesSM, "specialinvoke r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: void enableRanges(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)>(r1)");
		
		// virtualinvoke r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: void enableTraceTarget(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)>(r1);
		Local base_0 = prepareStartTraceRegisterWritesSM.retrieveActiveBody().getThisLocal();
		Local param_0 = prepareStartTraceRegisterWritesSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr_0 = Jimple.v().newVirtualInvokeExpr(base_0, enableTraceTargetSM.makeRef(), param_0);
		InvokeStmt stmt_0 = Jimple.v().newInvokeStmt(expr_0);
		
		// insert the customized stmt_0 after the target Unit
		prepareStartTraceRegisterWritesSM.retrieveActiveBody().getUnits().insertAfter(stmt_0, tgtUnit_0);
		
		// -- #1 -- //
		// obtain the target Unit
		Unit tgtUnit_1 = stmt_0;
		
		// virtualinvoke r0.<com.arm.debug.dtsl.components.ETMv4TraceSource: void enableBranchBroadcasting(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)>(r1);
		Local base_1 = prepareStartTraceRegisterWritesSM.retrieveActiveBody().getThisLocal();
		Local param_1 = prepareStartTraceRegisterWritesSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr_1 = Jimple.v().newVirtualInvokeExpr(base_1, enableBranchBroadcastingSM.makeRef(), param_1);
		InvokeStmt stmt_1 = Jimple.v().newInvokeStmt(expr_1);
		
		// insert the customized stmt_1 after the target Unit
		prepareStartTraceRegisterWritesSM.retrieveActiveBody().getUnits().insertAfter(stmt_1, tgtUnit_1);
		
		return prepareStartTraceRegisterWritesSM;
	}
	
	// ---- modify specific classes ---- //
	
	/* null */
	
	// ---- main ---- //
	
	private void customizeETMv4TraceSource() {
		/*
		{
			SootClass sc = getSootClass("com.arm.debug.dtsl.components.ETMv4TraceSource"); // "SC" refers to "SootClass" 
			// ETMv4TraceSourceSC should not be null
			for(SootMethod sm : sc.getMethods()) {
				System.out.println(sm);
			}
			
			SootMethod tgtMethod1 = getSootMethod(sc, "void setGeneralConfig(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)");
			System.out.println(tgtMethod1.retrieveActiveBody());
			
			SootMethod tgtMethod2 = getSootMethod(sc, "void prepareStartTraceRegisterWrites(com.arm.debug.dtsl.components.Device$RegisterWriteSequence)");
			System.out.println(tgtMethod2.retrieveActiveBody());
		}
		*/
		
		//
		// ---- generation ---- //
		
		// for fields
		generateEnableBranchBroadcast(); // enableBranchBroadcast
		generateMPID(); // m_PID
		// for methods
		generateSetBranchBroadcastEnabled();
		generateEnableBranchBroadcasting();
		generateAddTraceTarget();
		generateClearTraceTarget();
		generateEnableTraceTarget();
		// for classes
		// ...
		
		//  ---- modification ---- //
		
		// for fields
		// ...
		// for methods
		modifySetGeneralConfig();
		modifyPrepareStartTraceRegisterWrites();
		// for classes
		// ...
		//
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
