# InitClass.py is used to 

import gc
import os
import sys
import time

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import mmu
from DexParser import header_item, string_id_item, type_id_item, proto_id_item, method_id_item, encoded_catch_handler_list


# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def retrieve_string_value(string_ptr):
	length_val = memory.readMemory32(string_ptr + config.offset_string_length)
	reference_ptr = memory.readMemory32(string_ptr + config.offset_string_reference)
	char_array = memory.retrieve_char_array(reference_ptr)
	
	return char_array


def start_prolog():
	# disable the InitClass breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_InitClass:
			brk_object.disable()


def end_prolog():
	# enable the FindClass breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_InitClass:
			brk_object.enable()


def end_prolog_done():
	# disable the FindClass breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_InitClass:
			brk_object.disable()


def cleanup():
	if mmu.page_table is not None:
		del mmu.page_table
		gc.collect()


def resolve_mirror_Class(class_ptr):
	# find the clinit_thread_id_ field
	address_Class_clinit_thread_id_ = class_ptr
	pid_val = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff
	while True:
		if memory.readMemory32(address_Class_clinit_thread_id_) == pid_val:
			break
		else:
			address_Class_clinit_thread_id_ = address_Class_clinit_thread_id_ + 0x4
	
	# get the methods_ field
	address_methods_ = address_Class_clinit_thread_id_ - 0x4 - 0x4 - 0x4 - 0x8 - 0x8
	methods_array_ptr = memory.readMemory32(address_methods_)
	
	methods_cnt = memory.readMemory32(methods_array_ptr)
	if config.debug:
		print "[ClassModification] len(methods_) = %#x" % methods_cnt
	
	method_list = []
	current_method_ptr = methods_array_ptr + 0x4
	for idx in range(methods_cnt):
		field_0	= current_method_ptr + config.offset_ArtMethod_declaring_class_  # specially, we record the address rather than its value
		field_1 = memory.readMemory32(current_method_ptr + config.offset_ArtMethod_access_flags_)
		field_2 = memory.readMemory32(current_method_ptr + config.offset_ArtMethod_dex_code_item_offset_)
		field_3 = memory.readMemory32(current_method_ptr + config.offset_ArtMethod_dex_method_index_)
		field_4 = memory.readMemory16(current_method_ptr + config.offset_ArtMethod_method_index_)
		field_5 = memory.readMemory16(current_method_ptr + config.offset_ArtMethod_hotness_count_)
		field_6 = memory.readMemory32(current_method_ptr + config.offset_ArtMethod_dex_cache_resolved_methods_)
		field_7 = memory.readMemory32(current_method_ptr + config.offset_ArtMethod_data_)
		field_8 = memory.readMemory32(current_method_ptr + config.offset_ArtMethod_entry_point_from_quick_compiled_code)
		
		method_list.append((field_0, field_1, field_2, field_3, field_4, field_5, field_6, field_7, field_8))
		current_method_ptr = current_method_ptr + 0x20
		
	return method_list


def InitClass():
	# load class info
	thread_ptr, mirror_class_names, mirror_class_ptrs = config.load_class_info()

	thread_ptr_cur = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	if thread_ptr_cur != thread_ptr:
		# -- TAIL -- #
		end_prolog()
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return
	
	origin_reference_ptr = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	origin_class_ptr = memory.readMemory32(origin_reference_ptr)
	if not (origin_class_ptr in mirror_class_ptrs):
		# -- TAIL -- #
		end_prolog()
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return
		
	origin_ret_address = int(execution_state.getRegisterService().getValue("LR")) & 0xffffffff
		
	for idx in range(len(mirror_class_ptrs)):
		class_ptr = mirror_class_ptrs[idx]
		if origin_class_ptr == class_ptr:
			class_name = mirror_class_names[idx]
			print "[InitClass] init class name = %s, ret = %0#10x" % (class_name, origin_ret_address) 
			config.log_print("[InitClass] init class -> %s, ret -> %0#10x" % (class_name, origin_ret_address))
		
	# -- HEAD -- #
	start_prolog()
	
	# -- BODY -- #
	
	origin_method_lists = []
	for idx in range(len(mirror_class_ptrs)):
		class_ptr = mirror_class_ptrs[idx]
		origin_method_list = resolve_mirror_Class(class_ptr)
		origin_method_lists.append(origin_method_list)
	
	force_initializing(origin_class_ptr, mirror_class_ptrs, mirror_class_names)
	
	suspicious_method_lists = []
	for idx in range(len(mirror_class_ptrs)):
		class_ptr = mirror_class_ptrs[idx]
		suspicious_method_list = resolve_mirror_Class(class_ptr)
		suspicious_method_lists.append(suspicious_method_list)
	
	for idx in range(len(mirror_class_ptrs)):
		origin_method_list = origin_method_lists[idx]
		suspicious_method_list = suspicious_method_lists[idx]
		dump_modified_method(origin_method_list, suspicious_method_list)
	
	# -- TAIL -- #
	end_prolog_done()
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


def force_initializing(origin_class_ptr, mirror_class_ptrs, mirror_class_names):
	# save register values
	origin_R0_val = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	origin_R1_val = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	origin_R2_val = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	origin_R3_val = int(execution_state.getRegisterService().getValue("R3")) & 0xffffffff
	origin_R9_val = int(execution_state.getRegisterService().getValue("R9")) & 0xffffffff
	origin_R10_val = int(execution_state.getRegisterService().getValue("R10")) & 0xffffffff
	origin_R11_val = int(execution_state.getRegisterService().getValue("R11")) & 0xffffffff
	origin_R12_val = int(execution_state.getRegisterService().getValue("R12")) & 0xffffffff
	origin_SP_val = int(execution_state.getRegisterService().getValue("SP")) & 0xffffffff
	origin_LR_val = int(execution_state.getRegisterService().getValue("LR")) & 0xffffffff
	origin_CPSR_val = int(execution_state.getRegisterService().getValue("CPSR")) & 0xffffffff
	
	# save stack content
	page_size = 0x1000
	page_vtl_start_address = origin_SP_val - (origin_SP_val % page_size)
	# print "[InitClass] origin SP = %0#10x" % origin_SP_val
	# print "[InitClass] origin page = %0#10x" % page_vtl_start_address
	origin_content = execution_state.getMemoryService().read(page_vtl_start_address, page_size)
	# print origin_content
	
	for idx in range(len(mirror_class_ptrs)):
		class_name = mirror_class_names[idx]
		print "[InitClass] force init class -> %s" % class_name
		config.log_print("[InitClass] force init class -> %s" % (class_name))
		class_ptr = mirror_class_ptrs[idx]
		
		# recover register values
		execution_state.getRegisterService().setValue("R0", origin_R0_val)
		execution_state.getRegisterService().setValue("R1", origin_R1_val)
		execution_state.getRegisterService().setValue("R2", origin_R2_val)
		execution_state.getRegisterService().setValue("R3", origin_R3_val)
		execution_state.getRegisterService().setValue("R9", origin_R9_val)
		execution_state.getRegisterService().setValue("R10", origin_R10_val)
		execution_state.getRegisterService().setValue("R11", origin_R11_val)
		execution_state.getRegisterService().setValue("R12", origin_R12_val)
		execution_state.getRegisterService().setValue("SP", origin_SP_val)
		execution_state.getRegisterService().setValue("LR", origin_LR_val)
		execution_state.getRegisterService().setValue("CPSR", origin_CPSR_val)
		
		# recover stack content
		execution_state.getMemoryService().write(page_vtl_start_address, origin_content)
		
		# hook
		execution_state.getMemoryService().writeMemory32(origin_R2_val, class_ptr)
		
		# execute
		while True:
			execution_state.getExecutionService().resumeTo(config.brk_InitClass_end)
			try:
				execution_state.getExecutionService().waitForStop(10 * 60 * 1000)  # wait for 10mins
			except DebugException:
				raise RuntimeError("wtf !!!")
			
			reference_ptr = int(execution_state.getRegisterService().getValue("R4")) & 0xffffffff
			ret_address = memory.readMemory32((int(execution_state.getRegisterService().getValue("SP")) & 0xffffffff) + 0x20 + 0x4 * 5)
			if origin_LR_val == ret_address and origin_R2_val == reference_ptr:
				break
		
		execution_state.getRegisterService().setValue("PC", config.brk_InitClass)
		print "[InitClass] force init done <- %s" % class_name
		config.log_print("[InitClass] force init done <- %s" % (class_name))
	
	# recover register values
	execution_state.getRegisterService().setValue("R0", origin_R0_val)
	execution_state.getRegisterService().setValue("R1", origin_R1_val)
	execution_state.getRegisterService().setValue("R2", origin_R2_val)
	execution_state.getRegisterService().setValue("R3", origin_R3_val)
	execution_state.getRegisterService().setValue("R9", origin_R9_val)
	execution_state.getRegisterService().setValue("R10", origin_R10_val)
	execution_state.getRegisterService().setValue("R11", origin_R11_val)
	execution_state.getRegisterService().setValue("R12", origin_R12_val)
	execution_state.getRegisterService().setValue("SP", origin_SP_val)
	execution_state.getRegisterService().setValue("LR", origin_LR_val)
	execution_state.getRegisterService().setValue("CPSR", origin_CPSR_val)
	
	# recover stack content
	execution_state.getMemoryService().write(page_vtl_start_address, origin_content)
	
	# recover memory content
	execution_state.getMemoryService().writeMemory32(origin_R2_val, origin_class_ptr)
	
	return


def dump_modified_method(origin_method_list, suspicious_method_list):
	assert len(origin_method_list) == len(suspicious_method_list)
	
	for idx in range(len(origin_method_list)):
		origin_method = origin_method_list[idx]
		suspicious_method = suspicious_method_list[idx]
		if origin_method != suspicious_method:
			assert origin_method[0] == suspicious_method[0]
			assert origin_method[3] == suspicious_method[3]
			
			# read the "declaring_class_" field of ArtMethod
			art_method_declaring_class_ptr = origin_method[0]
			# read the "root_" field of GcRoot
			art_method_declaring_class_root_ptr = art_method_declaring_class_ptr + config.offset_GcRoot_root_
			# read the "refeence_" field of CompressesReference
			art_method_declaring_class_root_reference_ptr = art_method_declaring_class_root_ptr + config.offset_CompressesReference_reference_
			art_method_declaring_class_root_reference_val = memory.readMemory32(art_method_declaring_class_root_reference_ptr)
			
			class_ptr = art_method_declaring_class_root_reference_val
			
			# read the "dex_cache_" field of Class
			class_dex_cache_ptr = class_ptr + config.offset_Class_dex_cache_
			# read the "reference_" field of HeapReference
			class_dex_cache_reference_ptr = class_dex_cache_ptr + config.offset_HeapReference_reference_
			class_dex_cache_reference_val = memory.readMemory32(class_dex_cache_reference_ptr)
			dex_cache_ptr = class_dex_cache_reference_val
			# read the "dex_file_" field of DexCache
			dex_cache_dex_file_ptr = dex_cache_ptr + config.offset_DexCache_dex_file_
			dex_cache_dex_file_val = memory.readMemory32(dex_cache_dex_file_ptr)
			
			dex_file_ptr = dex_cache_dex_file_val
			
			# read the "begin_" field of DexFile
			dex_file_begin_ptr = dex_file_ptr + config.offset_DexFile_begin_
			dex_file_begin_val = memory.readMemory32(dex_file_begin_ptr)
			
			art_method_dex_method_index_val = origin_method[3]
			
			# resolve 
			string_ids_off = header_item.get_string_ids_off(dex_file_begin_val)
			type_ids_off = header_item.get_type_ids_off(dex_file_begin_val)
			proto_ids_off = header_item.get_proto_ids_off(dex_file_begin_val)
			method_ids_off = header_item.get_method_ids_off(dex_file_begin_val)
			
			class_idx = method_id_item.get_class_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
			class_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, class_idx)
			class_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, class_descriptor_idx)
				
			name_idx = method_id_item.get_name_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
			name_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, name_idx)
			
			proto_idx = method_id_item.get_proto_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
			proto_return_type_idx = proto_id_item.get_return_type_idx(dex_file_begin_val, proto_ids_off, proto_idx)
			proto_return_type_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, proto_return_type_idx)
			proto_return_type_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, proto_return_type_descriptor_idx)
			
			parameters_content = ""
			proto_parameters_list = proto_id_item.get_parameters_list(dex_file_begin_val, proto_ids_off, proto_idx)
			if len(proto_parameters_list) == 0:
				parameters_content = "()"
			else:
				for parameter_idx in range(len(proto_parameters_list)):
					parameter_type_idx = proto_parameters_list[parameter_idx]
					parameter_type_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, parameter_type_idx)
					parameter_type_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, parameter_type_descriptor_idx)
				
					if len(proto_parameters_list) == 1:
						parameters_content = parameters_content + "(" + parameter_type_descriptor_content + ")"
					else:
						if parameter_idx == 0:
							parameters_content = parameters_content + "(" + parameter_type_descriptor_content
						elif parameter_idx == (len(proto_parameters_list) - 1):
							parameters_content = parameters_content + "," + parameter_type_descriptor_content + ")"
						else:
							parameters_content = parameters_content + "," + parameter_type_descriptor_content
			
			method_signature = "?? %s->%s %s%s" % (class_descriptor_content, proto_return_type_descriptor_content, name_content, parameters_content)
			
			config.log_print("[ClassModification] mirror::Class has been modified !!!")
			config.log_print("[ClassModification][origin]     signature = %s, access_flags_ = %#x, dex_code_item_offset_ = %0#10x, entry_point_from_quick_compiled_code = %0#10x" % (method_signature, origin_method[1], origin_method[2], origin_method[8]))
			config.log_print("[ClassModification][suspicious] signature = %s, access_flags_ = %#x, dex_code_item_offset_ = %0#10x, entry_point_from_quick_compiled_code = %0#10x" % (method_signature, suspicious_method[1], suspicious_method[2], suspicious_method[8]))
			
			if origin_method[2] != suspicious_method[2]:
				# dump the code_item on-demand
				tries_size_off = ((dex_file_begin_val + suspicious_method[2]) & 0xffffffff) + config.offset_DexFile_CodeItem_tries_size_
				print "[ClassModification] tries_size_off = %#x" % tries_size_off
				tries_size_val = memory.readMemory16(tries_size_off)
				code_item_insns_size_in_code_units_off = ((dex_file_begin_val + suspicious_method[2]) & 0xffffffff) + config.offset_DexFile_CodeItem_insns_size_in_code_units_
				print "[ClassModification] code_item_insns_size_in_code_units_off = %#x" % code_item_insns_size_in_code_units_off
				code_item_insns_size_in_code_units_val = memory.readMemory32(code_item_insns_size_in_code_units_off)
				padding = 0x2 if (tries_size_val > 0) and (code_item_insns_size_in_code_units_val % 2 == 1) else 0x0
				code_item_size = config.offset_DexFile_CodeItem_insns_size_in_code_units_ + 0x4 + 0x2 * code_item_insns_size_in_code_units_val + padding + 0x8 * tries_size_val
				code_item_size = code_item_size + encoded_catch_handler_list.parse_encoded_catch_handler_list(dex_file_begin_val, suspicious_method[2] + code_item_size, tries_size_val)
				file_path = os.path.join(config.workspace, config.dex_directory, "code_item_%#x_%0#10x.bin" % (origin_method[3], origin_method[2]))
				file_format = "binary"
				file_vtl_start_address = (dex_file_begin_val + suspicious_method[2]) & 0xffffffff
				file_vtl_end_address = ((dex_file_begin_val + suspicious_method[2]) & 0xffffffff) + code_item_size - 0x1
				memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)


if __name__ == '__main__':
	InitClass()
	sys.exit()
