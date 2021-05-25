# ArtQuickGenericJniEndTrampoline.py is used to ... when a jni method is invoked in 32-bit mode.

import gc
import os
import sys
import time

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import mmu
from DexParser import header_item, string_id_item, type_id_item, proto_id_item, method_id_item

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


def dump_libc_memory():
	file_path = os.path.join(config.workspace, config.libc_memory_directory, ("%s_%s_%s.bin" % ("libc", "ArtQuickGenericJniEndTrampoline", str(time.time()))))
	file_format = "binary"
	file_vtl_start_address = config.libc_executable_start
	file_vtl_end_address = config.libc_executable_end - 0x1
	memory.dump_library(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	
	
def dump_libart_memory():
	file_path = os.path.join(config.workspace, config.libart_memory_directory, ("%s_%s_%s.bin" % ("libart", "ArtQuickGenericJniEndTrampoline", str(time.time()))))
	file_format = "binary"
	file_vtl_start_address = config.libart_executable_start
	file_vtl_end_address = config.libart_executable_end - 0x1
	memory.dump_library(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	
	
def dump_dex_file():
	# dump the dex file
	dex_info_list = config.load_dex_info()
	for dex_file_base, dex_file_size, dex_file_name in dex_info_list:
		config.log_print("[JNI_onLoad] begin_ = %0#10x, size_ = %#x, location_ = %s" % (dex_file_base, dex_file_size, dex_file_name))
		file_path = os.path.join(config.workspace, config.dex_directory, dex_file_name)
		file_format = "binary"
		file_vtl_start_address = dex_file_base
		file_vtl_end_address = dex_file_base + dex_file_size - 0x1
		file_path = memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)


def ArtQuickGenericJniEndTrampoline():
	pid = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff
	config.log_print("[ArtQuickGenericJniEndTrampoline] pid = %#x" % pid)

	# # dump the executable segments of libc.so and libart.so
	# assert len(os.listdir(os.path.join(config.workspace, config.libc_memory_directory))) > 0
	# dump_libc_memory()
	# assert len(os.listdir(os.path.join(config.workspace, config.libart_memory_directory))) > 0
	# dump_libart_memory()
	
	# # dump the dex file
	# if len(os.listdir(os.path.join(config.workspace, config.dex_directory))) > 0:
		# dump_dex_file()
	
	# # continue the execution of the target application
	# execution_state.getExecutionService().resume()
	return


if __name__ == '__main__':
	ArtQuickGenericJniEndTrampoline()
	sys.exit()
