package hk.polyu.trace.resolver;

/*
 * -- Notice --
 * MemoryBlock abstracts a memory chunk with its start address and end address.
 * MemoryBlock is resolved from the memory map file (i.e., /proc/pid/maps).
 * Each MemoryBlock instance is initialized by MemoryMapResolver.
 */

public class MemoryBlock {
	
	private long mStart;
	private long mEnd;
	
	private boolean mReadable;
	private boolean mWritable;
	private boolean mExecutable;
	
	private String mFileName;
	
	// indicate the owner of the memory block
	public MemoryBlockOwner mOwner;
	public enum MemoryBlockOwner {
		App, Sys, Unknow
	}
	
	public MemoryBlock(long start, long end, boolean readable, boolean writable, boolean executable, String fileName) {
		mStart = start;
		mEnd = end;
		
		mReadable = readable;
		mWritable = writable;
		mExecutable = executable;
		
		mFileName = fileName;
		
		mOwner = MemoryBlockOwner.Unknow; // we set the owner of the memory block to "unknow" by default
	}
	
	public void setStartAddress(long start) {
		mStart = start;
	}
	public long getStartAddress() {
		return mStart;
	}
	
	public void setEndAddress(long end) {
		mEnd = end;
	}
	public long getEndAddress() {
		return mEnd;
	}
	
	public void setReadable(boolean readable) {
		mReadable = readable;
	}
	public boolean isReadable() {
		return mReadable;
	}
	
	public void setWritable(boolean writable) {
		mWritable = writable;
	}
	public boolean isWritable() {
		return mWritable;
	}
	
	public void setExecutable(boolean executable) {
		mExecutable = executable;
	}
	public boolean isExecutable() {
		return mExecutable;
	}
	
	public void setFileName(String fileName) {
		mFileName = fileName;
	}
	public String getFileName() {
		return mFileName;
	}
	
	public void setOwner(MemoryBlockOwner owner) {
		mOwner = owner;
	}
	public MemoryBlockOwner getOwner() {
		return mOwner;
	}
	
	public String toString() {
		String start = String.format("start: 0x%016x", mStart);
		String end = String.format("end: 0x%016x", mEnd);
		String property = String.format("property: %s%s%s", isReadable() ? "r" : "-", isWritable() ? "w" : "-", isExecutable() ? "x" : "-");
		String name = String.format("name: %s", mFileName);
		String owner = String.format("owner: %s", "unknow"); // by default
		if (mOwner == MemoryBlockOwner.App)
			owner = String.format("owner: %s", "app");
		if (mOwner == MemoryBlockOwner.Sys)
			owner = String.format("owner: %s", "sys");
		
		return start + " " + end + " " + property + " " + name + " " + owner;
	}
	
	public int compareTo(MemoryBlock another) {
        return toString().compareTo(another.toString());
    }
	
	public int hashCode() {
        return toString().hashCode();
    }
	
	public boolean equals(Object another) {
        if (another instanceof MemoryBlock) {
            return compareTo((MemoryBlock) another) == 0;
        }
        
        return super.equals(another);
    }

}
