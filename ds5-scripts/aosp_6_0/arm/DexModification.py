# DexModification.py is used to ... when the JNI_onLoad method is invoked in 32-bit mode.

import os
import sys
import time

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
from DexParser import encoded_catch_handler_list
from OfflineDexParser import Dex

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def dump_dex_memory(dex_file_base, dex_file_size, dex_file_name):
	file_path = os.path.join(config.workspace, config.dex_directory, dex_file_name)
	file_format = "binary"
	file_vtl_start_address = dex_file_base
	file_vtl_end_address = dex_file_base + dex_file_size - 0x1
	file_path = memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	
	while not os.path.exists(file_path):
		time.sleep(1)
	
	dex = Dex.Dex(file_path)
	for class_def_item in dex.class_defs.class_def_items:
		class_data_item = class_def_item.class_data_item
		# direct_method
		method_idx = None
		for direct_method in class_data_item.direct_methods:
			method_idx_diff = direct_method.method_idx_diff
			if method_idx is None:
				method_idx = method_idx_diff
			else:
				method_idx = method_idx + method_idx_diff
				
			code_off = direct_method.code_off
			if (code_off > dex_file_size) or (code_off < 0):
				# dump the code_item on-demand
				tries_size_off = ((dex_file_base + code_off) & 0xffffffff) + config.offset_DexFile_CodeItem_tries_size_
				tries_size_val = memory.readMemory16(tries_size_off)
				code_item_insns_size_in_code_units_off = ((dex_file_base + code_off) & 0xffffffff) + config.offset_DexFile_CodeItem_insns_size_in_code_units_
				code_item_insns_size_in_code_units_val = memory.readMemory32(code_item_insns_size_in_code_units_off)
				padding = 0x2 if (tries_size_val > 0) and (code_item_insns_size_in_code_units_val % 2 == 1) else 0x0
				code_item_size = config.offset_DexFile_CodeItem_insns_size_in_code_units_ + 0x4 + 0x2 * code_item_insns_size_in_code_units_val + padding + 0x8 * tries_size_val
				code_item_size = code_item_size + encoded_catch_handler_list.parse_encoded_catch_handler_list(dex_file_base, code_off + code_item_size, tries_size_val)
				file_path = os.path.join(config.workspace, config.dex_directory, "code_item_%#x_%0#10x.bin" % (method_idx, code_off))
				file_format = "binary"
				file_vtl_start_address = (dex_file_base + code_off) & 0xffffffff
				file_vtl_end_address = ((dex_file_base + code_off) & 0xffffffff) + code_item_size - 0x1
				if not os.path.exists(file_path):
					memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
		# virtual_method
		method_idx = None
		for virtual_method in class_data_item.virtual_methods:
			method_idx_diff = virtual_method.method_idx_diff
			if method_idx is None:
				method_idx = method_idx_diff
			else:
				method_idx = method_idx + method_idx_diff
				
			code_off = virtual_method.code_off
			if (code_off > dex_file_size) or (code_off < 0):
				# dump the code_item on-demand
				tries_size_off = ((dex_file_base + code_off) & 0xffffffff) + config.offset_DexFile_CodeItem_tries_size_
				tries_size_val = memory.readMemory16(tries_size_off)
				code_item_insns_size_in_code_units_off = ((dex_file_base + code_off) & 0xffffffff) + config.offset_DexFile_CodeItem_insns_size_in_code_units_
				code_item_insns_size_in_code_units_val = memory.readMemory32(code_item_insns_size_in_code_units_off)
				padding = 0x2 if (tries_size_val > 0) and (code_item_insns_size_in_code_units_val % 2 == 1) else 0x0
				code_item_size = config.offset_DexFile_CodeItem_insns_size_in_code_units_ + 0x4 + 0x2 * code_item_insns_size_in_code_units_val + padding + 0x8 * tries_size_val
				code_item_size = code_item_size + encoded_catch_handler_list.parse_encoded_catch_handler_list(dex_file_base, code_off + code_item_size, tries_size_val)
				file_path = os.path.join(config.workspace, config.dex_directory, "code_item_%#x_%0#10x.bin" % (method_idx, code_off))
				file_format = "binary"
				file_vtl_start_address = (dex_file_base + code_off) & 0xffffffff
				file_vtl_end_address = ((dex_file_base + code_off) & 0xffffffff) + code_item_size - 0x1
				if not os.path.exists(file_path):
					memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)


def DexModification():
	# dump the dex file
	assert len(os.listdir(os.path.join(config.workspace, config.dex_directory))) > 0
	dex_info_list = config.load_dex_info()
	for dex_file_base, dex_file_size, dex_file_name in dex_info_list:
		config.log_print("[DexModification] begin_ = %0#10x, size_ = %#x, location_ = %s" % (dex_file_base, dex_file_size, dex_file_name))
		dump_dex_memory(dex_file_base, dex_file_size, dex_file_name)
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	return


if __name__ == '__main__':
	DexModification()
	sys.exit()
