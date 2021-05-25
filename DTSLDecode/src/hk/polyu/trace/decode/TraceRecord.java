package hk.polyu.trace.decode;

import java.util.ArrayList;

import hk.polyu.trace.resolver.ArtMethod;

public abstract class TraceRecord {
	
	public abstract String getText();
    
    public ArtMethodRecord getArtMethodRecord() {
        return null;
    }
    
    public ArtInstructionRecord getArtInstructionRecord() {
        return null;
    }
    
    public boolean isArtMethod() {
        return false;
    }
    
    public boolean isArtInstruction() {
        return false;
    }
    
    public ArtMethod getArtMethod() {
        return null;
    }
    
    public Long getVirtualAddress() {
        return null;
    }
    
    public static ArtMethodRecord getFirstArtMethodRecord(ArrayList<TraceRecord> records, boolean mustHaveGoodAddress, boolean mustHaveIndex) {
        for (TraceRecord record : records) {
            ArtMethodRecord artMethodRecord = record.getArtMethodRecord();
            if (goodRecord(artMethodRecord, mustHaveGoodAddress, mustHaveIndex)) {
                return artMethodRecord;
            }
        }
        
        return null;
    }
    
    public static ArtMethodRecord getLastArtMethodRecord(ArrayList<TraceRecord> list, boolean mustHaveIndex) {
        for (int i = list.size() - 1; i >= 0; i--) {
            TraceRecord record = list.get(i);
            ArtMethodRecord artMethodRecord = record.getArtMethodRecord();
            if (goodRecord(artMethodRecord, false, mustHaveIndex)) {
                return artMethodRecord;
            }
        }
        
        return null;
    }
    
    private static boolean goodRecord(TraceRecord record, boolean mustHaveGoodAddress, boolean mustHaveIndex) {
        if (record == null) {
            return false;
        }
        
        if (mustHaveGoodAddress) {
            Long address = record.getVirtualAddress();
            if (address == null) {
                return false;
            }
        }
        
        return !mustHaveIndex || record.hasIndex();
    }
    
    public static ArtInstructionRecord getFirstArtInstructionRecord(ArrayList<TraceRecord> records, boolean mustHaveGoodAddress, boolean mustHaveIndex) {
        for (TraceRecord record : records) {
            ArtInstructionRecord artInstructionRecord = record.getArtInstructionRecord();
            if (goodRecord(artInstructionRecord, mustHaveGoodAddress, mustHaveIndex)) {
                return artInstructionRecord;
            }
        }
        
        return null;
    }
    
    public static ArtInstructionRecord getLastArtInstructionRecord(ArrayList<TraceRecord> records) {
        for (int i = records.size() - 1; i >= 0; --i) {
            TraceRecord record = records.get(i);
            ArtInstructionRecord artInstructionRecord = record.getArtInstructionRecord();
            if (goodRecord(artInstructionRecord, false, true)) {
                return artInstructionRecord;
            }
        }
        
        return null;
    }
    
    public static ArtMethodRecord getClosestArtMethodRecord(ArrayList<TraceRecord> records, int targetIndex) {
        return getLastArtMethodRecord((ArrayList<TraceRecord>) records.subList(0, targetIndex + 1), false);
    }
    
    public boolean isDuplicate(TraceRecord other, boolean remove) {
        return false;
    }
    
    public abstract boolean hasIndex();
    
    public int getIndex() {
        return 0;
    }
    
    public abstract String copyText();

}
