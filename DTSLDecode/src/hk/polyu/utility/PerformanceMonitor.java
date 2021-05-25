package hk.polyu.utility;

import java.lang.management.ManagementFactory;
import com.sun.management.OperatingSystemMXBean;

@SuppressWarnings("restriction")
public class PerformanceMonitor {
	
	public static long getAvailableMemory() {
		OperatingSystemMXBean memory = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
		return memory.getFreePhysicalMemorySize() / 1024 / 1024 / 1024;
	}
	
	public static void getMemInfo() {
		OperatingSystemMXBean memory = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
		System.out.println("Total RAM: " + memory.getFreePhysicalMemorySize() / 1024 / 1024 / 1024 + "G");
	}
	
}
