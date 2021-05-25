package hk.polyu.trace.decode;

import hk.polyu.trace.decode.ETMv4Decoder.AddressRegister;

public class ETMv4ReturnStack {
	
	private static int RETURN_STACK_SIZE = 16;
	private static int RETURN_STACK_SIZE_MASK = 0xf;
	private AddressRegister[] mReturnAddressStack;
	private int mReturnStackPointer;
	
	public ETMv4ReturnStack() {
		mReturnAddressStack = new AddressRegister[RETURN_STACK_SIZE];
		mReturnStackPointer = 0;
	}
	
	public void pushReturnAddress(AddressRegister address) {
		mReturnAddressStack[mReturnStackPointer] = address;
		mReturnStackPointer = (mReturnStackPointer + 1) & RETURN_STACK_SIZE_MASK;
	}
	
	public AddressRegister popReturnStack() {
		mReturnStackPointer = (mReturnStackPointer - 1) & RETURN_STACK_SIZE_MASK;
		AddressRegister address = mReturnAddressStack[mReturnStackPointer];
		mReturnAddressStack[mReturnStackPointer] = null;
		return address;
	}

}
