package hk.polyu.trace.decode;

public enum TraceExceptionNonMClassETMv4 implements ITraceException {

	PE_RESET("PE_RESET", 0), 
    DEBUG_HALT("DEBUG_HALT", 1), 
    CALL("CALL", 2), 
    TRAP("TRAP", 3), 
    SYSTEM_ERROR("SYSTEM_ERROR", 4), 
    RESERVED_0("RESERVED_0", 5), 
    INSTRUCTION_DEBUG("INSTRUCTION_DEBUG", 6), 
    DATA_DEBUG("DATA_DEBUG", 7), 
    RESERVED_1("RESERVED_1", 8), 
    RESERVED_2("RESERVED_2", 9), 
    ALIGNMENT("ALIGNMENT", 10), 
    INSTRUCTION_FAULT("INSTRUCTION_FAULT", 11), 
    DATA_FAULT("DATA_FAULT", 12), 
    RESERVED_3("RESERVED_3", 13), 
    IRQ("IRQ", 14), 
    FIQ("FIQ", 15);
    
    private static int EXECPTION_NUMBER_COUNT = 32;
    private static int IMPLEMENTATION_DEFINED = 16;
    private static int IMPLEMENTATION_DEFINED_END = 23;
    private static ITraceException[] sCache;
    
    static {
    	sCache = new ITraceException[32];
    }
    
    private TraceExceptionNonMClassETMv4(String name, int number) {}
    
    @Override
    public String getTitle() {
        return name();
    }
    
    @Override
    public int getNumber() {
        return ordinal();
    }
    
    private static ITraceException make(int exceptionNumber) {
        TraceExceptionNonMClassETMv4[] values = values();
        
        if (exceptionNumber < values.length)
            return values[exceptionNumber];
        
        if (exceptionNumber >= IMPLEMENTATION_DEFINED && exceptionNumber <= IMPLEMENTATION_DEFINED_END)
            return new GenericTraceException("IMPLEMENTATION_DEFINED_" + exceptionNumber, exceptionNumber);
        
        return new GenericTraceException("RESERVED_" + exceptionNumber, exceptionNumber);
    }
    
    public static ITraceException get(int exceptionNumber) {
        if (exceptionNumber < 0 || exceptionNumber >= EXECPTION_NUMBER_COUNT)
            return null;
        
        ITraceException e = TraceExceptionNonMClassETMv4.sCache[exceptionNumber];
        if (e == null) {
            e = make(exceptionNumber);
            TraceExceptionNonMClassETMv4.sCache[exceptionNumber] = e;
        }
        return e;
    }
	
}
