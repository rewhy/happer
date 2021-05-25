# LoadClass_arm.py is used to .... when the "ClassLinker::LoadClassMembers" method is invoked in 32-bit mode.

import gc
import os
import sys

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import mmu
from DexParser import header_item, string_id_item, type_id_item, class_def_item

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def retrieve_string_value(string_ptr):
	length_val = memory.readMemory32(string_ptr + config.offset_string_length)
	reference_ptr = memory.readMemory32(string_ptr + config.offset_string_reference)
	char_array = memory.retrieve_char_array(reference_ptr)
	
	return char_array


def start_prolog():
	# disable the FindClass breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_FindClass:
			brk_object.disable()


def end_prolog_done():
	# disable the FindClass breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_FindClass:
			brk_object.disable()
	# disable the LoadMethod breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadMethod:
			brk_object.disable()


def end_prolog():
	# enable the FindClass breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_FindClass:
			brk_object.enable()


def cleanup():
	if mmu.page_table is not None:
		del mmu.page_table
		gc.collect()


def FindClass():
	# -- HEAD -- #
	start_prolog()
	
	# ensure that the LoadMethod breakpoint is enabled
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadMethod:
			brk_object.enable()

	# -- BODY -- #
	
	# get the "descriptor" parameter
	descriptor_param = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	descriptor_ptr = descriptor_param
	
	# read the "descriptor" string
	descriptor_string_val = memory.retrieve_char_array(descriptor_ptr)
	print "[FindClass] descriptor = %s" % descriptor_string_val
	
	if config.package_name.replace(".", "/") in descriptor_string_val:
		force_loading(descriptor_string_val)
		
		# -- TAIL -- #
		end_prolog_done()
	else:
		# -- TAIL -- #
		end_prolog()
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


def force_loading(exclude_class):
	# save register values
	origin_R0_val = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	origin_R1_val = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	origin_R2_val = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	origin_R3_val = int(execution_state.getRegisterService().getValue("R3")) & 0xffffffff
	origin_R12_val = int(execution_state.getRegisterService().getValue("R12")) & 0xffffffff
	origin_SP_val = int(execution_state.getRegisterService().getValue("SP")) & 0xffffffff
	origin_LR_val = int(execution_state.getRegisterService().getValue("LR")) & 0xffffffff
	origin_CPSR_val = int(execution_state.getRegisterService().getValue("CPSR")) & 0xffffffff
	
	page_size = 0x1000
	page_vtl_start_address = origin_SP_val - (origin_SP_val % page_size)
	print "[FindClass] origin SP = %0#10x" % origin_SP_val
	print "[FindClass] origin page = %0#10x" % page_vtl_start_address
	origin_content = execution_state.getMemoryService().read(page_vtl_start_address, page_size)
	print origin_content

	# retrieve dex_file_ptr and dex_file_size
	fp = open(os.path.join(config.workspace, config.log_file), "r")
	for range_info in fp.readlines():
		range_info = range_info.replace("\n", "").strip()
		if "[DexFile]" in range_info:
			range_info = range_info.split(",")[0].split("=")[1].strip()
			break
	fp.close()
	
	dex_file_begin_val = int(range_info.split(", ")[0], 16) & 0xffffffff
	
	# retrieve loaded classes
	loaded_classes = []
	loaded_classes.append(exclude_class)
	fp = open(os.path.join(config.workspace, config.log_file), "r")
	for class_info in fp.readlines():
		class_info = class_info.replace("\n", "").strip()
		if "[LoadMethod] origin" in class_info:
			class_info = class_info.split(";")[0].split(" ")[-1].strip()
			class_info = class_info + ";"
			print "[FindClass] loaded class = %s" % class_info
			if not (class_info in loaded_classes):
				loaded_classes.append(class_info)
	fp.close()
	
	# resolve 
	string_ids_off = header_item.get_string_ids_off(dex_file_begin_val)
	type_ids_off = header_item.get_type_ids_off(dex_file_begin_val)
	class_defs_size = header_item.get_class_defs_size(dex_file_begin_val)
	class_defs_off = header_item.get_class_defs_off(dex_file_begin_val)
	
	for class_def_idx in range(class_defs_size):
		class_idx = class_def_item.get_class_idx(dex_file_begin_val, class_defs_off, class_def_idx)
		class_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, class_idx)
		class_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, class_descriptor_idx)
		if class_descriptor_content in loaded_classes:
			continue
		
		print "[FindClass] force descriptor = %s" % class_descriptor_content
		
		# hook
		execution_state.getRegisterService().setValue("R0", origin_R0_val)
		execution_state.getRegisterService().setValue("R1", origin_R1_val)
		descriptor_ptr = string_id_item.get_string_id_item_data_off(dex_file_begin_val, string_ids_off, class_descriptor_idx)
		print "[FindClass] force descriptor address = %0#10x" % descriptor_ptr
		execution_state.getRegisterService().setValue("R2", descriptor_ptr)
		descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, class_descriptor_idx)
		print "[FindClass] force descriptor value = %s" % descriptor_content
		hash = ComputeModifiedUtf8Hash(descriptor_content) & 0xffffffff
		execution_state.getRegisterService().setValue("R3", hash)
		execution_state.getRegisterService().setValue("R12", origin_R12_val)
		execution_state.getRegisterService().setValue("SP", origin_SP_val)
		execution_state.getRegisterService().setValue("LR", origin_LR_val)
		execution_state.getRegisterService().setValue("CPSR", origin_CPSR_val)
		
		execution_state.getMemoryService().write(page_vtl_start_address, origin_content)
		
		# execute
		execution_state.getExecutionService().resumeTo(config.brk_FindClass_end)
		try:
			execution_state.getExecutionService().waitForStop(10 * 60 * 1000)  # wait for 10mins
		except DebugException:
			raise RuntimeError("wtf !!!")
		
		execution_state.getRegisterService().setValue("PC", config.brk_FindClass)
			
	# recover register values
	execution_state.getRegisterService().setValue("R0", origin_R0_val)
	execution_state.getRegisterService().setValue("R1", origin_R1_val)
	execution_state.getRegisterService().setValue("R2", origin_R2_val)
	execution_state.getRegisterService().setValue("R3", origin_R3_val)
	execution_state.getRegisterService().setValue("R12", origin_R12_val)
	execution_state.getRegisterService().setValue("SP", origin_SP_val)
	execution_state.getRegisterService().setValue("LR", origin_LR_val)
	execution_state.getRegisterService().setValue("CPSR", origin_CPSR_val)
	
	post_content = execution_state.getMemoryService().read(page_vtl_start_address, page_size)
	print post_content
	execution_state.getMemoryService().write(page_vtl_start_address, origin_content)
	
	# execute
	execution_state.getExecutionService().resumeTo(config.brk_FindClass_end)
	try:
		execution_state.getExecutionService().waitForStop(10 * 60 * 1000)  # wait for 10mins
	except DebugException:
		raise RuntimeError("wtf !!!")


def ComputeModifiedUtf8Hash(input):
	hash = 0
	input_bytes = bytes(input)
	for idx in range(len(input_bytes)):
		hash = hash * 31 + ord(input_bytes[idx])
	return hash


if __name__ == '__main__':
	FindClass()
	sys.exit()

