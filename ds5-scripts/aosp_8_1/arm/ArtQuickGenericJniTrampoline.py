# ArtQuickGenericJniTrampoline.py is used to ... when a jni method is invoked in 32-bit mode.

import gc
import os
import sys

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


def ArtQuickGenericJniTrampoline():
	# -1- for callee
	
	# get the pointer that refers to ArtMethod*
	art_method_ptr_ptr = int(execution_state.getRegisterService().getValue("R1"))
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
		print "[ArtQuickGenericJniTrampoline] ArtMethod::declaring_class_::dex_cache_::dex_file_::begin_ = %0#10x" % dex_file_begin_val
		
	callee_method_signature = "unknown"
	if dex_file_begin_val == 0x0:
		pass
	else:
		# read the "size_" field of DexFile
		dex_file_size_ptr = dex_file_ptr + config.offset_DexFile_size_
		dex_file_size_val = memory.readMemory32(dex_file_size_ptr)
		if config.debug:
			print "[ArtQuickGenericJniTrampoline] ArtMethod::declaring_class_::dex_cache_::dex_file_::size_ = %#x" % dex_file_size_val

		# read the "location_" field of DexFile
		dex_file_location_ptr = dex_file_ptr + config.offset_DexFile_location_
		# retrieve the value of std::string
		dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
		if config.debug:
			print "[ArtQuickGenericJniTrampoline] ArtMethod::declaring_class_::dex_cache_::dex_file_::location_ = %s" % dex_file_location_string_val
		
		# we focus on the JNI method defined in the target packages
		if not config.package_filter(dex_file_location_string_val):
			# continue the execution of the target application
			execution_state.getExecutionService().resume()
			cleanup()
			return
			
		# read the "access_flags_" field of ArtMethod
		art_method_access_flags_ptr = art_method_ptr + config.offset_ArtMethod_access_flags_
		art_method_access_flags_value = memory.readMemory32(art_method_access_flags_ptr)
		if config.debug:
			print "[ArtQuickGenericJniTrampoline] ArtMethod::access_flags_ = %#x (%s)" % (art_method_access_flags_value, config.resolve_access_flags(art_method_access_flags_value))
			
		# read the "dex_code_item_offset_" field of ArtMethod
		art_method_dex_code_item_offset_ptr = art_method_ptr + config.offset_ArtMethod_dex_code_item_offset_
		art_method_dex_code_item_offset_value = memory.readMemory32(art_method_dex_code_item_offset_ptr)
		if config.debug:
			print "[ArtQuickGenericJniTrampoline] ArtMethod::dex_code_item_offset_ = %#x" % art_method_dex_code_item_offset_value
		
		# read the "dex_method_index_" field of ArtMethod
		art_method_dex_method_index_ptr = art_method_ptr + config.offset_ArtMethod_dex_method_index_
		art_method_dex_method_index_val = memory.readMemory32(art_method_dex_method_index_ptr)
		if config.debug:
			print "[ArtQuickGenericJniTrampoline] ArtMethod::dex_method_index_ = %#x" % art_method_dex_method_index_val
			
		# resolve 
		string_ids_off = header_item.get_string_ids_off(dex_file_begin_val)
		type_ids_off = header_item.get_type_ids_off(dex_file_begin_val)
		proto_ids_off = header_item.get_proto_ids_off(dex_file_begin_val)
		method_ids_off = header_item.get_method_ids_off(dex_file_begin_val)
		
		class_idx = method_id_item.get_class_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
		class_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, class_idx)
		class_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, class_descriptor_idx)
		# if config.debug:
			# print "[ArtQuickGenericJniTrampoline] class name = %s" % class_descriptor_content
			
		name_idx = method_id_item.get_name_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
		name_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, name_idx)
		# if config.debug:
			# print "[ArtQuickGenericJniTrampoline] method name = %s" % name_content
		
		proto_idx = method_id_item.get_proto_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
		proto_return_type_idx = proto_id_item.get_return_type_idx(dex_file_begin_val, proto_ids_off, proto_idx)
		proto_return_type_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, proto_return_type_idx)
		proto_return_type_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, proto_return_type_descriptor_idx)
		# if config.debug:
			# print "[ArtQuickGenericJniTrampoline] return type = %s" % proto_return_type_descriptor_content
		
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
			# print "[ArtQuickGenericJniTrampoline] parameters = %s" % parameters_content
		
		callee_method_signature = "%s %s->%s %s%s" % (config.resolve_method_access_flags(art_method_access_flags_value), class_descriptor_content, proto_return_type_descriptor_content, name_content, parameters_content)
		if config.debug:
			print "[ArtQuickGenericJniTrampoline] method signature = %s" % callee_method_signature
	
	config.log_print("[ArtQuickGenericJniTrampoline] callee signature = %s" % callee_method_signature)
	
	# it is unnecessary to dump the executable segments of libc.so and libart.so here
	
	# # start tracing
	# if config.trace:
		# trace_cmd = "trace start DSTREAM"
		# execution_state.executeDSCommand(trace_cmd)
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	ArtQuickGenericJniTrampoline()
	sys.exit()
