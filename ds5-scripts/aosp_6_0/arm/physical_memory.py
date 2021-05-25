import struct

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import mmu

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()

page_size = 0x1000  # 2^12b= 4kb


def bytearray_to_string(byte_array):
	bytes = ""
	for b in byte_array:
		bytes = bytes + chr(int(b) & 0xff)
	return bytes


def readMemory(vtl, size=1):
	assert mmu.memory_map is not None
	assert mmu.data_cache is not None
	
	phy_start_address = mmu.translate_vtl_to_phy_coarse_grained(vtl)
	raw_data = execution_state.getMemoryService().read("NP:" + str(hex(phy_start_address)).replace('L', ''), page_size)
	
	# uses data cache to update the data in the physical memory
	for cache_address, cache_bytes in mmu.data_cache.iteritems():
		if cache_address >= phy_start_address and cache_address <= (phy_start_address + page_size - (0x4 * 0x10)):
			if cache_address == phy_start_address:
				left_part = bytearray(cache_bytes)
				right_part = bytearray(raw_data[len(left_part):])
				raw_data = left_part
				raw_data.extend(right_part)
			else:
				left_part = bytearray(raw_data[:(cache_address - phy_start_address)])
				middle_part = bytearray(cache_bytes)
				right_part = bytearray(raw_data[(cache_address - phy_start_address + len(middle_part)):])
				raw_data = left_part
				raw_data.extend(middle_part)
				raw_data.extend(right_part)
	
	base_idx = vtl % page_size
	if size == 0x1:
		return struct.unpack('<B', bytearray_to_string(raw_data[base_idx:(base_idx + 0x1)]))[0]
	elif size == 0x2:
		return struct.unpack('<H', bytearray_to_string(raw_data[base_idx:(base_idx + 0x2)]))[0]
	elif size == 0x4:
		return struct.unpack('<I', bytearray_to_string(raw_data[base_idx:(base_idx + 0x4)]))[0]
	elif size == 0x8:
		return struct.unpack('<L', bytearray_to_string(raw_data[base_idx:(base_idx + 0x8)]))[0]
	else:
		raise RuntimeError("unsupported readMemory(vtl = %0#10x, size = %#x)" % (vtl, size))
		
		
def readMemory8(vtl):
	return readMemory(vtl, size=(8/8), force_update=force_update)
	
	
def readMemory16(vtl):
	return readMemory(vtl, size=(16/8), force_update=force_update)
	

def readMemory32(vtl):
	return readMemory(vtl, size=(32/8), force_update=force_update)
	
	
def readMemory64(vtl):
	return readMemory(vtl, size=(64/8), force_update=force_update)
	
	
def read(vtl, size):
	# TODO
	pass
				

# char array -> string				
def retrieve_char_array(vtl):
	assert mmu.memory_map is not None
	assert mmu.data_cache is not None
	
	phy_start_address = mmu.translate_vtl_to_phy_coarse_grained(vtl)
	raw_data = execution_state.getMemoryService().read("NP:" + str(hex(phy_start_address)).replace('L', ''), page_size)
	
	# uses data cache to update the data in the physical memory
	for cache_address, cache_bytes in mmu.data_cache.iteritems():
		if cache_address >= phy_start_address and cache_address <= (phy_start_address + page_size - (0x4 * 0x10)):
			if cache_address == phy_start_address:
				left_part = bytearray(cache_bytes)
				right_part = bytearray(raw_data[len(left_part):])
				raw_data = left_part
				raw_data.extend(right_part)
			else:
				left_part = bytearray(raw_data[:(cache_address - phy_start_address)])
				middle_part = bytearray(cache_bytes)
				right_part = bytearray(raw_data[(cache_address - phy_start_address + len(middle_part)):])
				raw_data = left_part
				raw_data.extend(middle_part)
				raw_data.extend(right_part)
				
	char_array = ""
	char_idx = vtl % aligned_page_size
	single_char = raw_data[char_idx]
	while (int(single_char) != 0) and (char_idx < aligned_page_size):
		# print hex(single_char)
		char_array = char_array + chr(single_char)
		char_idx = char_idx + 1
		single_char = raw_data[char_idx]
	
	return char_array
	

# byte array -> raw data
def retrieve_byte_array(vtl, size):
	assert mmu.memory_map is not None
	assert mmu.data_cache is not None
	
	phy_start_address = mmu.translate_vtl_to_phy_coarse_grained(vtl)
	raw_data = execution_state.getMemoryService().read("NP:" + str(hex(phy_start_address)).replace('L', ''), page_size)
	
	# uses data cache to update the data in the physical memory
	for cache_address, cache_bytes in mmu.data_cache.iteritems():
		if cache_address >= phy_start_address and cache_address <= (phy_start_address + page_size - (0x4 * 0x10)):
			if cache_address == phy_start_address:
				left_part = bytearray(cache_bytes)
				right_part = bytearray(raw_data[len(left_part):])
				raw_data = left_part
				raw_data.extend(right_part)
			else:
				left_part = bytearray(raw_data[:(cache_address - phy_start_address)])
				middle_part = bytearray(cache_bytes)
				right_part = bytearray(raw_data[(cache_address - phy_start_address + len(middle_part)):])
				raw_data = left_part
				raw_data.extend(middle_part)
				raw_data.extend(right_part)
					
	byte_array = []
	byte_idx = vtl % aligned_page_size
	single_byte = raw_data[byte_idx]
	while (byte_idx < aligned_page_size) and ((byte_idx - (vtl % aligned_page_size)) < size):
		# print hex(single_byte)
		byte_array.append(single_byte)
		byte_idx = byte_idx + 1
		single_byte = raw_data[byte_idx]
		
	return byte_array
	
	
def dump(file, format, vtl_start_address, vtl_end_address):
	# TODO
	pass
