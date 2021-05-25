# JNI_onLoad.py is used to ... when the JNI_onLoad method is invoked in 32-bit mode.

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


def dump_libart_memory():
	file_path = os.path.join(config.workspace, config.libart_memory_directory, ("%s_%s_%s.bin" % ("libart", "JNI_onLoad", str(time.time()))))
	file_format = "binary"
	file_vtl_start_address = config.libart_executable_start
	file_vtl_end_address = config.libart_executable_end - 0x1
	memory.dump_library(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	
	
def dump_libc_memory():
	file_path = os.path.join(config.workspace, config.libc_memory_directory, ("%s_%s_%s.bin" % ("libc", "JNI_onLoad", str(time.time()))))
	file_format = "binary"
	file_vtl_start_address = config.libc_executable_start
	file_vtl_end_address = config.libc_executable_end - 0x1
	memory.dump_library(file_path, file_format, file_vtl_start_address, file_vtl_end_address)


def dump_liblog_memory():
	file_path = os.path.join(config.workspace, config.liblog_memory_directory, ("%s_%s_%s.bin" % ("liblog", "JNI_onLoad", str(time.time()))))
	file_format = "binary"
	file_vtl_start_address = config.liblog_executable_start
	file_vtl_end_address = config.liblog_executable_end - 0x1
	memory.dump_library(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	
	
def onLoad():
	# for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		# brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# # disable strcmp
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_strcmp:
			# brk_object.disable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_strncmp:
			# brk_object.disable()

	jni_version = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	config.log_print("[JNI_onLoad] return = %#x" % jni_version)
	
	# # dump the executable segments of libc.so and libart.so
	# assert len(os.listdir(os.path.join(config.workspace, config.libart_memory_directory))) > 0
	# dump_libart_memory()
	# assert len(os.listdir(os.path.join(config.workspace, config.libc_memory_directory))) > 0
	# dump_libc_memory()
	# assert len(os.listdir(os.path.join(config.workspace, config.liblog_memory_directory))) > 0
	# dump_liblog_memory()
	
	# # stop tracing
	# if config.trace:
		# trace_cmd = "trace stop DSTREAM"
		# execution_state.executeDSCommand(trace_cmd)
		
	# -4-
	# # dump the in-memory library
	# try:
		# file_path = os.path.join(config.workspace, config.library_directory, "libbangcle.so")
		# file_format = "binary"
		# file_vtl_start_address = 0xce4c2000
		# file_vtl_end_address = 0xce4c2000 + 0x54e24 - 0x1
		# memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	# except Exception, e:
		# print e
	
	# continue the execution of the target application
	# execution_state.getExecutionService().resume()
	return


if __name__ == '__main__':
	onLoad()
	sys.exit()
