package hk.polyu.repackage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import soot.ArrayType;
import soot.BooleanType;
import soot.ByteType;
import soot.IntType;
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
import soot.jimple.AddExpr;
import soot.jimple.ArrayRef;
import soot.jimple.AssignStmt;
import soot.jimple.CastExpr;
import soot.jimple.CaughtExceptionRef;
import soot.jimple.DivExpr;
import soot.jimple.EqExpr;
import soot.jimple.GotoStmt;
import soot.jimple.IdentityStmt;
import soot.jimple.IfStmt;
import soot.jimple.InstanceFieldRef;
import soot.jimple.IntConstant;
import soot.jimple.InvokeStmt;
import soot.jimple.Jimple;
import soot.jimple.JimpleBody;
import soot.jimple.LongConstant;
import soot.jimple.LtExpr;
import soot.jimple.NewArrayExpr;
import soot.jimple.NewExpr;
import soot.jimple.NullConstant;
import soot.jimple.ParameterRef;
import soot.jimple.RemExpr;
import soot.jimple.ReturnVoidStmt;
import soot.jimple.SpecialInvokeExpr;
import soot.jimple.SubExpr;
import soot.jimple.ThisRef;
import soot.jimple.VirtualInvokeExpr;

public class ParseTraceReaderDTSL {
	
	private SootEnvironment env = SootEnvironment.env;
	
	public void exec() {
		assert(env != null);
		customizeTraceReaderDTSL();
	}
	
	// ---- generate auxiliary fields ---- //
	
	/* null */
	
	// ---- generate auxiliary methods ---- //
	
	// save ETMv4 trace bytes
	private SootMethod generateSaveETMv4TraceBytes() {
		/*
		 * reference
		 
		public void saveTraceBytes(java.lang.String, byte[]) {
        	com.arm.debug.trace.decode.TraceReaderDTSLSource r0;
        	java.lang.String r1;
        	byte[] r2;
        	java.io.DataOutputStream r3, $r5;
        	java.io.File $r4, r8;
        	java.io.FileOutputStream $r6;
        	java.lang.Exception $r7, r9;

        	r0 := @this: com.arm.debug.trace.decode.TraceReaderDTSLSource;
        	r1 := @parameter0: java.lang.String;
        	r2 := @parameter1: byte[];

     	label1:
        	$r4 = new java.io.File;
        	specialinvoke $r4.<java.io.File: void <init>(java.lang.String)>(r1);
        	r8 = $r4;
        	$r5 = new java.io.DataOutputStream;
        	$r6 = new java.io.FileOutputStream;
        	specialinvoke $r6.<java.io.FileOutputStream: void <init>(java.io.File,boolean)>(r8, 1);
        	specialinvoke $r5.<java.io.DataOutputStream: void <init>(java.io.OutputStream)>($r6);
        	r3 = $r5;
        	virtualinvoke r3.<java.io.DataOutputStream: void write(byte[])>(r2);
        	virtualinvoke r3.<java.io.DataOutputStream: void flush()>();
        	virtualinvoke r3.<java.io.DataOutputStream: void close()>();

     	label2:
        	#1# goto label4;

     	label3:
        	$r7 := @caughtexception;
        	r9 = $r7;

     	label4:
        	return;

        	catch java.lang.Exception from label1 to label2 with label3;
    	}
		  
		 */
		
		// list dependent SootClass instances
		SootClass TraceReaderDTSLSC = getSootClass("com.arm.debug.trace.decode.TraceReaderDTSLSource");
		SootClass StringSC = getSootClass("java.lang.String");
		SootClass FileSC = getSootClass("java.io.File");
		SootClass DataOutputStreamSC = getSootClass("java.io.DataOutputStream");
		SootClass FilterOutputStreamSC = getSootClass("java.io.FilterOutputStream");
		SootClass FileOutputStreamSC = getSootClass("java.io.FileOutputStream");
		SootClass ExceptionSC = getSootClass("java.lang.Exception");
		
		// list dependent SootMethod instances
		SootMethod initFileSM = getSootMethod(FileSC, "void <init>(java.lang.String)");
		SootMethod initFileOutputStreamSM = getSootMethod(FileOutputStreamSC, "void <init>(java.io.File,boolean)");
		SootMethod initDataOutputStreamSM = getSootMethod(DataOutputStreamSC, "void <init>(java.io.OutputStream)");
		SootMethod writeSM = getSootMethod(FilterOutputStreamSC, "void write(byte[])");
		SootMethod flushSM = getSootMethod(DataOutputStreamSC, "void flush()");
		SootMethod closeSM = getSootMethod(FilterOutputStreamSC, "void close()");
		
		// list dependent SootField instances
		
		// declare and add method "public void saveETMv4TraceBytes(java.lang.String, byte[])"
		SootMethod saveETMv4TraceBytesSM = new SootMethod("saveETMv4TraceBytes", Arrays.asList(new Type[] {StringSC.getType(), ArrayType.v(ByteType.v(), 1)}), VoidType.v(), Modifier.PUBLIC);
		TraceReaderDTSLSC.addMethod(saveETMv4TraceBytesSM);
			
		// create the method body
		JimpleBody saveETMv4TraceBytesJB = Jimple.v().newBody(saveETMv4TraceBytesSM);
		saveETMv4TraceBytesSM.setActiveBody(saveETMv4TraceBytesJB);
				
		LocalGenerator localGen = new LocalGenerator(saveETMv4TraceBytesSM.getActiveBody());
		
		// [0] r0 := this: com.arm.debug.trace.decode.TraceReaderDTSLSource;
		Local lhs_0 = localGen.generateLocal(TraceReaderDTSLSC.getType());
		ThisRef rhs_0 = Jimple.v().newThisRef(TraceReaderDTSLSC.getType());
		IdentityStmt stmt_0 = Jimple.v().newIdentityStmt(lhs_0, rhs_0);
		
		// [1] r1 := @parameter0: java.lang.String;
		Local lhs_1 = localGen.generateLocal(StringSC.getType());
		ParameterRef rhs_1 = Jimple.v().newParameterRef(StringSC.getType(), 0);
		IdentityStmt stmt_1 = Jimple.v().newIdentityStmt(lhs_1, rhs_1);
		
		// [2] r2 := @parameter1: byte[];
		Local lhs_2 = localGen.generateLocal(ArrayType.v(ByteType.v(), 1));
		ParameterRef rhs_2 = Jimple.v().newParameterRef(ArrayType.v(ByteType.v(), 1), 1);
		IdentityStmt stmt_2 = Jimple.v().newIdentityStmt(lhs_2, rhs_2);
		
		// [3] $r4 = new java.io.File;
		Local lhs_3 = localGen.generateLocal(FileSC.getType());
		NewExpr rhs_3 = Jimple.v().newNewExpr(FileSC.getType());
		AssignStmt stmt_3 = Jimple.v().newAssignStmt(lhs_3, rhs_3);
		
		// [4] specialinvoke $r4.<java.io.File: void <init>(java.lang.String)>(r1);
		SpecialInvokeExpr expr_4 = Jimple.v().newSpecialInvokeExpr(lhs_3, initFileSM.makeRef(), lhs_1);
		InvokeStmt stmt_4 = Jimple.v().newInvokeStmt(expr_4);
		
		// [5] r8 = $r4;
		Local lhs_5 = localGen.generateLocal(FileSC.getType());
		Local rhs_5 = lhs_3;
		AssignStmt stmt_5 = Jimple.v().newAssignStmt(lhs_5, rhs_5);
		
		// [6] $r5 = new java.io.DataOutputStream;
		Local lhs_6 = localGen.generateLocal(DataOutputStreamSC.getType());
		NewExpr rhs_6 = Jimple.v().newNewExpr(DataOutputStreamSC.getType());
		AssignStmt stmt_6 = Jimple.v().newAssignStmt(lhs_6, rhs_6);
		    	
		// [7] $r6 = new java.io.FileOutputStream;
		Local lhs_7 = localGen.generateLocal(FileOutputStreamSC.getType());
		NewExpr rhs_7 = Jimple.v().newNewExpr(FileOutputStreamSC.getType());
		AssignStmt stmt_7 = Jimple.v().newAssignStmt(lhs_7, rhs_7);
		
		// [8] specialinvoke $r6.<java.io.FileOutputStream: void <init>(java.io.File,boolean)>(r8, 1);
		SpecialInvokeExpr expr_8 = Jimple.v().newSpecialInvokeExpr(lhs_7, initFileOutputStreamSM.makeRef(), lhs_5, IntConstant.v(1));
		InvokeStmt stmt_8 = Jimple.v().newInvokeStmt(expr_8);
		
		// [9] specialinvoke $r5.<java.io.DataOutputStream: void <init>(java.io.OutputStream)>($r6);
		SpecialInvokeExpr expr_9 = Jimple.v().newSpecialInvokeExpr(lhs_6, initDataOutputStreamSM.makeRef(), lhs_7);
		InvokeStmt stmt_9 = Jimple.v().newInvokeStmt(expr_9);
		
		// [10] r3 = $r5;
		Local lhs_10 = localGen.generateLocal(DataOutputStreamSC.getType());
		Local rhs_10 = lhs_6;
		AssignStmt stmt_10 = Jimple.v().newAssignStmt(lhs_10, rhs_10);
		
		// [11] virtualinvoke r3.<java.io.DataOutputStream: void write(byte[])>(r2);
		VirtualInvokeExpr expr_11 = Jimple.v().newVirtualInvokeExpr(lhs_10, writeSM.makeRef(), lhs_2);
		InvokeStmt stmt_11 = Jimple.v().newInvokeStmt(expr_11);
		
		// [12] virtualinvoke r3.<java.io.DataOutputStream: void flush()>();
		VirtualInvokeExpr expr_12 = Jimple.v().newVirtualInvokeExpr(lhs_10, flushSM.makeRef());
		InvokeStmt stmt_12 = Jimple.v().newInvokeStmt(expr_12);
		
		// [13] virtualinvoke r3.<java.io.DataOutputStream: void close()>();
		VirtualInvokeExpr expr_13 = Jimple.v().newVirtualInvokeExpr(lhs_10, closeSM.makeRef());
		InvokeStmt stmt_13 = Jimple.v().newInvokeStmt(expr_13);
		
		// [14] $r7 := @caughtexception;
		Local lhs_14 = localGen.generateLocal(ExceptionSC.getType());
		CaughtExceptionRef rhs_14 = Jimple.v().newCaughtExceptionRef();
		IdentityStmt stmt_14 = Jimple.v().newIdentityStmt(lhs_14, rhs_14);
		
		// [15] r9 = $r7;
		Local lhs_15 = localGen.generateLocal(ExceptionSC.getType());
		Local rhs_15 = lhs_14;
		AssignStmt stmt_15= Jimple.v().newAssignStmt(lhs_15, rhs_15);
		
		// [16] return 
		ReturnVoidStmt stmt_16 = Jimple.v().newReturnVoidStmt();
		
		// [17] #1# goto label4;
		Unit target_17 = stmt_16;
		GotoStmt stmt_17 = Jimple.v().newGotoStmt(target_17);
		
		// [T0] catch java.lang.Exception from label1 to label2 with label3;
		Trap trap_0 = Jimple.v().newTrap(ExceptionSC, stmt_3, stmt_17, stmt_14);
		
		// ---- //
		
		List<Unit> bodyStmtList = new ArrayList<Unit>();
		bodyStmtList.add(stmt_0);
		bodyStmtList.add(stmt_1);
		bodyStmtList.add(stmt_2);
		
		bodyStmtList.add(stmt_3);
		bodyStmtList.add(stmt_4);
		bodyStmtList.add(stmt_5);
		bodyStmtList.add(stmt_6);
		bodyStmtList.add(stmt_7);
		bodyStmtList.add(stmt_8);
		bodyStmtList.add(stmt_9);
		bodyStmtList.add(stmt_10);
		bodyStmtList.add(stmt_11);
		bodyStmtList.add(stmt_12);
		bodyStmtList.add(stmt_13);
		bodyStmtList.add(stmt_17); // #1# goto label4;
		
		bodyStmtList.add(stmt_14);
		bodyStmtList.add(stmt_15);
		bodyStmtList.add(stmt_16); // return
		
		saveETMv4TraceBytesJB.getUnits().addAll(bodyStmtList);
		saveETMv4TraceBytesJB.getTraps().add(trap_0);
		
		System.out.println(saveETMv4TraceBytesJB.toString());
		  	
		return saveETMv4TraceBytesSM;
	}
	
	// save ETMv4 trace
	private SootMethod generateSaveETMv4Trace() {
		/*
		 * reference
		 
		public void saveTrace(java.lang.String) {
        	com.arm.debug.trace.decode.TraceReaderDTSLSource r0;
        	java.lang.String r1;
        	long l0, l1, l2, $l5, $l6;
        	int i3, i4, $i7, $i9, i11, i12, i13;
        	java.io.File $r2, r5;
        	boolean $z0;
        	byte $b8, $b10;
        	java.lang.Exception $r3, r6;
        	byte[] r4;

        	r0 := @this: com.arm.debug.trace.decode.TraceReaderDTSLSource;
        	r1 := @parameter0: java.lang.String;

     		l0 = r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: long mCaptureBufferStartPosition>;
        	l1 = r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: long mCaptureBufferEndPosition>;
        	l2 = l1 - l0;
        	$l5 = l2 / 65536L;
        	i3 = (int) $l5;
        	$l6 = l2 % 65536L;
        	i4 = (int) $l6;
        	r4 = null;
        	
        label01:
        	$r2 = new java.io.File;
        	specialinvoke $r2.<java.io.File: void <init>(java.lang.String)>(r1);
        	r5 = $r2;
        	$z0 = virtualinvoke r5.<java.io.File: boolean exists()>();
        	#1# if $z0 == 0 goto label02;
        	virtualinvoke r5.<java.io.File: boolean delete()>();

     	label02:
        	virtualinvoke r5.<java.io.File: boolean createNewFile()>();
        	i11 = 0;
        	#2# goto label06;

     	label03:
        	r4 = newarray (byte)[65536];
        	i12 = 0;
        	#3# goto label05;

     	label04:
        	$i7 = virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: int read()>();
        	$b8 = (byte) $i7;
        	r4[i12] = $b8;
        	i12 = i12 + 1;

     	label05:
        	#4# if i12 < 65536 goto label04;
        	virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void saveTraceBytes(java.lang.String,byte[])>(r1, r4);
        	i11 = i11 + 1;

     	label06:
        	#5# if i11 < i3 goto label03;
        	r4 = newarray (byte)[i4];
        	i13 = 0;
        	#6# goto label08;

     	label07:
        	$i9 = virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: int read()>();
        	$b10 = (byte) $i9;
        	r4[i13] = $b10;
        	i13 = i13 + 1;

     	label08:
        	#7# if i13 < i4 goto label07;
        	virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void saveTraceBytes(java.lang.String,byte[])>(r1, r6);

     	label09:
        	#8# goto label11;

     	label10:
        	$r3 := @caughtexception;
        	r6 = $r3;
        	virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void saveTraceBytes(java.lang.String,byte[])>(r1, r4);

     	label11:
     		virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void seek(long)>(0L);
        	return;

        	#T0# catch java.lang.Exception from label01 to label09 with label10;
    	}
		 
		 */
		
		// list dependent SootClass instances
		SootClass TraceReaderDTSLSC = getSootClass("com.arm.debug.trace.decode.TraceReaderDTSLSource");
		SootClass StringSC = getSootClass("java.lang.String");
		SootClass FileSC = getSootClass("java.io.File");
		SootClass ExceptionSC = getSootClass("java.lang.Exception");
		
		// list dependent SootMethod instances
		SootMethod initFileSM = getSootMethod(FileSC, "void <init>(java.lang.String)");
		SootMethod existsFileSM = getSootMethod(FileSC, "boolean exists()");
		SootMethod deleteFileSM = getSootMethod(FileSC, "boolean delete()");
		SootMethod createNewFileSM = getSootMethod(FileSC, "boolean createNewFile()");
		SootMethod readSM = getSootMethod(TraceReaderDTSLSC, "int read()");
		SootMethod seekSM = getSootMethod(TraceReaderDTSLSC, "void seek(long)");
		SootMethod saveETMv4TraceBytesSM = getSootMethod(TraceReaderDTSLSC, "void saveETMv4TraceBytes(java.lang.String,byte[])");
		
		// list dependent SootField instances
		SootField mCaptureBufferStartPositionSF = getSootField(TraceReaderDTSLSC, "mCaptureBufferStartPosition");
		SootField mCaptureBufferEndPositionSF = getSootField(TraceReaderDTSLSC, "mCaptureBufferEndPosition");	
		
		// declare and add method "public void saveETMv4Trace(java.lang.String, long, long)"
		SootMethod saveETMv4TraceSM = new SootMethod("saveETMv4Trace", Arrays.asList(new Type[] {StringSC.getType()}), VoidType.v(), Modifier.PUBLIC);
		TraceReaderDTSLSC.addMethod(saveETMv4TraceSM);
								
		// create the method body
		JimpleBody saveETMv4TraceJB = Jimple.v().newBody(saveETMv4TraceSM);
		saveETMv4TraceSM.setActiveBody(saveETMv4TraceJB);
						
		LocalGenerator localGen = new LocalGenerator(saveETMv4TraceSM.getActiveBody());
		
		// [0] r0 := @this: com.arm.debug.trace.decode.TraceReaderDTSLSource;
    	Local lhs_0 = localGen.generateLocal(TraceReaderDTSLSC.getType());
    	ThisRef rhs_0 = Jimple.v().newThisRef(TraceReaderDTSLSC.getType());
    	IdentityStmt stmt_0 = Jimple.v().newIdentityStmt(lhs_0, rhs_0);
		
		// [1] r1 := @parameter0: java.lang.String;
    	Local lhs_1 = localGen.generateLocal(StringSC.getType());
    	ParameterRef rhs_1 = Jimple.v().newParameterRef(StringSC.getType(), 0);
		IdentityStmt stmt_1 = Jimple.v().newIdentityStmt(lhs_1, rhs_1);
		
		// [2] l0 = r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: long mCaptureBufferStartPosition>;
		Local lhs_2 = localGen.generateLocal(LongType.v());
		InstanceFieldRef rhs_2 = Jimple.v().newInstanceFieldRef(lhs_0, mCaptureBufferStartPositionSF.makeRef());
		AssignStmt stmt_2 = Jimple.v().newAssignStmt(lhs_2, rhs_2);
		
		// [3] l1 = r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: long mCaptureBufferEndPosition>;
		Local lhs_3 = localGen.generateLocal(LongType.v());
		InstanceFieldRef rhs_3 = Jimple.v().newInstanceFieldRef(lhs_0, mCaptureBufferEndPositionSF.makeRef());
		AssignStmt stmt_3 = Jimple.v().newAssignStmt(lhs_3, rhs_3);
		
		// [4] l2 = l1 - l0;
		Local lhs_4 = localGen.generateLocal(LongType.v());
		SubExpr rhs_4 = Jimple.v().newSubExpr(lhs_3, lhs_2);
		AssignStmt stmt_4 = Jimple.v().newAssignStmt(lhs_4, rhs_4);
			
		// [5] $l5 = l2 / 65536L;
		Local lhs_5 = localGen.generateLocal(LongType.v());
		DivExpr rhs_5 = Jimple.v().newDivExpr(lhs_4, LongConstant.v(65536));
		AssignStmt stmt_5 = Jimple.v().newAssignStmt(lhs_5, rhs_5);
		
		// [6] i3 = (int) $l5;
		Local lhs_6 = localGen.generateLocal(IntType.v());
		CastExpr rhs_6 = Jimple.v().newCastExpr(lhs_5, IntType.v());
		AssignStmt stmt_6 = Jimple.v().newAssignStmt(lhs_6, rhs_6);
		
		// [7] $l6 = l2 % 65536L;
		Local lhs_7 = localGen.generateLocal(LongType.v());
		RemExpr rhs_7 = Jimple.v().newRemExpr(lhs_4, LongConstant.v(65536));
		AssignStmt stmt_7 = Jimple.v().newAssignStmt(lhs_7, rhs_7);
		
		// [8] i4 = (int) $l6;
		Local lhs_8 = localGen.generateLocal(IntType.v());
		CastExpr rhs_8 = Jimple.v().newCastExpr(lhs_7, IntType.v());
		AssignStmt stmt_8 = Jimple.v().newAssignStmt(lhs_8, rhs_8);
		
		// [9] r4 = null;
		Local lhs_9 = localGen.generateLocal(ArrayType.v(ByteType.v(), 1));
		NullConstant rhs_9 = NullConstant.v();
		AssignStmt stmt_9 = Jimple.v().newAssignStmt(lhs_9, rhs_9);
		
	// -> label01:
		
		// [10] $r2 = new java.io.File;
		Local lhs_10 = localGen.generateLocal(FileSC.getType());
		NewExpr rhs_10 = Jimple.v().newNewExpr(FileSC.getType());
		AssignStmt stmt_10 = Jimple.v().newAssignStmt(lhs_10, rhs_10);
		
		// [11] specialinvoke $r2.<java.io.File: void <init>(java.lang.String)>(r1);
		SpecialInvokeExpr expr_11 = Jimple.v().newSpecialInvokeExpr(lhs_10, initFileSM.makeRef(), lhs_1);
		InvokeStmt stmt_11 = Jimple.v().newInvokeStmt(expr_11);
		
		// [12] r5 = $r2;
		Local lhs_12 = localGen.generateLocal(FileSC.getType());
		Local rhs_12 = lhs_10;
		AssignStmt stmt_12 = Jimple.v().newAssignStmt(lhs_12, rhs_12);
		
		// [13] $z0 = virtualinvoke r5.<java.io.File: boolean exists()>();
		Local lhs_13 = localGen.generateLocal(BooleanType.v());
		VirtualInvokeExpr rhs_13 = Jimple.v().newVirtualInvokeExpr(lhs_12, existsFileSM.makeRef());
		AssignStmt stmt_13 = Jimple.v().newAssignStmt(lhs_13, rhs_13);
		
		// -> #1# if $z0 == 0 goto label02;
		
		// [14] virtualinvoke r5.<java.io.File: boolean delete()>();
		VirtualInvokeExpr expr_14 = Jimple.v().newVirtualInvokeExpr(lhs_12, deleteFileSM.makeRef());
		InvokeStmt stmt_14 = Jimple.v().newInvokeStmt(expr_14);
		
	// -> label02:
		
		// [15] virtualinvoke r5.<java.io.File: boolean createNewFile()>();
		VirtualInvokeExpr expr_15 = Jimple.v().newVirtualInvokeExpr(lhs_12, createNewFileSM.makeRef());
		InvokeStmt stmt_15 = Jimple.v().newInvokeStmt(expr_15);
		
		// [16] i11 = 0;
		Local lhs_16 = localGen.generateLocal(IntType.v());
		IntConstant rhs_16 = IntConstant.v(0);
		AssignStmt stmt_16 = Jimple.v().newAssignStmt(lhs_16, rhs_16);
		
		// -> #2# goto label06;
		
	// -> label03:
		
		// [17] r4 = newarray (byte)[65536];
		Local lhs_17 = lhs_9;
		NewArrayExpr rhs_17 = Jimple.v().newNewArrayExpr(ByteType.v(), IntConstant.v(65536));
		AssignStmt stmt_17 = Jimple.v().newAssignStmt(lhs_17, rhs_17);
		
		// [18] i12 = 0;
		Local lhs_18 = localGen.generateLocal(IntType.v());
		IntConstant rhs_18 = IntConstant.v(0);
		AssignStmt stmt_18 = Jimple.v().newAssignStmt(lhs_18, rhs_18);
		
		// -> #3# goto label05;
		
	// -> label04:
		
		// [19] $i7 = virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: int read()>();
		Local lhs_19 = localGen.generateLocal(IntType.v());
		VirtualInvokeExpr rhs_19 = Jimple.v().newVirtualInvokeExpr(lhs_0, readSM.makeRef());
		AssignStmt stmt_19 = Jimple.v().newAssignStmt(lhs_19, rhs_19);
		
		// [20] $b8 = (byte) $i7;
		Local lhs_20 = localGen.generateLocal(ByteType.v());
		CastExpr rhs_20 = Jimple.v().newCastExpr(lhs_19, ByteType.v());
		AssignStmt stmt_20 = Jimple.v().newAssignStmt(lhs_20, rhs_20);
		
		// [21] r4[i12] = $b8;
		ArrayRef lhs_21 = Jimple.v().newArrayRef(lhs_17, lhs_18);
		Local rhs_21 = lhs_20;
		AssignStmt stmt_21 = Jimple.v().newAssignStmt(lhs_21, rhs_21);
		
		// [22] i12 = i12 + 1;
		Local lhs_22 = lhs_18;
		AddExpr rhs_22 = Jimple.v().newAddExpr(lhs_18, IntConstant.v(1));
		AssignStmt stmt_22 = Jimple.v().newAssignStmt(lhs_22, rhs_22);
		
	// -> label05:
		
		// -> #4# if i12 < 65536 goto label04;
		
		// [23] virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void saveETMv4TraceBytes(java.lang.String,byte[])>(r1, r4);
		VirtualInvokeExpr expr_23 = Jimple.v().newVirtualInvokeExpr(lhs_0, saveETMv4TraceBytesSM.makeRef(), lhs_1, lhs_17);
		InvokeStmt stmt_23 = Jimple.v().newInvokeStmt(expr_23);
		
		// [24] i11 = i11 + 1;
		Local lhs_24 = lhs_16;
		AddExpr rhs_24 = Jimple.v().newAddExpr(lhs_16, IntConstant.v(1));
		AssignStmt stmt_24 = Jimple.v().newAssignStmt(lhs_24, rhs_24);
		
	// -> label06:
		
		// -> #5# if i11 < i3 goto label03;
		
		// [25] r4 = newarray (byte)[i4];
		Local lhs_25 = lhs_9;
		NewArrayExpr rhs_25 = Jimple.v().newNewArrayExpr(ByteType.v(), lhs_8);
		AssignStmt stmt_25 = Jimple.v().newAssignStmt(lhs_25, rhs_25);
		
		// [26] i13 = 0;
		Local lhs_26 = localGen.generateLocal(IntType.v());
		IntConstant rhs_26 = IntConstant.v(0);
		AssignStmt stmt_26 = Jimple.v().newAssignStmt(lhs_26, rhs_26);
		
		// -> #6# goto label08;
		
	// -> label07:
		
		// [27] $i9 = virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: int read()>();
		Local lhs_27 = localGen.generateLocal(IntType.v());
		VirtualInvokeExpr rhs_27 = Jimple.v().newVirtualInvokeExpr(lhs_0, readSM.makeRef());
		AssignStmt stmt_27 = Jimple.v().newAssignStmt(lhs_27, rhs_27);
		
		// [28] $b10 = (byte) $i9;
		Local lhs_28 = localGen.generateLocal(ByteType.v());
		CastExpr rhs_28 = Jimple.v().newCastExpr(lhs_27, ByteType.v());
		AssignStmt stmt_28 = Jimple.v().newAssignStmt(lhs_28, rhs_28);
		
		// [29] r4[i13] = $b10;
		ArrayRef lhs_29 = Jimple.v().newArrayRef(lhs_25, lhs_26);
		Local rhs_29 = lhs_28;
		AssignStmt stmt_29 = Jimple.v().newAssignStmt(lhs_29, rhs_29);
		
		// [30] i13 = i13 + 1;
		Local lhs_30 = lhs_26;
		AddExpr rhs_30 = Jimple.v().newAddExpr(lhs_26, IntConstant.v(1));
		AssignStmt stmt_30 = Jimple.v().newAssignStmt(lhs_30, rhs_30);
		
	// -> label08:
		
		// -> #7# if i13 < i4 goto label07;
		
		// [31] virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void saveETMv4TraceBytes(java.lang.String,byte[])>(r1, r6);
		VirtualInvokeExpr expr_31 = Jimple.v().newVirtualInvokeExpr(lhs_0, saveETMv4TraceBytesSM.makeRef(), lhs_1, lhs_25);
		InvokeStmt stmt_31 = Jimple.v().newInvokeStmt(expr_31);
		
	// -> label09:
		
		// -> #8# goto label11;
		
	// -> label10:
		
		// [32] $r3 := @caughtexception;
		Local lhs_32 = localGen.generateLocal(ExceptionSC.getType());
		CaughtExceptionRef rhs_32 = Jimple.v().newCaughtExceptionRef();
		IdentityStmt stmt_32 = Jimple.v().newIdentityStmt(lhs_32, rhs_32);
		
		// [33] r6 = $r3;
		Local lhs_33 = localGen.generateLocal(ExceptionSC.getType());
		Local rhs_33 = lhs_32;
		AssignStmt stmt_33 = Jimple.v().newAssignStmt(lhs_33, rhs_33);
		
		// [34] virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void saveTraceBytes(java.lang.String,byte[])>(r1, r4);
		VirtualInvokeExpr expr_34 = Jimple.v().newVirtualInvokeExpr(lhs_0, saveETMv4TraceBytesSM.makeRef(), lhs_1, lhs_25);
		InvokeStmt stmt_34 = Jimple.v().newInvokeStmt(expr_34);
		
	// -> label11:
		
		// [35] virtualinvoke r0.<com.arm.debug.trace.decode.TraceReaderDTSLSource: void seek(long)>(0L);
    	VirtualInvokeExpr expr_35 = Jimple.v().newVirtualInvokeExpr(lhs_0, seekSM.makeRef(), LongConstant.v(0));
    	InvokeStmt stmt_35 = Jimple.v().newInvokeStmt(expr_35);
		
		// [36] return;
		ReturnVoidStmt stmt_36 = Jimple.v().newReturnVoidStmt();
		
		// [37] #1# if $z0 == 0 goto label02;
		EqExpr condition_37 = Jimple.v().newEqExpr(lhs_13, IntConstant.v(0));
		Unit target_37 = stmt_15;
		IfStmt stmt_37 = Jimple.v().newIfStmt(condition_37, target_37);
		
		// [40] #4# if i12 < 65536 goto label04;
		LtExpr condition_40 = Jimple.v().newLtExpr(lhs_22, IntConstant.v(65536));
		Unit target_40 = stmt_19;
		IfStmt stmt_40 = Jimple.v().newIfStmt(condition_40, target_40);
		
		// [39] #3# goto label05;
		Unit target_39 = stmt_40;
		GotoStmt stmt_39 = Jimple.v().newGotoStmt(target_39);
		
		// [41] #5# if i11 < i3 goto label03;
		LtExpr condition_41 = Jimple.v().newLtExpr(lhs_24, lhs_6);
		Unit target_41 = stmt_17;
		IfStmt stmt_41 = Jimple.v().newIfStmt(condition_41, target_41);
		
		// [38] #2# goto label06;
		Unit target_38 = stmt_41;
		GotoStmt stmt_38 = Jimple.v().newGotoStmt(target_38);
		
		// [43] #7# if i13 < i4 goto label07;
		LtExpr condition_43 = Jimple.v().newLtExpr(lhs_30, lhs_8);
		Unit target_43 = stmt_27;
		IfStmt stmt_43 = Jimple.v().newIfStmt(condition_43, target_43);
		
		// [42] #6# goto label08;
		Unit target_42 = stmt_43;
		GotoStmt stmt_42 = Jimple.v().newGotoStmt(target_42);
		
		// [44] #8# goto label11;
		Unit target_44 = stmt_35;
		GotoStmt stmt_44 = Jimple.v().newGotoStmt(target_44);
		
		// [T0] catch java.lang.Exception from label01 to label09 with label10;
		Trap trap_0 = Jimple.v().newTrap(ExceptionSC, stmt_10, stmt_44, stmt_32);
		
		// ---- //
    	
    	List<Unit> bodyStmtList = new ArrayList<Unit>();
		bodyStmtList.add(stmt_0);
		bodyStmtList.add(stmt_1);
		bodyStmtList.add(stmt_2);
		bodyStmtList.add(stmt_3);
		bodyStmtList.add(stmt_4);
		bodyStmtList.add(stmt_5);
		bodyStmtList.add(stmt_6);
		bodyStmtList.add(stmt_7);
		bodyStmtList.add(stmt_8);
		bodyStmtList.add(stmt_9);
		bodyStmtList.add(stmt_10);
		bodyStmtList.add(stmt_11);
		bodyStmtList.add(stmt_12);
		bodyStmtList.add(stmt_13);
		bodyStmtList.add(stmt_37); // #1# if $z0 == 0 goto label02;
		
		bodyStmtList.add(stmt_14);
		bodyStmtList.add(stmt_15);
		bodyStmtList.add(stmt_16);
		bodyStmtList.add(stmt_38); // #2# goto label06;
		
		bodyStmtList.add(stmt_17);
		bodyStmtList.add(stmt_18);
		bodyStmtList.add(stmt_39); // #3# goto label05;
		
		bodyStmtList.add(stmt_19);
		bodyStmtList.add(stmt_20);
		bodyStmtList.add(stmt_21);
		bodyStmtList.add(stmt_22);
		bodyStmtList.add(stmt_40); // #4# if i12 < 65536 goto label04;
		
		bodyStmtList.add(stmt_23);
		bodyStmtList.add(stmt_24);
		bodyStmtList.add(stmt_41); // #5# if i11 < i3 goto label03;
		
		bodyStmtList.add(stmt_25);
		bodyStmtList.add(stmt_26);
		bodyStmtList.add(stmt_42); // #6# goto label08;
		
		bodyStmtList.add(stmt_27);
		bodyStmtList.add(stmt_28);
		bodyStmtList.add(stmt_29);
		bodyStmtList.add(stmt_30);
		bodyStmtList.add(stmt_43); // #7# if i13 < i4 goto label07;
		
		bodyStmtList.add(stmt_31);
		bodyStmtList.add(stmt_44); // #8# goto label11;
		
		bodyStmtList.add(stmt_32);
		bodyStmtList.add(stmt_33);
		bodyStmtList.add(stmt_34);
		bodyStmtList.add(stmt_35);
		bodyStmtList.add(stmt_36); // return
		
		saveETMv4TraceJB.getUnits().addAll(bodyStmtList);
		saveETMv4TraceJB.getTraps().add(trap_0);
		
		System.out.println(saveETMv4TraceJB.toString());
    	
		return saveETMv4TraceSM;
	}
	
	// ---- generate auxiliary classes ---- //
	
	/* null */
	
	// ---- modify auxiliary fields ---- //
	
	/* null */
	
	// ---- modify auxiliary methods ---- //
	
	/* null */
	
	// ---- modify auxiliary classes ---- //
	
	/* null */
	
	private void customizeTraceReaderDTSL() {
		/*
		{
			SootClass TraceReaderDTSLSC = getSootClass("com.arm.debug.trace.decode.TraceReaderDTSLSource"); // "SC" refers to "SootClass"
	
			// TraceReaderDTSLSC should not be null
			for (SootMethod sm : TraceReaderDTSLSC.getMethods()) {
				System.out.println(sm.getSignature());
			}
		
			SootMethod tgtMethod = getSootMethod(TraceReaderDTSLSC, "int read()");
			System.out.println(tgtMethod.retrieveActiveBody());
		}
		*/
		
		// ---- generation ---- //
		
		// for fields
		// ...
		// for methods
		generateSaveETMv4TraceBytes();
		generateSaveETMv4Trace();
		// for classes
		// ...
		
		// ---- modification ---- //
		
		// for fields
		// ...
		// for methods
		// ...
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
