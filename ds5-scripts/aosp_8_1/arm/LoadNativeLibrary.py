# LoadNativeLibrary.py is used to ... when the "JavaVMExt::LoadNativeLibrary(...)" method is invoked in 32-bit mode.

import os
import sys
import time

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def retrieve_string_value(string_ptr):
	length_val = memory.readMemory32(string_ptr + config.offset_string_length)
	reference_ptr = memory.readMemory32(string_ptr + config.offset_string_reference)
	char_array = memory.retrieve_char_array(reference_ptr)
	
	return char_array
	
	
def dump_libart_memory():
	file_path = os.path.join(config.workspace, config.libart_memory_directory, ("%s_%s_%s.bin" % ("libart", "LoadNativeLibrary", str(time.time()))))
	file_format = "binary"
	file_vtl_start_address = config.libart_executable_start
	file_vtl_end_address = config.libart_executable_end - 0x1
	memory.dump_library(file_path, file_format, file_vtl_start_address, file_vtl_end_address)

	
def dump_libc_memory():
	file_path = os.path.join(config.workspace, config.libc_memory_directory, ("%s_%s_%s.bin" % ("libc", "LoadNativeLibrary", str(time.time()))))
	file_format = "binary"
	file_vtl_start_address = config.libc_executable_start
	file_vtl_end_address = config.libc_executable_end - 0x1
	memory.dump_library(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	
	
def dump_liblog_memory():
	file_path = os.path.join(config.workspace, config.liblog_memory_directory, ("%s_%s_%s.bin" % ("liblog", "LoadNativeLibrary", str(time.time()))))
	file_format = "binary"
	file_vtl_start_address = config.liblog_executable_start
	file_vtl_end_address = config.liblog_executable_end - 0x1
	memory.dump_library(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	

def LoadNativeLibrary():
	# for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		# brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# # enable strcmp
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_strcmp:
			# brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_strncmp:
			# brk_object.enable()

	# read the "path" parameter
	path_ptr = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	# retrieve the value of the std::string structure
	path_string_val = retrieve_string_value(path_ptr)
	config.log_print("[LoadNativeLibrary] path = %s" % path_string_val)
	
	# # dump the (origin) executable segments of libc.so and libart.so
	# if len(os.listdir(os.path.join(config.workspace, config.libart_memory_directory))) == 0:
		# dump_libart_memory()
	# if len(os.listdir(os.path.join(config.workspace, config.libc_memory_directory))) == 0:
		# dump_libc_memory()
	# if len(os.listdir(os.path.join(config.workspace, config.liblog_memory_directory))) == 0:
		# dump_liblog_memory()
	
	# # start tracing
	# if config.trace:
		# trace_cmd = "trace start DSTREAM"
		# execution_state.executeDSCommand(trace_cmd)
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	return


if __name__ == '__main__':
	LoadNativeLibrary()
	sys.exit()
