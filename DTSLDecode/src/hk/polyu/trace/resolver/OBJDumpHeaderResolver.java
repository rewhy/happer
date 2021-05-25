package hk.polyu.trace.resolver;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

/*
 * -- Notice --
 * From my view, "VMO" refers to "File Offset" and "FO" refers to "Virtual Memory Offset".
 */

public class OBJDumpHeaderResolver {
	
	public static HashMap<String, Long> OffsetSubtractionMap= new HashMap<String, Long>(); // file path -> (VMO - FO)
	
	private Long pltOffset = null;
	
	private Long textOffset = null;
	private Long textVirtualMemoryOffset = null;
	private Long textFileOffset = null;
	
	private Long gnutextOffset = null;
	
	public void setPltOffset(long offset) {
		pltOffset = offset;
	}
	public Long getPltOffset() {
		return pltOffset;
	}
	
	public void setTextOffset(long offset) {
		textOffset = offset;
	}
	public Long getTextOffset() {
		return textOffset;
	}
	public void setTextVirtualMemoryOffset(long offset) {
		textVirtualMemoryOffset = offset;
	}
	public Long getTextVirtualMemoryOffset() {
		return textVirtualMemoryOffset;
	}
	public void setTextFileOffset(long offset) {
		textFileOffset = offset;
	}
	public Long getTextFileOffset() {
		return textFileOffset;
	}
	
	public void setGNUTextOffset(long offset) {
		gnutextOffset = offset;
	}
	public Long getGNUTextOffset() {
		return gnutextOffset;
	}

	public void resolve(String path) {
		BufferedReader br = null;
		try {
			File objdumpHeaderFile = new File(path);
			br = new BufferedReader(new FileReader(objdumpHeaderFile));
			
			String line = null;
			while((line = br.readLine()) != null) {
				if (!line.trim().contains(" "))
					continue;
				
				String tag = line.trim().split(" ")[1];
				if (!tag.startsWith("."))
					continue;
				
				// Parsing .plt section.
				// Example: "10 .plt          00001500  0000000000015c58  0000000000015c58  00010c58  2**3"
				if (tag.equals(".plt")) {
					// System.out.println(line);
					
					String content = line.split(".plt")[1].trim();
					Long virtualMemoryOffset = Long.valueOf(content.split("  ")[1], 16);
					Long fileOffset = Long.valueOf(content.split("  ")[3], 16);
					
					pltOffset = virtualMemoryOffset - fileOffset;
				}
				
				// Parsing .text section.
				// Example: "11 .text         0001bd08  0000000000017158  0000000000017158  00012158  2**2"
				if (tag.equals(".text")) {
					// System.out.println(line);
					
					String content = line.split(".text")[1].trim();
					Long virtualMemoryOffset = Long.valueOf(content.split("  ")[1], 16);
					Long fileOffset = Long.valueOf(content.split("  ")[3], 16);
					
					textVirtualMemoryOffset = virtualMemoryOffset;
					textFileOffset = fileOffset;
					textOffset = virtualMemoryOffset - fileOffset;
				}
				
				// Parsing .gnu.text section.
				// Example: "7 .gnu.text     0000d978  00000000000868d0  00000000000868d0  000868d0  2**2"
				if (tag.equals(".gnu.text")) {
					// System.out.println(line);
					
					String content = line.split(".gnu.text")[1].trim();
					Long virtualMemoryOffset = Long.valueOf(content.split("  ")[1], 16);
					Long fileOffset = Long.valueOf(content.split("  ")[3], 16);
					
					gnutextOffset = virtualMemoryOffset - fileOffset;
				}
			}
			
			assert (pltOffset != null) || (textOffset != null) || (gnutextOffset != null);
			
			if (pltOffset != null && textOffset != null) {
				assert pltOffset.longValue() == textOffset.longValue();
			}
			if (pltOffset != null && gnutextOffset != null) {
				assert pltOffset.longValue() == gnutextOffset.longValue();
			}
			if (textOffset != null && gnutextOffset != null) {
				assert textOffset.longValue() == gnutextOffset.longValue();
			}
			if (pltOffset != null && textOffset != null && gnutextOffset != null) {
				assert pltOffset.longValue() == textOffset.longValue();
				assert pltOffset.longValue() == gnutextOffset.longValue();
				assert textOffset.longValue() == gnutextOffset.longValue();
			}
			
			Long offset = null;
			if (pltOffset != null)
				offset = pltOffset;
			else if (textOffset != null)
				offset = textOffset;
			else if (gnutextOffset != null)
				offset = gnutextOffset;
			
			// System.out.println(Long.toHexString(offset));
			OffsetSubtractionMap.put(path, offset);
		} catch(FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		} catch(IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
			} catch(IOException ioe) {
				ioe.printStackTrace();
			}
		}
	}
	
}
