package hk.polyu.trace.resolver;

import java.util.ArrayList;
import java.util.HashMap;

public class ArtClass {
	// fake classes
	public static ArtClass AppClass = new ArtClass("AppClass");
	public static ArtClass SysClass = new ArtClass("SysClass");
	public static ArtClass UNKNOW = new ArtClass("Unknow");
	// initialize fake classes
	static {
		/* null */
	}
	
	public static HashMap<String, ArtClass> ArtClasses = new HashMap<String, ArtClass>(); // class name -> ArtClass
	
	private String mName;
	private ArrayList<ArtMethod> mMethods;
	
	public void setName(String name) {
		mName = name;
	}
	public String getName() {
		return mName;
	}
	
	public void setMethods(ArrayList<ArtMethod> list) {
		mMethods = list;
	}
	public ArrayList<ArtMethod> getMethods() {
		return mMethods;
	}
	
	public ArtClass(String name) {
		mName = name;
		mMethods = new ArrayList<ArtMethod>();
	}
	
	public boolean isConcrete() {
		if (this == AppClass || this == SysClass || this == UNKNOW)
			return false;
		else
			return true;
	}
	
	public boolean isApplication() {
		return this == AppClass;
	}
	
	public boolean isSystem() {
		return this == SysClass;
	}
	
	public boolean isUnknow() {
		return this == UNKNOW;
	}
	
	public String toString() {
		String name = String.format("Class Name -> %s", mName);
		return name;
	}
	
	public int compareTo(ArtClass another) {
        return mName.compareTo(another.getName());
    }
	
	public int hashCode() {
        return mName.hashCode();
    }
	
	public boolean equals(Object another) {
        if (another instanceof ArtClass) {
            return compareTo((ArtClass) another) == 0;
        }
        
        return super.equals(another);
    }
}
