from arm_ds.debugger_v1 import DebugException

import mmu
import physical_memory
import virtual_memory


def readMemory(vtl, size=1):
	try:
		return virtual_memory.readMemory(vtl, size)
	except DebugException:
		# return physical_memory.readMemory(vtl, size)
		raise RuntimeError("readMemory(vtl = %0#10x, size = %#x) fail" % (vtl, size))


def readMemory8(vtl):
	try:
		return virtual_memory.readMemory8(vtl)
	except DebugException:
		# return physical_memory.readMemory8(vtl)
		raise RuntimeError("readMemory8(vtl = %0#10x) fail" % vtl)


def readMemory16(vtl):
	try:
		return virtual_memory.readMemory16(vtl)
	except DebugException:
		# return physical_memory.readMemory16(vtl)
		raise RuntimeError("readMemory16(vtl = %0#10x) fail" % vtl)


def readMemory32(vtl):
	try:
		return virtual_memory.readMemory32(vtl)
	except DebugException:
		# return physical_memory.readMemory32(vtl)
		raise RuntimeError("readMemory32(vtl = %0#10x) fail" % vtl)


def readMemory64(vtl):
	try:
		return virtual_memory.readMemory64(vtl)
	except DebugException:
		# return physical_memory.readMemory64(vtl)
		raise RuntimeError("readMemory64(vtl = %0#10x) fail" % vtl)
		
		
def read(vtl, size):
	try:
		return virtual_memory.read(vtl, size)
	except DebugException:
		# TODO
		raise RuntimeError("read(vtl = %0#10x, size = %#x)" % (vtl, size))


def retrieve_char_array(vtl):
	try:
		return virtual_memory.retrieve_char_array(vtl)
	except DebugException:
		# return physical_memory.retrieve_char_array(vtl)
		raise RuntimeError("retrieve_char_array(vtl = %0#10x) fail" % vtl)


def retrieve_byte_array(vtl, size):
	try:
		return virtual_memory.retrieve_byte_array(vtl, size)
	except DebugException:
		# return physical_memory.retrieve_byte_array(vtl, size)
		raise RuntimeError("retrieve_byte_array(vtl = %0#10x, size = %#x)" % (vtl, size))
		

# for dumping DexFile
def dump(file, format, vtl_start_address, vtl_end_address):
	try:
		file_path = virtual_memory.dump(file, format, vtl_start_address, vtl_end_address)
		return file_path
	except DebugException:
		# TODO
		raise RuntimeError("dump(file = %s, format = %s, vtl_start_address = %0#10x, vtl_end_address = %0#10x)" % (file, format, vtl_start_address, vtl_end_address))
		

# for dump native library
def dump_library(file, format, vtl_start_address, vtl_end_address):
	try:
		virtual_memory.dump_library(file, format, vtl_start_address, vtl_end_address)
	except DebugException:
		# TODO
		raise RuntimeError("dump_library(file = %s, format = %s, vtl_start_address = %0#10x, vtl_end_address = %0#10x)" % (file, format, vtl_start_address, vtl_end_address))
	
