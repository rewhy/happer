package hk.polyu.trace.analysis.unpack;

import java.util.Stack;

import hk.polyu.Configuration;
import hk.polyu.trace.decode.ETMv4Decoder.AddressRegister;
import hk.polyu.trace.resolver.ArtInstruction;
import hk.polyu.trace.resolver.ArtMethod;

public class InvocationChainBuilder {
	
	public static ArtMethod appMethod = new ArtMethod("AppMethod_Normal");
	
	public static AddressRegister preAddress= null;
	public static ArtMethod preAppCall = null;
	
	public static boolean isOverflow = false;
	public static Stack<ArtMethod> methodStack = new Stack<ArtMethod>();
	
	public static void handleArtMethodTracing(AddressRegister curAddress) {	
		if (curAddress == null) {
			isOverflow = true;
			// preAppCall = null;
			return;
		}
		
		ArtInstruction tgtInstruction = null;
		ArtMethod tgtMethod = null;
		
    	tgtInstruction = ArtInstruction.ArtInstructions.get(curAddress.getAddress());
    	if (tgtInstruction != null) {
    		tgtMethod = tgtInstruction.getArtMethod();
    		assert tgtMethod != null;
    	}
    		
    	// condition-1
   		if (tgtMethod != null && (curAddress.getAddress() - tgtMethod.getVirtualAddress()) == 0) {
   			if (Configuration.DEBUG)
   				System.out.print(" -> " + tgtMethod.getMethodSignature() + "\n");
   			
   			if (isOverflow == true)
   				isOverflow = false;
   			
   			methodStack.push(tgtMethod);
   			
			// debugging
			System.out.println("++++ ++++");
			System.out.println("[CALL] current -> " + tgtMethod.toString() + " at " + Long.toHexString(curAddress.getAddress()));
			System.out.println("");
			//
   			
   			if (preAddress == null) {
   				InvocationChainReporter.getSingleInstance().addInvocationRecord(tgtMethod);
   			} else {
   				assert preAddress != null;
   				
   				/* debugging mode, which records all invocations
   				InvocationChainReporter.getSingleInstance().addInvocationRecord(tgtMethod);
   				*/
   				
   				// special case - 1
   				if (preAppCall != null && preAddress.getAddress() == (Configuration.art_quick_invoke_stub_internal + Configuration.libart_start -Configuration.libart_file_offset + Configuration.libart_memory_offset)) {
   					if (preAppCall.toString().contains("JNI") && preAppCall.toString().contains("Call")) {
   						InvocationChainReporter.getSingleInstance().addInvocationRecord(tgtMethod);
   						preAppCall = null;
   					}
   					else if (preAppCall.toString().contains("JNI") && preAppCall.toString().contains("NewObject")) {
   						InvocationChainReporter.getSingleInstance().addInvocationRecord(tgtMethod);
   						preAppCall = null;
   					} else {
   						// TODO
   					}
   				}
   				//
   				
   				// special case - 2
   				if (methodStack.size() > 2) {
   					ArtMethod currentM = methodStack.pop();
   					ArtMethod pcurrentM = methodStack.pop();
   					ArtMethod ppcurrentM = methodStack.pop();
   					
   					if (pcurrentM.toString().contains("art_quick_resolution_trampoline") && ppcurrentM == appMethod) {
   						if (!tgtMethod.toString().contains("artQuickResolutionTrampoline"))
   							InvocationChainReporter.getSingleInstance().addInvocationRecord(tgtMethod);
   					}
   					
   					methodStack.push(ppcurrentM);
   					methodStack.push(pcurrentM);
   					methodStack.push(currentM);
   				}
   				//
   				
   				// normal case
   				if (isAppAddress(preAddress)) {
   					InvocationChainReporter.getSingleInstance().addInvocationRecord(tgtMethod);
   					preAppCall = tgtMethod;
   				}
   				
   				// 
   				if ((tgtMethod.toString().contains("libart") && tgtMethod.toString().contains("_ZN3art7DexFileC1EPKhjRKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEjPKNS_10OatDexFileE"))
   				// || (tgtMethod.toString().contains("Activity.") && tgtMethod.toString().contains("onCreate("))
   				// ||  (tgtMethod.toString().contains("libart") && tgtMethod.toString().contains("_ZN3art11ClassLinker10LoadMethodERKNS_7DexFileERKNS_21ClassDataItemIteratorENS_6HandleINS_6mirror5ClassEEEPNS_9ArtMethodE"))
   				) {
   					InvocationChainReporter.getSingleInstance().addInvocationRecord(tgtMethod);
   	   	   			System.out.println("**** ****");
   	   	   			for (ArtMethod method : methodStack)
   	   	   				System.out.println(method.toString());
   	   	   			System.out.println("");
   				}
   				//
   			}
   		}
   		
   		// condition-2
   		else if(tgtMethod != null && (curAddress.getAddress() - tgtMethod.getVirtualAddress()) != 0) {
   			if (Configuration.DEBUG)
   				System.out.print(" -> " + tgtMethod.getMethodSignature() + "\n");
   			
   			/* debugging mode, which records all branches
   			InvocationChainReporter.getSingleInstance().addBranchRecord(curAddress.getAddress());
   			*/
   			System.out.println("[NORM] current -> " + tgtMethod.toString() + " at " + Long.toHexString(curAddress.getAddress()));
   			
   			// handle Overflow condition
   			if (isOverflow) {
   				if (!methodStack.contains(tgtMethod)) {
   					methodStack.push(tgtMethod);
   				} else {
   					ArtMethod curMethod = methodStack.pop();
	   				while (curMethod != tgtMethod) {
	   					curMethod = methodStack.pop();
	   				}
	   				methodStack.push(tgtMethod);
   				}
   				
   				// debugging
   	   			System.out.println("oooo oooo");
   	   			System.out.println("[OVER] current -> " + tgtMethod.toString() + " at " + Long.toHexString(curAddress.getAddress()));
   	   			// for (ArtMethod method : methodStack)
   	   				// System.out.println(method.toString());
   	   			System.out.println("");
   	   			//
   	   			
   	   			isOverflow = false;
   			}
   			// 
   			else {
   				if (preAddress == null) {
   	   				assert methodStack.size() == 0;
   	   				
   	   				methodStack.push(tgtMethod);
   	   			} else {
   	   				assert methodStack.size() != 0;
   	   				
   	   				ArtMethod[] methodStackCopy = new ArtMethod[methodStack.size()];
   	   				methodStack.copyInto(methodStackCopy);
   	   				
   	   				boolean isHooking = false;
   	   				ArtMethod candidateHooking = null;
   	   				if (methodStack.contains(tgtMethod)) {
   	   					ArtMethod curMethod = methodStack.pop();
   	   					if (curMethod == appMethod)
   	   						isHooking = true;
   	   					
   	   					while (curMethod != tgtMethod) {
   	   						if (curMethod == appMethod) {
   	   							curMethod = methodStack.pop();
   	   							candidateHooking = curMethod;
   	   						} else {
   	   							curMethod = methodStack.pop();
   	   						}
   	   					}
   	   					methodStack.push(tgtMethod);
   	   				} else {
   	   					methodStack.clear();
   	   					methodStack.push(tgtMethod);
   	   					
   	   					// debugging
   	   		   			System.out.println("xxxx xxxx");
   	   		   			System.out.println("[ERR] current -> " + tgtMethod.toString());
   	   		   			// for (ArtMethod method : methodStack)
   	   		   				// System.out.println(method.toString());
   	   		   			System.out.println("");
   	   		   			//
   	   				}
   	   			
   	   				// hooking case
   	   				if (isLIBAddress(preAddress) && isHooking) {
   	   					assert candidateHooking != null;
   	   					
   	   					if (isHookAddress(candidateHooking.getVirtualAddress())) {
   	   						InvocationChainReporter.getSingleInstance().addHookRecord(candidateHooking);
   	   					
   	   						// debugging
   	   						System.out.println("**** ****");
   	   						System.out.println("[HOOK] current -> " + tgtMethod.toString());
   	   						System.out.println("[HOOK] candidate -> " + candidateHooking.toString());
   	   						for (ArtMethod method : methodStackCopy)
   	   							System.out.println(method.toString());
   	   						System.out.println("");
   	   						//
   	   					}
   	   				}
   	   			}
   			}
   		}
   		
   		// condition-3
   		else {
   			assert preAddress != null;
   			
   			if (Configuration.DEBUG)
   				System.out.print(" -> " + "unknown" + "\n");
    		
   			/* debugging mode, which records all branches
   			InvocationChainReporter.getSingleInstance().addBranchRecord(curAddress.getAddress());
   			*/
   			
   			if (isAppAddress(curAddress)) {
   				// debugging
   				System.out.println("???? ????");
   				System.out.println("[APP]  current -> " + appMethod.toString() + " at " + Long.toHexString(curAddress.getAddress()));
   				System.out.println("");
   				//
   				
   				InvocationChainReporter.getSingleInstance().addBranchRecord(calculateOffset(curAddress));
   				// preAppCall = null;
   				
   				if (methodStack.size() == 0) {
   					methodStack.push(appMethod);
   				} else {
   					if (!methodStack.contains(appMethod)) {
   	   					methodStack.push(appMethod);
   	   				} else {
   	   					ArtMethod curMethod = methodStack.pop();
   	   					if (curMethod == appMethod)
   	   						methodStack.push(curMethod);
   	   					else {
   	   						methodStack.push(curMethod);
   	   						methodStack.push(appMethod);
   	   					}
   	   				}
   				}
   			} else {
   				// debugging
   				System.out.println("???? ????");
   				System.out.println("[SYS]  current -> " + "SYSTEM_METHOD" + " at " + Long.toHexString(curAddress.getAddress()));
   				System.out.println("");
   				//
   			}
   		}
    	
    	// at last, update preAddress
		preAddress = curAddress;
	}
	
	public static Long[] OATStart	= {0xd3d0a000L, };
	public static Long[] OATSize 	= {0x0000d000L, };
	
	public static Long[] LIBStart	= {0xd3b8a000L, };
	public static Long[] LIBSize 	= {0x00070000L, }; 
	
	public static Long[] ANOStart	= {}; 
	public static Long[] ANOEnd 	= {};
	
	public static Long[] HOOKStart	= {};
	public static Long[] HOOKEnd	= {};

	
	public static boolean isOATAddress(AddressRegister address) {
		assert address != null;
		assert OATStart.length == OATSize.length;
		if (OATStart.length == 0)
			return false;
		
		for(int idx = 0; idx < OATStart.length; idx++) {
			if ((address.getAddress() - OATStart[idx]) >= 0 && 
				((OATStart[idx] + OATSize[idx]) - address.getAddress()) >= 0)
				return true;
		}
		return false;
	}
	public static boolean isLIBAddress(AddressRegister address) {
		assert address != null;
		assert LIBStart.length == LIBSize.length;
		if (LIBStart.length == 0)
			return false;
		
		for(int idx = 0; idx < LIBStart.length; idx++) {
			if ((address.getAddress() - LIBStart[idx]) >= 0 && 
				((LIBStart[idx] + LIBSize[idx]) - address.getAddress()) >= 0)
				return true;
		}
		return false;
	}
	public static boolean isANOAddress(AddressRegister address) {
		assert address != null;
		assert ANOStart.length == ANOEnd.length;
		if (ANOStart.length == 0)
			return false;
		
		for(int idx = 0; idx < ANOStart.length; idx++) {
			if ((address.getAddress() - ANOStart[idx]) >= 0 && 
				(ANOEnd[idx] - address.getAddress()) >= 0)
				return true;
		}
		return false;
	}
	public static boolean isAppAddress(AddressRegister address) {
		if (isOATAddress(address) || isLIBAddress(address) || isANOAddress(address))
			return true;
		else
			return false;
	}
	public static Long calculateOffset(AddressRegister address) {
		assert address != null;
		
		if (isOATAddress(address))
			return address.getAddress();
		else if (isLIBAddress(address)) {
			for(int idx = 0; idx < LIBStart.length; idx++) {
				if ((address.getAddress() - LIBStart[idx]) >= 0 && 
					((LIBStart[idx] + LIBSize[idx]) - address.getAddress()) >= 0)
					return address.getAddress() - LIBStart[idx];
			}
		}
		else if (isANOAddress(address))
			return address.getAddress();
		else {
			assert false;
			return null;
		}
		
		assert false;
		return null;
	}
	public static boolean isHookAddress(Long address) {
		assert address != null;
		assert HOOKStart.length == HOOKEnd.length;
		if (HOOKStart.length == 0)
			return false;
		
		for(int idx = 0; idx < HOOKStart.length; idx++) {
			if ((address - HOOKStart[idx]) >= 0 && 
				(HOOKEnd[idx] - address) >= 0)
				return true;
		}
		return false;
	}

}
