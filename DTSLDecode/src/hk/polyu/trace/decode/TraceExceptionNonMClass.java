package hk.polyu.trace.decode;

public enum TraceExceptionNonMClass implements ITraceException {
	
	NO_EXCEPTION("NO_EXCEPTION", 0), 
    HALTEXCP("HALTEXCP", 1), 
    SECURE_MONITOR_CALL("SECURE_MONITOR_CALL", 2), 
    HYPERVISOR_ENTRY("HYPERVISOR_ENTRY", 3), 
    ASYNCHRONOUS_DATA_ABORT("ASYNCHRONOUS_DATA_ABORT", 4), 
    JAZELLE_OR_THUMBEE("JAZELLE_OR_THUMBEE", 5), 
    RESERVED_6("RESERVED_6", 6), 
    RESERVED_7("RESERVED_7", 7), 
    PROCESSOR_RESET("PROCESSOR_RESET", 8), 
    UNDEFINED_INSTRUCTION("UNDEFINED_INSTRUCTION", 9), 
    SUPERVISOR_CALL("SUPERVISOR_CALL", 10), 
    PREFETCH_ABORT("PREFETCH_ABORT", 11), 
    SYNCHRONOUS_DATA_ABORT("SYNCHRONOUS_DATA_ABORT", 12), 
    IMPRECISE("IMPRECISE", 13), 
    IRQ("IRQ", 14), 
    FIQ("FIQ", 15);
    
    private TraceExceptionNonMClass(String name, int number) {}
    
    @Override
    public String getTitle() {
        return name();
    }
    
    @Override
    public int getNumber() {
        return ordinal();
    }
    
    public static ITraceException get(int exceptionNumber) {
        TraceExceptionNonMClass[] values = values();
        
        if (exceptionNumber < 0 || exceptionNumber >= values.length)
            return null;
        
        return values[exceptionNumber];
    }

}
