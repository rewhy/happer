package hk.polyu.trace.decode;

import java.util.ArrayList;
import java.util.Iterator;

public class BitPatternList {

	ArrayList<Entry> mList = new ArrayList<Entry>();
    
    public BitPatternList() {
        mList = new ArrayList<Entry>();
    }
    
    public void add(String pattern, int key) {
        mList.add(new Entry(pattern, key));
    }
    
    public void addAll(BitPatternList otherList) {
        Iterator<Entry> iterator = otherList.mList.iterator();
        while (iterator.hasNext()) {
            mList.add(iterator.next());
        }
    }
    
    public int findKey(int value) {
        for (Entry pattern : mList) {
            if (BitPattern.matches(value, pattern.mPattern)) {
                return pattern.mKey;
            }
        }
        return -1;
    }
    
    private static class Entry {
    	String mPattern;
    	int mKey;
        
    	public Entry(String pattern, int key) {
    		mPattern = pattern;
    		mKey = key;
    	}
	}
	
}
