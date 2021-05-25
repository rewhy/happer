import os

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import mmu
from plugin import force_loading

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def readMemory8(vtl):
	ret = None
	while True:
		try:
			ret = int(execution_state.getMemoryService().readMemory8(vtl)) & 0xff
			break  # jump out of the while-loop
		except DebugException:
			mmu.init_page_table()
			force_loading.force_loading(vtl, 8)
	assert ret is not None
	return ret


def readMemory16(vtl):
	ret = None
	while True:
		try:
			ret = int(execution_state.getMemoryService().readMemory16(vtl)) & 0xffff
			break  # jump out of the while-loop
		except DebugException:
			mmu.init_page_table()
			force_loading.force_loading(vtl, 16)
	assert ret is not None
	return ret


def readMemory32(vtl):
	ret = None
	while True:
		try:
			ret = int(execution_state.getMemoryService().readMemory32(vtl)) & 0xffffffff
			break  # jump out of the while-loop
		except DebugException:
			mmu.init_page_table()
			force_loading.force_loading(vtl, 32)
	assert ret is not None
	return ret


def readMemory64(vtl):
	ret = None
	while True:
		try:
			ret = long(execution_state.getMemoryService().readMemory64(vtl)) & 0xffffffffffffffffL
			break  # jump out of the while-loop
		except DebugException:
			mmu.init_page_table()
			force_loading.force_loading(vtl, 32)
	assert ret is not None
	return ret


def readMemory(vtl, size=1):
	if size == 0x1:
		readMemory8(vtl)
	elif size == 0x2:
		readMemory16(vtl)
	elif size == 0x4:
		readMemory32(vtl)
	elif size == 0x8:
		readMemory64(vtl)
	else:
		raise RuntimeError("unsupported readMemory(vtl = %0#10x, size = %#x)" % (vtl, size))


def read(vtl, size):
	ret = None
	while True:
		try:
			ret = execution_state.getMemoryService().read(vtl, size)
			break  # jump out of the while-loop
		except DebugException:
			mmu.init_page_table()
			force_loading.force_loading(vtl, size)
	assert ret is not None
	return ret
			

def dump(file, format, vtl_start_address, vtl_end_address):
	file_path = file
	suffix = 0
	while os.path.exists(file_path):
		file_path = file + (".%#x" % suffix)
		suffix = suffix + 1
	
	while True:
		try:
			execution_state.getMemoryService().dump(file_path, format, vtl_start_address, vtl_end_address)
			break  # jump out of the while-loop
		except DebugException, e:
			mmu.init_page_table()
			force_loading.force_loading(vtl_start_address, (vtl_end_address - vtl_start_address) + 0x1)
			
	return file_path
					

page_size = 0x1000					
def dump_library(file, format, vtl_start_address, vtl_end_address):
	# we split the entire library file into several 4k memory pages and dump them respectively to form the entire in-memory file
	file_size = vtl_end_address - vtl_start_address + 0x1
	file_fragment_cnt = file_size / page_size
	for file_fragment_idx in range(file_fragment_cnt):
		cur_vtl_start_address = vtl_start_address + file_fragment_idx * page_size
		cur_vtl_end_address = cur_vtl_start_address + page_size - 0x1
		if file_fragment_idx == 0:
			while True:
				try:
					execution_state.getMemoryService().dump(file, format, cur_vtl_start_address, cur_vtl_end_address)
					break  # jump out of the while-loop
				except DebugException, e:
					mmu.init_page_table()
					force_loading.force_loading(cur_vtl_start_address, (cur_vtl_end_address - cur_vtl_start_address) + 0x1)
		else:
			while True:
				try:
					execution_state.getMemoryService().append(file, format, cur_vtl_start_address, cur_vtl_end_address)
					break  # jump out of the while-loop
				except DebugException, e:
					mmu.init_page_table()
					force_loading.force_loading(cur_vtl_start_address, (cur_vtl_end_address - cur_vtl_start_address) + 0x1)
	file_size_remaining = file_size - file_fragment_cnt * page_size
	if file_size_remaining > 0:
		cur_vtl_start_address = vtl_start_address + file_fragment_cnt * page_size
		cur_vtl_end_address = vtl_end_address
		if file_fragment_cnt == 0:
			while True:
				try:
					execution_state.getMemoryService().dump(file, format, cur_vtl_start_address, cur_vtl_end_address)
					break  # jump out of the while-loop
				except DebugException, e:
					mmu.init_page_table()
					force_loading.force_loading(cur_vtl_start_address, (cur_vtl_end_address - cur_vtl_start_address) + 0x1)
		else:
			while True:
				try:
					execution_state.getMemoryService().append(file, format, cur_vtl_start_address, cur_vtl_end_address)
					break  # jump out of the while-loop
				except DebugException, e:
					mmu.init_page_table()
					force_loading.force_loading(cur_vtl_start_address, (cur_vtl_end_address - cur_vtl_start_address) + 0x1)


# char array -> string
def retrieve_char_array(vtl):
	char_array = ""
	char_offset = vtl
	single_char = readMemory8(char_offset)
	while(int(single_char) != 0):
		char_array = char_array + chr(single_char)
		char_offset = char_offset + 1
		single_char = readMemory8(char_offset)
		
	return char_array


# byte array -> raw data
def retrieve_byte_array(vtl, size):
	byte_array = []
	byte_offset = vtl
	single_byte = readMemory8(byte_offset)
	while (byte_offset - vtl) < size:
		byte_array.append(single_byte)
		byte_offset = byte_offset + 1
		single_byte = readMemory8(byte_offset)
		
	return byte_array
