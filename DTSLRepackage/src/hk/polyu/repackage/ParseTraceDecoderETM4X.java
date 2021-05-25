package hk.polyu.repackage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import soot.BooleanType;
import soot.Local;
import soot.LongType;
import soot.Modifier;
import soot.Scene;
import soot.SootClass;
import soot.SootField;
import soot.SootMethod;
import soot.Trap;
import soot.Type;
import soot.Unit;
import soot.VoidType;
import soot.javaToJimple.LocalGenerator;
import soot.jimple.AssignStmt;
import soot.jimple.CaughtExceptionRef;
import soot.jimple.EqExpr;
import soot.jimple.GotoStmt;
import soot.jimple.IdentityStmt;
import soot.jimple.IfStmt;
import soot.jimple.InstanceFieldRef;
import soot.jimple.IntConstant;
import soot.jimple.InvokeStmt;
import soot.jimple.Jimple;
import soot.jimple.JimpleBody;
import soot.jimple.NewExpr;
import soot.jimple.ParameterRef;
import soot.jimple.ReturnVoidStmt;
import soot.jimple.SpecialInvokeExpr;
import soot.jimple.StaticInvokeExpr;
import soot.jimple.StringConstant;
import soot.jimple.ThisRef;
import soot.jimple.VirtualInvokeExpr;

public class ParseTraceDecoderETM4X {
	
	private SootEnvironment env = SootEnvironment.env;
	
	public void exec() {
		assert(env != null);
		
		customizeTraceDecoderETM4X();
	}
	
	// generate auxiliary fields
	/* null */
	
	// generate auxiliary methods
	private SootMethod generateSaveETMv4PacketType() { // "encoded" also means that the trace is compressed
		/*
		 * reference
		 
		public void saveETMv4PacketType(java.lang.String, java.lang.String) {
        	com.arm.debug.trace.decode.TraceDecoderETM4X r0;
        	java.lang.String r1, r2, $r8, $r10;
        	java.io.BufferedWriter r3, $r5;
        	long l0;
        	java.io.File $r4, r12;
        	boolean $z0;
        	java.io.FileWriter $r6;
        	java.lang.StringBuilder $r7, $r9;
        	java.lang.Exception $r11, r13;

        	r0 := @this: com.arm.debug.trace.decode.TraceDecoderETM4X;
        	r1 := @parameter0: java.lang.String;
        	r2 := @parameter0: java.lang.String;

     	label1:
			$r4 = new java.io.File;
			specialinvoke $r4.<java.io.File: void <init>(java.lang.String)>(r1);
			r12 = $r4;
			$z0 = virtualinvoke r12.<java.io.File: boolean exists()>();
		#1#	if $z0 == 0 goto label2;

     	label2:
        	virtualinvoke r12.<java.io.File: boolean createNewFile()>();
			$r5 = new java.io.BufferedWriter;
			$r6 = new java.io.FileWriter;
			specialinvoke $r6.<java.io.FileWriter: void <init>(java.io.File,boolean)>(r12, 1);
			specialinvoke $r5.<java.io.BufferedWriter: void <init>(java.io.Writer)>($r6);
			r3 = $r5;
			r14 = r0.<com.arm.debug.trace.decode.TraceDecoderAbstract: com.arm.debug.events.trace.TraceReader mIn>;
			l0 = r9.<com.arm.debug.trace.decode.TraceReaderDTSLSource: long mPosition>;
			$r7 = new java.lang.StringBuilder;
			$r8 = staticinvoke <java.lang.String: java.lang.String valueOf(long)>(l0);
			specialinvoke $r7.<java.lang.StringBuilder: void <init>(java.lang.String)>($r8);
			$r9 = virtualinvoke $r7.<java.lang.StringBuilder: java.lang.StringBuilder append(java.lang.String)>(r2);
			$r10 = virtualinvoke $r9.<java.lang.StringBuilder: java.lang.String toString()>();
			virtualinvoke r3.<java.io.BufferedWriter: void write(java.lang.String)>($r10);
			virtualinvoke r3.<java.io.BufferedWriter: void flush()>();
			virtualinvoke r3.<java.io.BufferedWriter: void close()>();

     	label3:
        #2#	goto label5;

     	label4:
        	$r11 := @caughtexception;
			r13 = $r11;

     	label5:
        	return;

        	catch java.lang.Exception from label1 to label3 with label4;
    	}
		 
		 */
		
		// list dependent SootClass instances
		SootClass TraceDecoderETM4XSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X");
		SootClass StringSC = getSootClass("java.lang.String");
		SootClass FileSC = getSootClass("java.io.File");
		SootClass BufferedWriterSC = getSootClass("java.io.BufferedWriter");
		SootClass FileWriterSC = getSootClass("java.io.FileWriter");
		SootClass TraceReaderSC = getSootClass("com.arm.debug.events.trace.TraceReader");
		SootClass TraceDecoderAbstractSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderAbstract");
		// SootClass TraceReaderDTSLSourceSC = getSootClass("com.arm.debug.trace.decode.TraceReaderDTSLSource");
		SootClass StringBuilderSC = getSootClass("java.lang.StringBuilder");
		SootClass WriterSC = getSootClass("java.io.Writer");
		SootClass ExceptionSC = getSootClass("java.lang.Exception");
		
		// list dependent SootMethod instances
		SootMethod initFileSM = getSootMethod(FileSC, "void <init>(java.lang.String)");
		SootMethod existsFileSM = getSootMethod(FileSC, "boolean exists()");
		SootMethod createNewFileSM = getSootMethod(FileSC, "boolean createNewFile()");
		SootMethod initFileWriterSM = getSootMethod(FileWriterSC, "void <init>(java.io.File,boolean)");
		SootMethod initBufferedWriterSM = getSootMethod(BufferedWriterSC, "void <init>(java.io.Writer)");
		SootMethod getPositionSM = getSootMethod(TraceReaderSC, "long getPosition()");
		SootMethod valueOfSM = getSootMethod(StringSC, "java.lang.String valueOf(long)");
		SootMethod initStringBuilderSM = getSootMethod(StringBuilderSC, "void <init>(java.lang.String)");
		SootMethod appendStringBuilderSM = getSootMethod(StringBuilderSC, "java.lang.StringBuilder append(java.lang.String)");
		SootMethod toStringSM = getSootMethod(StringBuilderSC, "java.lang.String toString()");
		SootMethod writeSM = getSootMethod(WriterSC, "void write(java.lang.String)");
		SootMethod flushSM = getSootMethod(BufferedWriterSC, "void flush()");
		SootMethod closeSM = getSootMethod(BufferedWriterSC, "void close()");
		
		// list dependent SootField instances
		SootField mInSF = getSootField(TraceDecoderAbstractSC, "mIn");
		
		// declare and add method "void dumpEncodedTrace(java.lang.String, int)"
		SootMethod saveETMv4PacketTypeSM = new SootMethod("saveETMv4PacketType", Arrays.asList(new Type[] {StringSC.getType(), StringSC.getType()}), VoidType.v(), Modifier.PROTECTED);
		TraceDecoderETM4XSC.addMethod(saveETMv4PacketTypeSM);
				
		// create the method body
		JimpleBody saveETMv4PacketTypeJB = Jimple.v().newBody(saveETMv4PacketTypeSM);
		saveETMv4PacketTypeSM.setActiveBody(saveETMv4PacketTypeJB);
				
		LocalGenerator localGen = new LocalGenerator(saveETMv4PacketTypeSM.getActiveBody());
		
		// [0] r0 := @this: com.arm.debug.trace.decode.TraceDecoderETM4X;
		Local lhs_0 = localGen.generateLocal(TraceDecoderETM4XSC.getType());
		ThisRef rhs_0 = Jimple.v().newThisRef(TraceDecoderETM4XSC.getType());
		IdentityStmt stmt_0 = Jimple.v().newIdentityStmt(lhs_0, rhs_0);
		
		// [1] r1 := @parameter0: java.lang.String;
		Local lhs_1 = localGen.generateLocal(StringSC.getType());
		ParameterRef rhs_1 = Jimple.v().newParameterRef(StringSC.getType(), 0);
		IdentityStmt stmt_1 = Jimple.v().newIdentityStmt(lhs_1, rhs_1);
		
		// [2] r2 := @parameter0: java.lang.String;
		Local lhs_2 = localGen.generateLocal(StringSC.getType());
		ParameterRef rhs_2 = Jimple.v().newParameterRef(StringSC.getType(), 1);
		IdentityStmt stmt_2 = Jimple.v().newIdentityStmt(lhs_2, rhs_2);
		
		// [3] $r4 = new java.io.File;
		Local lhs_3 = localGen.generateLocal(FileSC.getType());
		NewExpr rhs_3 = Jimple.v().newNewExpr(FileSC.getType());
		AssignStmt stmt_3 = Jimple.v().newAssignStmt(lhs_3, rhs_3);
		
		// [4] specialinvoke $r4.<java.io.File: void <init>(java.lang.String)>(r1);
		SpecialInvokeExpr expr_4 = Jimple.v().newSpecialInvokeExpr(lhs_3, initFileSM.makeRef(), lhs_1);
		InvokeStmt stmt_4 = Jimple.v().newInvokeStmt(expr_4);
		
		// [5] r12 = $r4;
		Local lhs_5 = localGen.generateLocal(FileSC.getType());
		Local rhs_5 = lhs_3;
    	AssignStmt stmt_5 = Jimple.v().newAssignStmt(lhs_5, rhs_5);
		
		// [6] $z0 = virtualinvoke r12.<java.io.File: boolean exists()>();
    	Local lhs_6 = localGen.generateLocal(BooleanType.v());
    	VirtualInvokeExpr rhs_6 = Jimple.v().newVirtualInvokeExpr(lhs_5, existsFileSM.makeRef());
    	AssignStmt stmt_6 = Jimple.v().newAssignStmt(lhs_6, rhs_6);
    	
    	// [7] virtualinvoke r12.<java.io.File: boolean createNewFile()>();
    	VirtualInvokeExpr expr_7 = Jimple.v().newVirtualInvokeExpr(lhs_5, createNewFileSM.makeRef());
    	InvokeStmt stmt_7 = Jimple.v().newInvokeStmt(expr_7);
    	
    	// [8] $r5 = new java.io.BufferedWriter;
    	Local lhs_8 = localGen.generateLocal(BufferedWriterSC.getType());
    	NewExpr rhs_8 = Jimple.v().newNewExpr(BufferedWriterSC.getType());
    	AssignStmt stmt_8 = Jimple.v().newAssignStmt(lhs_8, rhs_8);
    	
    	// [9] $r6 = new java.io.FileWriter;
    	Local lhs_9 = localGen.generateLocal(FileWriterSC.getType());
    	NewExpr rhs_9 = Jimple.v().newNewExpr(FileWriterSC.getType());
    	AssignStmt stmt_9 = Jimple.v().newAssignStmt(lhs_9, rhs_9);
    	
    	// [10] specialinvoke $r6.<java.io.FileWriter: void <init>(java.io.File,boolean)>(r12, 1);
    	SpecialInvokeExpr expr_10 = Jimple.v().newSpecialInvokeExpr(lhs_9, initFileWriterSM.makeRef(), lhs_5, IntConstant.v(1));
    	InvokeStmt stmt_10 = Jimple.v().newInvokeStmt(expr_10);
    	
    	// [11] specialinvoke $r5.<java.io.BufferedWriter: void <init>(java.io.Writer)>($r6);
    	SpecialInvokeExpr expr_11 = Jimple.v().newSpecialInvokeExpr(lhs_8, initBufferedWriterSM.makeRef(), lhs_9);
    	InvokeStmt stmt_11 = Jimple.v().newInvokeStmt(expr_11);
    	
    	// [12] r3 = $r5;
    	Local lhs_12 = localGen.generateLocal(BufferedWriterSC.getType());
    	Local rhs_12 = lhs_8;
    	AssignStmt stmt_12 = Jimple.v().newAssignStmt(lhs_12, rhs_12);
    	
    	// [13] r14 = r0.<com.arm.debug.trace.decode.TraceDecoderETM4X: com.arm.debug.events.trace.TraceReader mIn>;
    	Local lhs_13 = localGen.generateLocal(TraceReaderSC.getType());
    	InstanceFieldRef rhs_13 = Jimple.v().newInstanceFieldRef(lhs_0, mInSF.makeRef());
    	AssignStmt stmt_13 = Jimple.v().newAssignStmt(lhs_13, rhs_13);
    	
    	// [14] l0 = virtualinvoke r14.<com.arm.debug.trace.decode.TraceReaderDTSLSource: long mPosition>;
    	Local lhs_14 = localGen.generateLocal(LongType.v());
    	VirtualInvokeExpr rhs_14 = Jimple.v().newVirtualInvokeExpr(lhs_13, getPositionSM.makeRef());
    	AssignStmt stmt_14 = Jimple.v().newAssignStmt(lhs_14, rhs_14);
    	
    	// [15] $r7 = new java.lang.StringBuilder;
		Local lhs_15 = localGen.generateLocal(StringBuilderSC.getType());
		NewExpr rhs_15 = Jimple.v().newNewExpr(StringBuilderSC.getType());
		AssignStmt stmt_15 = Jimple.v().newAssignStmt(lhs_15, rhs_15);
    	
    	// [16] $r8 = staticinvoke <java.lang.String: java.lang.String valueOf(long)>(l0);
		Local lhs_16 = localGen.generateLocal(StringSC.getType());
		StaticInvokeExpr rhs_16 = Jimple.v().newStaticInvokeExpr(valueOfSM.makeRef(), lhs_14);
		AssignStmt stmt_16 = Jimple.v().newAssignStmt(lhs_16, rhs_16);
		
    	// [17] specialinvoke $r7.<java.lang.StringBuilder: void <init>(java.lang.String)>($r8);
		SpecialInvokeExpr expr_17 = Jimple.v().newSpecialInvokeExpr(lhs_15, initStringBuilderSM.makeRef(), lhs_16);
		InvokeStmt stmt_17 = Jimple.v().newInvokeStmt(expr_17);
		
    	// [18] $r9 = virtualinvoke $r7.<java.lang.StringBuilder: java.lang.StringBuilder append(java.lang.String)>(r2);
		Local lhs_18 = localGen.generateLocal(StringBuilderSC.getType());
		VirtualInvokeExpr rhs_18 = Jimple.v().newVirtualInvokeExpr(lhs_15, appendStringBuilderSM.makeRef(), lhs_2);
		AssignStmt stmt_18 = Jimple.v().newAssignStmt(lhs_18, rhs_18);
		
    	// [19] $r10 = virtualinvoke $r9.<java.lang.StringBuilder: java.lang.String toString()>();
    	Local lhs_19 = localGen.generateLocal(StringSC.getType());
    	VirtualInvokeExpr rhs_19 = Jimple.v().newVirtualInvokeExpr(lhs_18, toStringSM.makeRef());
    	AssignStmt stmt_19 = Jimple.v().newAssignStmt(lhs_19, rhs_19);
		
    	// [20] virtualinvoke r3.<java.io.BufferedWriter: void write(java.lang.String)>($r10);
    	VirtualInvokeExpr expr_20 = Jimple.v().newVirtualInvokeExpr(lhs_12, writeSM.makeRef(), lhs_19);
    	InvokeStmt stmt_20 = Jimple.v().newInvokeStmt(expr_20);
    	
    	// [21] virtualinvoke r3.<java.io.BufferedWriter: void flush()>();
    	VirtualInvokeExpr expr_21 = Jimple.v().newVirtualInvokeExpr(lhs_12, flushSM.makeRef());
    	InvokeStmt stmt_21 = Jimple.v().newInvokeStmt(expr_21);
    	
    	// [22] virtualinvoke r3.<java.io.BufferedWriter: void close()>();
    	VirtualInvokeExpr expr_22 = Jimple.v().newVirtualInvokeExpr(lhs_12, closeSM.makeRef());
    	InvokeStmt stmt_22 = Jimple.v().newInvokeStmt(expr_22);
    	
    	// [23] $r11 := @caughtexception;
    	Local lhs_23 = localGen.generateLocal(ExceptionSC.getType());
    	CaughtExceptionRef rhs_23 = Jimple.v().newCaughtExceptionRef();
    	IdentityStmt stmt_23 = Jimple.v().newIdentityStmt(lhs_23, rhs_23);
    	
    	// [24] r13 = $r11;
    	Local lhs_24 = localGen.generateLocal(ExceptionSC.getType());
    	Local rhs_24 = lhs_23;
    	AssignStmt stmt_24 = Jimple.v().newAssignStmt(lhs_24, rhs_24);
    	
    	// [25] return 
    	ReturnVoidStmt stmt_25 = Jimple.v().newReturnVoidStmt();
    	
    	// [26] #1# if $z0 == 0 goto label2;
    	EqExpr condition_26 = Jimple.v().newEqExpr(lhs_6, IntConstant.v(0));
    	Unit target_26 = stmt_7;
    	IfStmt stmt_26 = Jimple.v().newIfStmt(condition_26, target_26);
    	
    	// [27] #2# goto label5;
    	Unit target_27 = stmt_25;
    	GotoStmt stmt_27 = Jimple.v().newGotoStmt(target_27);
    	
    	// [T0] catch java.lang.Exception from label1 to label3 with label4;
    	Trap trap_0 = Jimple.v().newTrap(ExceptionSC, stmt_3, stmt_27, stmt_23);
    	
    	/* ---- */
    	
    	List<Unit> bodyStmtList = new ArrayList<Unit>();
		bodyStmtList.add(stmt_0);
		bodyStmtList.add(stmt_1);
		bodyStmtList.add(stmt_2);
		
		bodyStmtList.add(stmt_3);
		bodyStmtList.add(stmt_4);
		bodyStmtList.add(stmt_5);
		bodyStmtList.add(stmt_6);
		bodyStmtList.add(stmt_26); // #1# goto
		
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
		bodyStmtList.add(stmt_19);
		bodyStmtList.add(stmt_20);
		bodyStmtList.add(stmt_21);
		bodyStmtList.add(stmt_22);
		
		bodyStmtList.add(stmt_27); // #2# goto
		
		bodyStmtList.add(stmt_23);
		bodyStmtList.add(stmt_24);
		
		bodyStmtList.add(stmt_25); // return
		
		saveETMv4PacketTypeJB.getUnits().addAll(bodyStmtList);
		saveETMv4PacketTypeJB.getTraps().add(trap_0);
		
		System.out.println(saveETMv4PacketTypeJB.toString());
    	
		return saveETMv4PacketTypeSM;
	}
	
	// generate auxiliary classes
	/* null */
		
	// modify auxiliary fields
	/* null */
		
	// modify auxiliary methods
	
	// #1 Extension
	private SootMethod modifyExtension() {
		/*
		 * reference -> "void process(com.arm.debug.trace.decode.TraceDecoderETM4X, int, boolean)"
		
		public void process(com.arm.debug.trace.decode.TraceDecoderETM4X, int, boolean) throws com.arm.debug.trace.decode.exceptions.TraceCorruptedException, com.arm.debug.events.trace.TraceDecodeStopException {
        	com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$1 r0;
        	com.arm.debug.trace.decode.TraceDecoderETM4X r1;
        	int i0, i1;
        	boolean z0;
        	com.arm.debug.events.trace.TraceReader $r2;

        	r0 := @this: com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$1;
        	r1 := @parameter0: com.arm.debug.trace.decode.TraceDecoderETM4X;
        	i0 := @parameter1: int;
        	z0 := @parameter2: boolean;

        	$r2 = r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: com.arm.debug.events.trace.TraceReader mIn>;
        	i1 = virtualinvoke $r2.<com.arm.debug.events.trace.TraceReader: int read()>();
        	tableswitch(i1) {
            	case 0: goto label1;
            	case 1: goto label4;
            	case 2: goto label4;
            	case 3: goto label2;
            	case 4: goto label4;
            	case 5: goto label3;
            	default: goto label4;
        	};

     	label1:
        	virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void processASyncPacket(boolean)>(z0);
        	goto label4;

     	label2:
        	virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void processDiscardPacket(boolean)>(z0);
        	goto label4;

     	label3:
        	virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void processOverflowPacket(boolean)>(z0);
        	goto label4;

     	label4:
        	return;
    	}
    	
		 */
		
		// list dependent SootClass instances
		SootClass PacketTypeExtensionSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$1");
		SootClass TraceDecoderETM4XSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X");		
		
		// list dependent SootMethod instances
		SootMethod processSM = getSootMethod(PacketTypeExtensionSC, "void process(com.arm.debug.trace.decode.TraceDecoderETM4X,int,boolean)");
		SootMethod saveETMv4PacketTypeSM = getSootMethod(TraceDecoderETM4XSC, "void saveETMv4PacketType(java.lang.String,java.lang.String)");
		
		// list dependent SootField instances
		
		// obtain the target Unit
		Unit tgtUnit = getTargetUnit(processSM, "$r2 = r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: com.arm.debug.events.trace.TraceReader mIn>");
		
		// virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void saveETMv4PacketType(java.lang.String,java.lang.String)>("D:/dump_debug.txt", "PROCESS EXTENSION");
		Local base = processSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr = Jimple.v().newVirtualInvokeExpr(base, saveETMv4PacketTypeSM.makeRef(), StringConstant.v("D:/dump_debug.txt"), StringConstant.v(": PROCESS EXTENSION\n"));
		InvokeStmt stmt = Jimple.v().newInvokeStmt(expr);
				
		// insert the customized Stmt after the target Unit
		processSM.retrieveActiveBody().getUnits().insertBefore(stmt, tgtUnit);
		
		return processSM;
	}
	
	// #2 TraceInfo
	private SootMethod modifyTraceInfo() {
		// list dependent SootClass instances
		SootClass PacketTypeTraceInfoSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$2");
		SootClass TraceDecoderETM4XSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X");
	
		// list dependent SootMethod instances
		SootMethod readSM = getSootMethod(PacketTypeTraceInfoSC, "void read(com.arm.debug.trace.decode.TraceDecoderETM4X,int)");
		SootMethod saveETMv4PacketTypeSM = getSootMethod(TraceDecoderETM4XSC, "void saveETMv4PacketType(java.lang.String,java.lang.String)");
		
		// list dependent SootField instances
		
		// obtain the target Unit
		Unit tgtUnit = getTargetUnit(readSM, "$r2 = r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: com.arm.debug.events.trace.TraceReader mIn>");
				
		// virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void saveETMv4PacketType(java.lang.String,java.lang.String)>("D:/dump_debug.txt", "PROCESS EXTENSION");
		Local base = readSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr = Jimple.v().newVirtualInvokeExpr(base, saveETMv4PacketTypeSM.makeRef(), StringConstant.v("D:/dump_debug.txt"), StringConstant.v(": READ TRACEINFO\n"));
		InvokeStmt stmt = Jimple.v().newInvokeStmt(expr);
						
		// insert the customized Stmt after the target Unit
		readSM.retrieveActiveBody().getUnits().insertBefore(stmt, tgtUnit);
		
		return readSM;
	}
	
	// #4 TraceOn
	private SootMethod modifyTraceOn() {
		// list dependent SootClass instances
		SootClass PacketTypeTraceOnSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$4");
		SootClass TraceDecoderETM4XSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X");
			
		// list dependent SootMethod instances
		SootMethod processSM = getSootMethod(PacketTypeTraceOnSC, "void process(com.arm.debug.trace.decode.TraceDecoderETM4X,int,boolean)");
		SootMethod saveETMv4PacketTypeSM = getSootMethod(TraceDecoderETM4XSC, "void saveETMv4PacketType(java.lang.String,java.lang.String)");
				
		// list dependent SootField instances
		
		// obtain the target Unit
		Unit tgtUnit = getTargetUnit(processSM, "$r2 = new com.arm.debug.trace.decode.TraceInfoRecord");
				
		// virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void saveETMv4PacketType(java.lang.String,java.lang.String)>("D:/dump_debug.txt", "PROCESS EXTENSION");
		Local base = processSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr = Jimple.v().newVirtualInvokeExpr(base, saveETMv4PacketTypeSM.makeRef(), StringConstant.v("D:/dump_debug.txt"), StringConstant.v(": PROCESS TRACEON\n"));
		InvokeStmt stmt = Jimple.v().newInvokeStmt(expr);
						
		// insert the customized Stmt after the target Unit
		processSM.retrieveActiveBody().getUnits().insertBefore(stmt, tgtUnit);
		
		return processSM;
	}
	
	// #12 DataSyncMarkers2
	private SootMethod modifyDataSyncMarkers2() {
		// list dependent SootClass instances
		SootClass PacketTypeDataSyncMarkers2SC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$12");
		SootClass TraceDecoderETM4XSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X");
			
		// list dependent SootMethod instances
		SootMethod processSM = getSootMethod(PacketTypeDataSyncMarkers2SC, "void process(com.arm.debug.trace.decode.TraceDecoderETM4X,int,boolean)");
		SootMethod saveETMv4PacketTypeSM = getSootMethod(TraceDecoderETM4XSC, "void saveETMv4PacketType(java.lang.String,java.lang.String)");
				
		// list dependent SootField instances
		
		// obtain the target Unit
		Unit tgtUnit = getTargetUnit(processSM, "i1 = staticinvoke <com.arm.debug.trace.decode.TraceDecoderETM4X: int field(int,int,int)>(2, 0, i0)");
				
		// virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void saveETMv4PacketType(java.lang.String,java.lang.String)>("D:/dump_debug.txt", "PROCESS EXTENSION");
		Local base = processSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr = Jimple.v().newVirtualInvokeExpr(base, saveETMv4PacketTypeSM.makeRef(), StringConstant.v("D:/dump_debug.txt"), StringConstant.v(": PROCESS DATA SYNC MARKERS2\n"));
		InvokeStmt stmt = Jimple.v().newInvokeStmt(expr);
						
		// insert the customized Stmt after the target Unit
		processSM.retrieveActiveBody().getUnits().insertBefore(stmt, tgtUnit);
		
		return processSM;
	}
	
	// #31 Context
	private SootMethod modifyContext() {
		// list dependent SootClass instances
		SootClass PacketTypeContextSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$31");
		SootClass TraceDecoderETM4XSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X");
			
		// list dependent SootMethod instances
		SootMethod processSM = getSootMethod(PacketTypeContextSC, "void process(com.arm.debug.trace.decode.TraceDecoderETM4X,int,boolean)");
		SootMethod saveETMv4PacketTypeSM = getSootMethod(TraceDecoderETM4XSC, "void saveETMv4PacketType(java.lang.String,java.lang.String)");
				
		// list dependent SootField instances
		
		// obtain the target Unit
		Unit tgtUnit = getTargetUnit(processSM, "virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: com.arm.debug.trace.decode.TraceDecoderETM4X$AddressRegister contextPacket(int,boolean,boolean)>(i0, z0, z0)");
				
		// virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void saveETMv4PacketType(java.lang.String,java.lang.String)>("D:/dump_debug.txt", "PROCESS EXTENSION");
		Local base = processSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr = Jimple.v().newVirtualInvokeExpr(base, saveETMv4PacketTypeSM.makeRef(), StringConstant.v("D:/dump_debug.txt"), StringConstant.v(": PROCESS CONTEXT\n"));
		InvokeStmt stmt = Jimple.v().newInvokeStmt(expr);
						
		// insert the customized Stmt after the target Unit
		processSM.retrieveActiveBody().getUnits().insertBefore(stmt, tgtUnit);
		
		return processSM;
	}
	
	// #33 Address
	private SootMethod modifyAddress() {
		// list dependent SootClass instances
		SootClass PacketTypeAddressSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X$PacketType$33");
		SootClass TraceDecoderETM4XSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X");
		SootClass AddressRegisterSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X$AddressRegister");
		SootClass StringSC = getSootClass("java.lang.String");	
		
		// list dependent SootMethod instances
		SootMethod processSM = getSootMethod(PacketTypeAddressSC, "void process(com.arm.debug.trace.decode.TraceDecoderETM4X,int,boolean)");
		System.out.println(processSM.retrieveActiveBody());
		SootMethod saveETMv4PacketTypeSM = getSootMethod(TraceDecoderETM4XSC, "void saveETMv4PacketType(java.lang.String,java.lang.String)");
		SootMethod toStringSM = getSootMethod(AddressRegisterSC, "java.lang.String toString()");
		
		// list dependent SootField instances
		
		LocalGenerator localGen = new LocalGenerator(processSM.getActiveBody());
		
		// log normal information
		
		// obtain the target Unit
		Unit tgtUnit_0 = getTargetUnit(processSM, "r2 = virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: com.arm.debug.trace.decode.TraceDecoderETM4X$AddressRegister readAddressPacket(int,boolean)>(i0, z0)");
		
		// [0] virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void saveETMv4PacketType(java.lang.String,java.lang.String)>("D:/dump_debug.txt", "PROCESS EXTENSION");
		Local base_0 = processSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr_0 = Jimple.v().newVirtualInvokeExpr(base_0, saveETMv4PacketTypeSM.makeRef(), StringConstant.v("D:/dump_debug.txt"), StringConstant.v(": PROCESS ADDRESS\n"));
		InvokeStmt stmt_0 = Jimple.v().newInvokeStmt(expr_0);
						
		// insert the customized Stmt after the target Unit
		processSM.retrieveActiveBody().getUnits().insertBefore(stmt_0, tgtUnit_0);
		
		// log address information
		
		Unit tgtUnit_1 = getTargetUnit(processSM, "r2 = virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: com.arm.debug.trace.decode.TraceDecoderETM4X$AddressRegister readAddressPacket(int,boolean)>(i0, z0)");
		
		// [1] r3 = virtualinvoke r2.<com.arm.debug.trace.decode.TraceDecoderETM4X$AddressRegister: java.lang.String toString()>()
		Local lhs_1 = localGen.generateLocal(StringSC.getType());
		VirtualInvokeExpr rhs_1 = Jimple.v().newVirtualInvokeExpr((Local) ((AssignStmt) tgtUnit_1).getLeftOp(), toStringSM.makeRef());
		AssignStmt stmt_1 = Jimple.v().newAssignStmt(lhs_1, rhs_1);
		
		processSM.retrieveActiveBody().getUnits().insertAfter(stmt_1, tgtUnit_1);
		
		Unit tgtUnit_2 = stmt_1;
		
		// [2] virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void saveETMv4PacketType(java.lang.String,java.lang.String)>("D:/dump_debug.txt", r3);
		Local base_2 = processSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr_2 = Jimple.v().newVirtualInvokeExpr(base_2, saveETMv4PacketTypeSM.makeRef(), StringConstant.v("D:/dump_debug.txt"), lhs_1);
		InvokeStmt stmt_2 = Jimple.v().newInvokeStmt(expr_2);
		
		processSM.retrieveActiveBody().getUnits().insertAfter(stmt_2, tgtUnit_2);
		
		Unit tgtUnit_3 = stmt_2;
		
		// [3] virtualinvoke r1.<com.arm.debug.trace.decode.TraceDecoderETM4X: void saveETMv4PacketType(java.lang.String,java.lang.String)>("D:/dump_debug.txt", "\n");
		Local base_3 = processSM.retrieveActiveBody().getParameterLocal(0);
		VirtualInvokeExpr expr_3 = Jimple.v().newVirtualInvokeExpr(base_3, saveETMv4PacketTypeSM.makeRef(), StringConstant.v("D:/dump_debug.txt"), StringConstant.v("\n"));
		InvokeStmt stmt_3 = Jimple.v().newInvokeStmt(expr_3);
		
		processSM.retrieveActiveBody().getUnits().insertAfter(stmt_3, tgtUnit_3);
		
		return processSM;
	}
	
	// modify auxiliary classes
	/* null */
		
	private void customizeTraceDecoderETM4X() {
		/*
		SootClass TraceDecoderETM4XSC = getSootClass("com.arm.debug.trace.decode.TraceDecoderETM4X"); // "SC" refers to "SootClass"
	
		// TraceReaderDTSLSC should not be null
	
		for (SootMethod sm : TraceDecoderETM4XSC.getMethods()) {
			System.out.println(sm.getSignature());
		}
		
		// SootMethod tgtMethod = getSootMethod(TraceDecoderETM4XSC, "int read()");
		// System.out.println(tgtMethod.retrieveActiveBody());
		*/
		
		// first, generation
		// for fields
		
		// for methods
		generateSaveETMv4PacketType();
		// for classes
				
		
		// then, modification
		// for fields
		
		// for methods
		modifyExtension();
		modifyTraceInfo();
		modifyTraceOn();
		modifyDataSyncMarkers2();
		modifyContext();
		modifyAddress();
		
		// for classes
		
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
