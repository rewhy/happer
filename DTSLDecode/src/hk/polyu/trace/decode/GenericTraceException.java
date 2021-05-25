package hk.polyu.trace.decode;

public class GenericTraceException implements ITraceException {
	
	private String mTitle;
    private int mNumber;
    
    public GenericTraceException(String title, int number) {
        mTitle = title;
        mNumber = number;
    }
    
    @Override
    public String getTitle() {
        return mTitle;
    }
    
    @Override
    public int getNumber() {
        return mNumber;
    }
    
}
