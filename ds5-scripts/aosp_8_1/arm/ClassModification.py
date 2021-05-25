# ClassModification.py is used to .... when the "ArtInterpreterToInterpreterBridge" method is invoked in 32-bit mode.

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


def ClassModification():
	# at the very beginning, we remove the DexFile breakpoint
	rm_brks = []
	for breakpoint_index in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		breakpoint_object = execution_state.getBreakpointService().getBreakpoint(breakpoint_index)
		if (int(breakpoint_object.getAddresses()[0]) & 0xffffffff) == config.brk_DexFile:
			rm_brks.append(breakpoint_object)
	for brk_obj in rm_brks:
		brk_obj.remove()

	# -1- DoCall
	
	# get the "shadow_frame" parameter
	shadow_frame_ptr = int(execution_state.getRegisterService().getValue("R2"))
	if config.debug:
		print "[ClassModification] shadow_frame = %0#10x" % shadow_frame_ptr
	
	# retrieve the "method_" field of ShadowFrame structure
	shadow_frame_method_ptr = memory.readMemory32(shadow_frame_ptr + config.offset_ShadowFrame_method_)
	
	# get the pointer that refers to ArtMethod
	art_method_ptr = shadow_frame_method_ptr
	if config.debug:
		print "[ClassModification] caller = %0#10x" % art_method_ptr

	# read the "declaring_class_" field of ArtMethod
	art_method_declaring_class_ptr = art_method_ptr + config.offset_ArtMethod_declaring_class_
	# read the "root_" field of GcRoot
	art_method_declaring_class_root_ptr = art_method_declaring_class_ptr + config.offset_GcRoot_root_
	# read the "refeence_" field of CompressesReference
	art_method_declaring_class_root_reference_ptr = art_method_declaring_class_root_ptr + config.offset_CompressesReference_reference_
	art_method_declaring_class_root_reference_val = memory.readMemory32(art_method_declaring_class_root_reference_ptr)
	
	class_ptr = art_method_declaring_class_root_reference_val
	caller_class_ptr = class_ptr
	
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
	if config.debug:
		print "[ClassModification] ArtMethod::declaring_class_::dex_cache_::dex_file_::begin_ = %0#10x" % dex_file_begin_val
		
	# read the "size_" field of DexFile
	dex_file_size_ptr = dex_file_ptr + config.offset_DexFile_size_
	dex_file_size_val = memory.readMemory32(dex_file_size_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::declaring_class_::dex_cache_::dex_file_::size_ = %#x" % dex_file_size_val

	# read the "location_" field of DexFile
	dex_file_location_ptr = dex_file_ptr + config.offset_DexFile_location_
	# retrieve the value of std::string
	dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::declaring_class_::dex_cache_::dex_file_::location_ = %s" % dex_file_location_string_val
	
	# we only focus on the Java invocation appeared in the target package
	if not config.package_filter(dex_file_location_string_val):
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return
	
	# read the "access_flags_" field of ArtMethod
	art_method_access_flags_ptr = art_method_ptr + config.offset_ArtMethod_access_flags_
	art_method_access_flags_value = memory.readMemory32(art_method_access_flags_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::access_flags_ = %#x (%s)" % (art_method_access_flags_value, config.resolve_access_flags(art_method_access_flags_value))
	
	# read the "dex_code_item_offset_" field of ArtMethod
	art_method_dex_code_item_offset_ptr = art_method_ptr + config.offset_ArtMethod_dex_code_item_offset_
	art_method_dex_code_item_offset_value = memory.readMemory32(art_method_dex_code_item_offset_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::dex_code_item_offset_ = %#x" % art_method_dex_code_item_offset_value
	
	# read the "dex_method_index_" field of ArtMethod
	art_method_dex_method_index_ptr = art_method_ptr + config.offset_ArtMethod_dex_method_index_
	art_method_dex_method_index_val = memory.readMemory32(art_method_dex_method_index_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::dex_method_index_ = %#x" % art_method_dex_method_index_val
		
	# resolve 
	string_ids_off = header_item.get_string_ids_off(dex_file_begin_val)
	type_ids_off = header_item.get_type_ids_off(dex_file_begin_val)
	proto_ids_off = header_item.get_proto_ids_off(dex_file_begin_val)
	method_ids_off = header_item.get_method_ids_off(dex_file_begin_val)
	
	class_idx = method_id_item.get_class_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	class_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, class_idx)
	class_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, class_descriptor_idx)
	# if config.debug:
		# print "[ClassModification] class name = %s" % class_descriptor_content
		
	name_idx = method_id_item.get_name_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	name_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, name_idx)
	# if config.debug:
		# print "[ClassModification] method name = %s" % name_content
	
	proto_idx = method_id_item.get_proto_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	proto_return_type_idx = proto_id_item.get_return_type_idx(dex_file_begin_val, proto_ids_off, proto_idx)
	proto_return_type_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, proto_return_type_idx)
	proto_return_type_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, proto_return_type_descriptor_idx)
	# if config.debug:
		# print "[ClassModification] return type = %s" % proto_return_type_descriptor_content
	
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
	# if config.debug:
		# print "[ClassModification] parameters = %s" % parameters_content
	
	caller_method_signature = "%s %s->%s %s%s" % (config.resolve_method_access_flags(art_method_access_flags_value), class_descriptor_content, proto_return_type_descriptor_content, name_content, parameters_content)
	if config.debug:
		print "[ClassModification] caller signature = %s" % caller_method_signature
	
	# -2- for callee
	
	# get the "called_method" parameter
	callee_ptr = int(execution_state.getRegisterService().getValue("R0"))
	
	# get the pointer that refers to ArtMethod
	art_method_ptr = callee_ptr
	if config.debug:
		print "[ClassModification] callee = %0#10x" % art_method_ptr
	
	# read the "declaring_class_" field of ArtMethod
	art_method_declaring_class_ptr = art_method_ptr + config.offset_ArtMethod_declaring_class_
	# read the "root_" field of GcRoot
	art_method_declaring_class_root_ptr = art_method_declaring_class_ptr + config.offset_GcRoot_root_
	# read the "refeence_" field of CompressesReference
	art_method_declaring_class_root_reference_ptr = art_method_declaring_class_root_ptr + config.offset_CompressesReference_reference_
	art_method_declaring_class_root_reference_val = memory.readMemory32(art_method_declaring_class_root_reference_ptr)
	
	class_ptr = art_method_declaring_class_root_reference_val
	callee_class_ptr = class_ptr
	
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
	if config.debug:
		print "[ClassModification] ArtMethod::declaring_class_::dex_cache_::dex_file_::begin_ = %0#10x" % dex_file_begin_val
		
	# read the "size_" field of DexFile
	dex_file_size_ptr = dex_file_ptr + config.offset_DexFile_size_
	dex_file_size_val = memory.readMemory32(dex_file_size_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::declaring_class_::dex_cache_::dex_file_::size_ = %#x" % dex_file_size_val

	# read the "location_" field of DexFile
	dex_file_location_ptr = dex_file_ptr + config.offset_DexFile_location_
	# retrieve the value of std::string
	dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::declaring_class_::dex_cache_::dex_file_::location_ = %s" % dex_file_location_string_val
	
	# we only focus on the Java invocation appeared in the target package
	if not config.package_filter(dex_file_location_string_val):
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return
	
	# read the "access_flags_" field of ArtMethod
	art_method_access_flags_ptr = art_method_ptr + config.offset_ArtMethod_access_flags_
	art_method_access_flags_value = memory.readMemory32(art_method_access_flags_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::access_flags_ = %#x (%s)" % (art_method_access_flags_value, config.resolve_access_flags(art_method_access_flags_value))
	
	# we only focus on the Java -> native invocation
	if not (art_method_access_flags_value & config.ACC_NATIVE == config.ACC_NATIVE):
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return
	
	# read the "dex_code_item_offset_" field of ArtMethod
	art_method_dex_code_item_offset_ptr = art_method_ptr + config.offset_ArtMethod_dex_code_item_offset_
	art_method_dex_code_item_offset_value = memory.readMemory32(art_method_dex_code_item_offset_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::dex_code_item_offset_ = %#x" % art_method_dex_code_item_offset_value
	
	# read the "dex_method_index_" field of ArtMethod
	art_method_dex_method_index_ptr = art_method_ptr + config.offset_ArtMethod_dex_method_index_
	art_method_dex_method_index_val = memory.readMemory32(art_method_dex_method_index_ptr)
	if config.debug:
		print "[ClassModification] ArtMethod::dex_method_index_ = %#x" % art_method_dex_method_index_val
		
	# resolve 
	string_ids_off = header_item.get_string_ids_off(dex_file_begin_val)
	type_ids_off = header_item.get_type_ids_off(dex_file_begin_val)
	proto_ids_off = header_item.get_proto_ids_off(dex_file_begin_val)
	method_ids_off = header_item.get_method_ids_off(dex_file_begin_val)
	
	class_idx = method_id_item.get_class_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	class_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, class_idx)
	class_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, class_descriptor_idx)
	# if config.debug:
		# print "[ClassModification] class name = %s" % class_descriptor_content
		
	name_idx = method_id_item.get_name_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	name_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, name_idx)
	# if config.debug:
		# print "[ClassModification] method name = %s" % name_content
	
	proto_idx = method_id_item.get_proto_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	proto_return_type_idx = proto_id_item.get_return_type_idx(dex_file_begin_val, proto_ids_off, proto_idx)
	proto_return_type_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, proto_return_type_idx)
	proto_return_type_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, proto_return_type_descriptor_idx)
	# if config.debug:
		# print "[ClassModification] return type = %s" % proto_return_type_descriptor_content
	
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
	# if config.debug:
		# print "[ClassModification] parameters = %s" % parameters_content
	
	callee_method_signature = "%s %s->%s %s%s" % (config.resolve_method_access_flags(art_method_access_flags_value), class_descriptor_content, proto_return_type_descriptor_content, name_content, parameters_content)
	if config.debug:
		print "[ClassModification] callee signature = %s" % callee_method_signature
	
	config.log_print("[ClassModification]          caller signature = %s" % caller_method_signature)
	config.log_print("[ClassModification] previous callee signature = %s" % callee_method_signature)
	
	# resolve the mirror::Class structure
	origin_method_list = resolve_mirror_Class(caller_class_ptr)
	suspicious_method_list = None  # we will fill this list afterwards
	
	# -2- GenericJniMethodEnd
	
	# disable the DoCall breakpoint to avoid noisy
	for breakpoint_index in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		breakpoint_object = execution_state.getBreakpointService().getBreakpoint(breakpoint_index)
		if (int(breakpoint_object.getAddresses()[0]) & 0xffffffff) == config.brk_DoCall:
			breakpoint_object.disable()
			
	# resume to the start address of the GenericJniMethodEnd method
	previous_callee_method_signature = callee_method_signature
	brk_GenericJniMethodEnd	= config.libart_base + config.GenericJniMethodEnd_start - config.libart_file_offset + config.libart_memory_offset
	while True:
		execution_state.getExecutionService().resumeTo(brk_GenericJniMethodEnd)
		try:
			execution_state.getExecutionService().waitForStop(10 * 60 * 1000)  # wait for 10mins
		except DebugException:
			raise RuntimeError("wtf !!!")
		
		# get the pointer that refers to ArtMethod*
		art_method_ptr_ptr = int(execution_state.getRegisterService().getValue("SP")) + 0x8
		# get the pointer that refers to ArtMethod
		art_method_ptr = memory.readMemory32(art_method_ptr_ptr)
		
		# read the "declaring_class_" field of ArtMethod
		art_method_declaring_class_ptr = art_method_ptr + config.offset_ArtMethod_declaring_class_
		# read the "root_" field of GcRoot
		art_method_declaring_class_root_ptr = art_method_declaring_class_ptr + config.offset_GcRoot_root_
		# read the "reference_" field of CompressesReference
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
		if config.debug:
			print "[ClassModification] ArtMethod::declaring_class_::dex_cache_::dex_file_::begin_ = %0#10x" % dex_file_begin_val
			
		callee_method_signature = "unknown"
		if dex_file_begin_val == 0x0:
			pass
		else:
			# read the "size_" field of DexFile
			dex_file_size_ptr = dex_file_ptr + config.offset_DexFile_size_
			dex_file_size_val = memory.readMemory32(dex_file_size_ptr)
			if config.debug:
				print "[ClassModification] ArtMethod::declaring_class_::dex_cache_::dex_file_::size_ = %#x" % dex_file_size_val

			# read the "location_" field of DexFile
			dex_file_location_ptr = dex_file_ptr + config.offset_DexFile_location_
			# retrieve the value of std::string
			dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
			if config.debug:
				print "[ClassModification] ArtMethod::declaring_class_::dex_cache_::dex_file_::location_ = %s" % dex_file_location_string_val
			
			# we focus on the JNI method defined in the target packages
			if not config.package_filter(dex_file_location_string_val):
				# continue the while-loop
				continue
				
			# read the "access_flags_" field of ArtMethod
			art_method_access_flags_ptr = art_method_ptr + config.offset_ArtMethod_access_flags_
			art_method_access_flags_value = memory.readMemory32(art_method_access_flags_ptr)
			if config.debug:
				print "[ClassModification] ArtMethod::access_flags_ = %#x (%s)" % (art_method_access_flags_value, config.resolve_access_flags(art_method_access_flags_value))
				
			# read the "dex_code_item_offset_" field of ArtMethod
			art_method_dex_code_item_offset_ptr = art_method_ptr + config.offset_ArtMethod_dex_code_item_offset_
			art_method_dex_code_item_offset_value = memory.readMemory32(art_method_dex_code_item_offset_ptr)
			if config.debug:
				print "[ClassModification] ArtMethod::dex_code_item_offset_ = %#x" % art_method_dex_code_item_offset_value
			
			# read the "dex_method_index_" field of ArtMethod
			art_method_dex_method_index_ptr = art_method_ptr + config.offset_ArtMethod_dex_method_index_
			art_method_dex_method_index_val = memory.readMemory32(art_method_dex_method_index_ptr)
			if config.debug:
				print "[ClassModification] ArtMethod::dex_method_index_ = %#x" % art_method_dex_method_index_val
				
			# resolve 
			string_ids_off = header_item.get_string_ids_off(dex_file_begin_val)
			type_ids_off = header_item.get_type_ids_off(dex_file_begin_val)
			proto_ids_off = header_item.get_proto_ids_off(dex_file_begin_val)
			method_ids_off = header_item.get_method_ids_off(dex_file_begin_val)
			
			class_idx = method_id_item.get_class_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
			class_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, class_idx)
			class_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, class_descriptor_idx)
			# if config.debug:
				# print "[ClassModification] class name = %s" % class_descriptor_content
				
			name_idx = method_id_item.get_name_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
			name_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, name_idx)
			# if config.debug:
				# print "[ClassModification] method name = %s" % name_content
			
			proto_idx = method_id_item.get_proto_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
			proto_return_type_idx = proto_id_item.get_return_type_idx(dex_file_begin_val, proto_ids_off, proto_idx)
			proto_return_type_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, proto_return_type_idx)
			proto_return_type_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, proto_return_type_descriptor_idx)
			# if config.debug:
				# print "[ClassModification] return type = %s" % proto_return_type_descriptor_content
			
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
			# if config.debug:
				# print "[ClassModification] parameters = %s" % parameters_content
			
			callee_method_signature = "%s %s->%s %s%s" % (config.resolve_method_access_flags(art_method_access_flags_value), class_descriptor_content, proto_return_type_descriptor_content, name_content, parameters_content)
			if config.debug:
				print "[ClassModification] method signature = %s" % callee_method_signature
		
		config.log_print("[ClassModification] current  callee signature = %s" % callee_method_signature)
		
		if callee_method_signature == previous_callee_method_signature:
			# resolve the mirror::Class structure
			suspicious_method_list = resolve_mirror_Class(caller_class_ptr)
			break  # jump out of the while-loop
	
	# -3-
	
	# make a comparison between the origin_method_list and the suspicous_method_list
	assert suspicious_method_list is not None
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
			
			method_signature = "%s %s->%s %s%s" % (config.resolve_method_access_flags(art_method_access_flags_value), class_descriptor_content, proto_return_type_descriptor_content, name_content, parameters_content)
			
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
	
	# enable the DoCall breakpoint
	for breakpoint_index in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		breakpoint_object = execution_state.getBreakpointService().getBreakpoint(breakpoint_index)
		if (int(breakpoint_object.getAddresses()[0]) & 0xffffffff) == config.brk_DoCall:
			breakpoint_object.enable()
	
	'''	
	# enable the InitClass breakpoint
	for breakpoint_index in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		breakpoint_object = execution_state.getBreakpointService().getBreakpoint(breakpoint_index)
		if (int(breakpoint_object.getAddresses()[0]) & 0xffffffff) == config.brk_InitClass:
			breakpoint_object.enable()
	'''
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	ClassModification()
	sys.exit()
