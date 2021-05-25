# LoadClass_arm.py is used to .... when the "ClassLinker::LoadClassMembers" method is invoked in 32-bit mode.

import gc
import os
import sys

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import mmu
from DexParser import header_item, class_data_item

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def retrieve_string_value(string_ptr):
	length_val = memory.readMemory32(string_ptr + config.offset_string_length)
	reference_ptr = memory.readMemory32(string_ptr + config.offset_string_reference)
	char_array = memory.retrieve_char_array(reference_ptr)
	
	return char_array
	
	
def start_prolog():
	# disable the LoadClassMembers breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadClassMembers:
			brk_object.disable()
			
			
def end_prolog():
	# enable the LoadClassMembers breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadClassMembers:
			brk_object.enable()


def cleanup():
	if mmu.page_table is not None:
		del mmu.page_table
		gc.collect()


def LoadClassMembers():
	# -- HEAD -- #
	start_prolog()
	
	# ensure that the LoadMethod breakpoint is enabled
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadMethod:
			brk_object.enable()

	# -- BODY -- #
	
	# get the "dex_file" parameter
	dex_file_param = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	dex_file_ptr = dex_file_param
	
	# read the "location_" field
	dex_file_location_ptr = dex_file_ptr + config.offset_DexFile_location_
	# retrieve the value of the std::string structure
	dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
	if config.debug:
		print "[LoadClassMembers] location_ = %s" % dex_file_location_string_val
		
	# we only focus on the DexFile whose location is suspicious
	if not config.package_filter(dex_file_location_string_val):
		# disable the LoadMethod breakpoint here
		for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
			brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
			if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadMethod:
				brk_object.disable()
				
		# -- TAIL -- #
		end_prolog()
		
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return
	
	# read the "begin_" field
	dex_file_begin_ptr = dex_file_ptr + config.offset_DexFile_begin_
	dex_file_begin_val = memory.readMemory32(dex_file_begin_ptr)
	if config.debug:
		print "[LoadClassMembers] begin_ = %0#10x" % dex_file_begin_val
		
	# read the "size_" field
	dex_file_size_ptr = dex_file_ptr + config.offset_DexFile_size_
	dex_file_size_val = memory.readMemory32(dex_file_size_ptr)
	if config.debug:
		print "[LoadClassMembers] size_ = %#x" % dex_file_size_val
		
	config.log_print("[LoadClassMembers] begin_ = %0#10x, size_ = %#x, location_ = %s" % (dex_file_begin_val, dex_file_size_val, dex_file_location_string_val))
		
	# get the "class_data" parameter
	class_data_param = int(execution_state.getRegisterService().getValue("R3")) & 0xffffffff
	class_data_off = class_data_param - dex_file_begin_val
	
	config.log_print("[LoadClassMembers] class_data = %0#10x (offset = %#x)" % (class_data_param, class_data_off))
	
	# parse class_data_item
	static_fields_size_off = 0x0
	static_fields_size, length_static_fields_size = class_data_item.get_static_fields_size(dex_file_begin_val, class_data_off, static_fields_size_off)
	config.log_print("[LoadClassMembers] [class_data_item] static_fields_size = %#x" % static_fields_size)
	
	instance_fields_size_off = static_fields_size_off + length_static_fields_size
	instance_fields_size, length_instance_fields_size = class_data_item.get_instance_fields_size(dex_file_begin_val, class_data_off, instance_fields_size_off)
	config.log_print("[LoadClassMembers] [class_data_item] instance_fields_size = %#x" % instance_fields_size)
	
	direct_methods_size_off = instance_fields_size_off + length_instance_fields_size
	direct_methods_size, length_direct_methods_size = class_data_item.get_direct_methods_size(dex_file_begin_val, class_data_off, direct_methods_size_off)
	config.log_print("[LoadClassMembers] [class_data_item] direct_methods_size = %#x" % direct_methods_size)
	
	virtual_methods_size_off = direct_methods_size_off + length_direct_methods_size
	virtual_methods_size, length_virtual_methods_size = class_data_item.get_virtual_methods_size(dex_file_begin_val, class_data_off, virtual_methods_size_off)
	config.log_print("[LoadClassMembers] [class_data_item] virtual_methods_size = %#x" % virtual_methods_size)
	
	static_fields_off = virtual_methods_size_off + length_virtual_methods_size
	static_fields, length_static_fields = class_data_item.get_static_fields(dex_file_begin_val, class_data_off, static_fields_off, static_fields_size)
	for idx in range(static_fields_size):
		config.log_print("[LoadClassMembers] [class_data_item] static_fields[%d].field_idx_diff = %#x" % (idx, static_fields[idx][0]))
		config.log_print("[LoadClassMembers] [class_data_item] static_fields[%d].access_flags = %0#10x" % (idx, static_fields[idx][1]))

	instance_fields_off = static_fields_off + length_static_fields
	instance_fields, length_instance_fields = class_data_item.get_instance_fields(dex_file_begin_val, class_data_off, instance_fields_off, instance_fields_size)
	for idx in range(instance_fields_size):
		config.log_print("[LoadClassMembers] [class_data_item] instance_fields[%d].field_idx_diff = %#x" % (idx, instance_fields[idx][0]))
		config.log_print("[LoadClassMembers] [class_data_item] instance_fields[%d].access_flags = %0#10x" % (idx, instance_fields[idx][1]))

	direct_methods_off = instance_fields_off + length_instance_fields
	direct_methods, length_direct_methods = class_data_item.get_direct_methods(dex_file_begin_val, class_data_off, direct_methods_off, direct_methods_size)
	for idx in range(direct_methods_size):
		config.log_print("[LoadClassMembers] [class_data_item] direct_methods[%d].method_idx_diff = %#x" % (idx, direct_methods[idx][0]))
		config.log_print("[LoadClassMembers] [class_data_item] direct_methods[%d].access_flags = %0#10x" % (idx, direct_methods[idx][1]))
		config.log_print("[LoadClassMembers] [class_data_item] direct_methods[%d].code_off = %0#10x" % (idx, direct_methods[idx][2]))

	virtual_methods_off = direct_methods_off + length_direct_methods
	virtual_methods, length_virtual_methods = class_data_item.get_virtual_methods(dex_file_begin_val, class_data_off, virtual_methods_off, virtual_methods_off)
	for idx in range(virtual_methods_size):
		config.log_print("[LoadClassMembers] [class_data_item] virtual_methods[%d].method_idx_diff = %#x" % (idx, virtual_methods[idx][0]))
		config.log_print("[LoadClassMembers] [class_data_item] virtual_methods[%d].access_flags = %0#10x" % (idx, virtual_methods[idx][1]))
		config.log_print("[LoadClassMembers] [class_data_item] virtual_methods[%d].code_off = %0#10x" % (idx, virtual_methods[idx][2]))

	class_data_size = virtual_methods_off + length_virtual_methods
	if class_data_off < 0:
		config.log_print("[LoadClassMembers] class_data = %0#10x (offset = %#x, size = %#x)" % (class_data_param, 0xffffffff + class_data_off, class_data_size))
	else:
		config.log_print("[LoadClassMembers] class_data = %0#10x (offset = %#x, size = %#x)" % (class_data_param, class_data_off, class_data_size))
	
	# dump the class_data_item on-demand
	if (class_data_off < 0) or (class_data_off > dex_file_size_val):
		file_path = os.path.join(config.workspace, config.dex_directory, "class_data_item_%0#10x.bin" % (class_data_off if class_data_off > 0 else (0xffffffff + class_data_off)))
		file_format = "binary"
		file_vtl_start_address = class_data_param
		file_vtl_end_address = class_data_param + class_data_size - 0x1
		memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
		
	# -- TAIL -- #
	end_prolog()
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	LoadClassMembers()
	sys.exit()
