# DexFile.py is used to dump the dex file when the "DexFile::<init>" method is invoked in 32-bit mode.

import gc
import os
import sys

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import mmu
from DexParser import header_item

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def retrieve_string_value(string_ptr):
	length_val = memory.readMemory32(string_ptr + config.offset_string_length)
	reference_ptr = memory.readMemory32(string_ptr + config.offset_string_reference)
	char_array = memory.retrieve_char_array(reference_ptr)
	
	return char_array
	
	
def cleanup():
	if mmu.page_table is not None:
		del mmu.page_table
		gc.collect()


def DexFile():
	# get the pointer that refers to the DexFile structure
	dex_file_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	
	# read the "begin_" field
	dex_file_begin_val = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
		
	# read the "size_" field
	dex_file_size_val = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	
	# read the "location_" field
	dex_file_location_ptr = int(execution_state.getRegisterService().getValue("R3")) & 0xffffffff
	# retrieve the value of the std::string structure
	dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
	
	if config.debug:
		print "[DexFile] begin_ = %0#10x" % dex_file_begin_val
		print "[DexFile] size_ = %#x" % dex_file_size_val
		print "[DexFile] location_ = %s" % dex_file_location_string_val
		
	# we only focus on the DexFile whose location is suspicious
	if not config.package_filter(dex_file_location_string_val):
		# continue the execution of the target application
		# execution_state.getExecutionService().resume()
		cleanup()
		return
		
	config.log_print("[DexFile] begin_ = %0#10x, size_ = %#x, location_ = %s" % (dex_file_begin_val, dex_file_size_val, dex_file_location_string_val))
	
	# dump the in-memory DexFile
	file_path = os.path.join(config.workspace, config.dex_directory, dex_file_location_string_val.split("/")[-1])
	file_format = "binary"
	file_vtl_start_address = dex_file_begin_val
	file_vtl_end_address = dex_file_begin_val + dex_file_size_val - 0x1
	memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
		
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	DexFile()
	sys.exit()
