# LoadMethod_arm.py is used to .... when the "ClassLinker::LoadMethod" method is invoked in 32-bit mode.

import gc
import os
import sys

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


def LoadMethod():
	# -1-
	
	# get the "dst" parameter
	dst_ptr = int(execution_state.getRegisterService().getValue("SP")) + 0x4
	dst_val = memory.readMemory32(dst_ptr)
	if config.debug:
		print "[LoadMethod] dst = %0#10x" % dst_val
	
	# very strange !!!
	if (dst_val == 0x0) or (dst_val == 0x00000001):
		execution_state.getExecutionService().resume()
		return
	
	# get the return address of the LoadMethod
	brk_return_address = int(execution_state.getRegisterService().getValue("LR")) & 0xfffffffe
	if config.debug:
		print "[LoadMethod] return address = %0#10x" % brk_return_address
	
	# -2-
	
	# resume to the end of the LoadMethod
	brk_LoadMethod_end = config.libart_base + config.LoadMethod_end - config.libart_file_offset + config.libart_memory_offset
	execution_state.getExecutionService().resumeTo(brk_LoadMethod_end)
	try:
		execution_state.getExecutionService().waitForStop(120000)  # wait for 120s
	except DebugException:
		raise RuntimeError("wtf !!!")

	# get the pointer that refers to ArtMethod
	art_method_ptr = dst_val

	# read the "declaring_class_" field of ArtMethod
	art_method_declaring_class_ptr = art_method_ptr + config.offset_ArtMethod_declaring_class_
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
	if config.debug:
		print "[LoadMethod] ArtMethod::declaring_class_::dex_cache_::dex_file_::begin_ = %0#10x" % dex_file_begin_val
		
	# read the "size_" field of DexFile
	dex_file_size_ptr = dex_file_ptr + config.offset_DexFile_size_
	dex_file_size_val = memory.readMemory32(dex_file_size_ptr)
	if config.debug:
		print "[LoadMethod] ArtMethod::declaring_class_::dex_cache_::dex_file_::size_ = %#x" % dex_file_size_val

	# read the "location_" field of DexFile
	dex_file_location_ptr = dex_file_ptr + config.offset_DexFile_location_
	# retrieve the value of std::string
	dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
	if config.debug:
		print "[LoadMethod] ArtMethod::declaring_class_::dex_cache_::dex_file_::location_ = %s" % dex_file_location_string_val
	
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
		print "[LoadMethod] ArtMethod::access_flags_ = %#x (%s)" % (art_method_access_flags_value, config.resolve_access_flags(art_method_access_flags_value))
	
	# read the "dex_code_item_offset_" field of ArtMethod
	art_method_dex_code_item_offset_ptr = art_method_ptr + config.offset_ArtMethod_dex_code_item_offset_
	art_method_dex_code_item_offset_value = memory.readMemory32(art_method_dex_code_item_offset_ptr)
	if config.debug:
		print "[LoadMethod] ArtMethod::dex_code_item_offset_ = %#x" % art_method_dex_code_item_offset_value
	
	# read the "tries_size" field of the "DexFile::CodeItem" structure
	tries_size_off = ((dex_file_begin_val + art_method_dex_code_item_offset_value) & 0xffffffff) + config.offset_DexFile_CodeItem_tries_size_
	tries_size_val = memory.readMemory16(tries_size_off)
	if config.debug:
		print "[LoadMethod] ArtMethod::CodeItem::tries_size_ = %#x" % tries_size_val
		
	# read the "insns_size_in_code_units_" field of the "DexFile::CodeItem" structure
	code_item_insns_size_in_code_units_off = ((dex_file_begin_val + art_method_dex_code_item_offset_value) & 0xffffffff) + config.offset_DexFile_CodeItem_insns_size_in_code_units_
	code_item_insns_size_in_code_units_val = memory.readMemory32(code_item_insns_size_in_code_units_off)
	if config.debug:
		print "[LoadMethod] ArtMethod::CodeItem::insns_size_in_code_units_ = %#x" % code_item_insns_size_in_code_units_val
	
	# read the "dex_method_index_" field of ArtMethod
	art_method_dex_method_index_ptr = art_method_ptr + config.offset_ArtMethod_dex_method_index_
	art_method_dex_method_index_val = memory.readMemory32(art_method_dex_method_index_ptr)
	if config.debug:
		print "[LoadMethod] ArtMethod::dex_method_index_ = %#x" % art_method_dex_method_index_val
		
	# resolve 
	string_ids_off = header_item.get_string_ids_off(dex_file_begin_val)
	type_ids_off = header_item.get_type_ids_off(dex_file_begin_val)
	proto_ids_off = header_item.get_proto_ids_off(dex_file_begin_val)
	method_ids_off = header_item.get_method_ids_off(dex_file_begin_val)
	
	class_idx = method_id_item.get_class_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	class_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, class_idx)
	class_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, class_descriptor_idx)
	# if config.debug:
		# print "[LoadMethod] class name = %s" % class_descriptor_content
		
	name_idx = method_id_item.get_name_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	name_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, name_idx)
	# if config.debug:
		# print "[LoadMethod] method name = %s" % name_content
	
	proto_idx = method_id_item.get_proto_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	proto_return_type_idx = proto_id_item.get_return_type_idx(dex_file_begin_val, proto_ids_off, proto_idx)
	proto_return_type_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, proto_return_type_idx)
	proto_return_type_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, proto_return_type_descriptor_idx)
	# if config.debug:
		# print "[LoadMethod] return type = %s" % proto_return_type_descriptor_content
	
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
		# print "[DoCall] parameters = %s" % parameters_content
	
	method_signature = "%s %s->%s %s%s" % (config.resolve_method_access_flags(art_method_access_flags_value), class_descriptor_content, proto_return_type_descriptor_content, name_content, parameters_content)
	if config.debug:
		print "[LoadMethod] method signature = %s" % method_signature
		
	config.log_print("[LoadMethod] origin     method signature = %s" % method_signature)
	
	origin_ArtMethod_declaring_class = class_ptr
	origin_ArtMethod_access_flags = art_method_access_flags_value
	origin_ArtMethod_dex_code_item_offset = art_method_dex_code_item_offset_value
	origin_ArtMethod_dex_method_index = art_method_dex_method_index_val
	origin_ArtMethod_signature = method_signature
	
	# -3-
	
	# resume to the return address of the LoadMethod
	execution_state.getExecutionService().resumeTo(brk_return_address)
	try:
		execution_state.getExecutionService().waitForStop(120000)  # wait for 120s
	except DebugException:
		raise RuntimeError("wtf !!!")
	
	# read the "declaring_class_" field of ArtMethod
	art_method_declaring_class_ptr = art_method_ptr + config.offset_ArtMethod_declaring_class_
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
	if config.debug:
		print "[LoadMethod] ArtMethod::declaring_class_::dex_cache_::dex_file_::begin_ = %0#10x" % dex_file_begin_val
		
	# read the "size_" field of DexFile
	dex_file_size_ptr = dex_file_ptr + config.offset_DexFile_size_
	dex_file_size_val = memory.readMemory32(dex_file_size_ptr)
	if config.debug:
		print "[LoadMethod] ArtMethod::declaring_class_::dex_cache_::dex_file_::size_ = %#x" % dex_file_size_val

	# read the "location_" field of DexFile
	dex_file_location_ptr = dex_file_ptr + config.offset_DexFile_location_
	# retrieve the value of std::string
	dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
	if config.debug:
		print "[LoadMethod] ArtMethod::declaring_class_::dex_cache_::dex_file_::location_ = %s" % dex_file_location_string_val
	
	# # we only focus on the Java invocation appeared in the target package
	# if not config.package_filter(dex_file_location_string_val):
		# # continue the execution of the target application
		# execution_state.getExecutionService().resume()
		# cleanup()
		# return
	
	# read the "access_flags_" field of ArtMethod
	art_method_access_flags_ptr = art_method_ptr + config.offset_ArtMethod_access_flags_
	art_method_access_flags_value = memory.readMemory32(art_method_access_flags_ptr)
	if config.debug:
		print "[LoadMethod] ArtMethod::access_flags_ = %#x (%s)" % (art_method_access_flags_value, config.resolve_access_flags(art_method_access_flags_value))
	
	# read the "dex_code_item_offset_" field of ArtMethod
	art_method_dex_code_item_offset_ptr = art_method_ptr + config.offset_ArtMethod_dex_code_item_offset_
	art_method_dex_code_item_offset_value = memory.readMemory32(art_method_dex_code_item_offset_ptr)
	if config.debug:
		print "[LoadMethod] ArtMethod::dex_code_item_offset_ = %#x" % art_method_dex_code_item_offset_value
		
	# read the "tries_size" field of the "DexFile::CodeItem" structure
	tries_size_off = ((dex_file_begin_val + art_method_dex_code_item_offset_value) & 0xffffffff) + config.offset_DexFile_CodeItem_tries_size_
	tries_size_val = memory.readMemory16(tries_size_off)
	if config.debug:
		print "[LoadMethod] ArtMethod::CodeItem::tries_size_ = %#x" % tries_size_val
	
	# read the "insns_size_in_code_units_" field of the "DexFile::CodeItem" structure
	code_item_insns_size_in_code_units_off = ((dex_file_begin_val + art_method_dex_code_item_offset_value) & 0xffffffff) + config.offset_DexFile_CodeItem_insns_size_in_code_units_
	code_item_insns_size_in_code_units_val = memory.readMemory32(code_item_insns_size_in_code_units_off)
	if config.debug:
		print "[LoadMethod] ArtMethod::CodeItem::insns_size_in_code_units_ = %#x" % code_item_insns_size_in_code_units_val
	
	# read the "dex_method_index_" field of ArtMethod
	art_method_dex_method_index_ptr = art_method_ptr + config.offset_ArtMethod_dex_method_index_
	art_method_dex_method_index_val = memory.readMemory32(art_method_dex_method_index_ptr)
	if config.debug:
		print "[LoadMethod] ArtMethod::dex_method_index_ = %#x" % art_method_dex_method_index_val
		
	# resolve 
	string_ids_off = header_item.get_string_ids_off(dex_file_begin_val)
	type_ids_off = header_item.get_type_ids_off(dex_file_begin_val)
	proto_ids_off = header_item.get_proto_ids_off(dex_file_begin_val)
	method_ids_off = header_item.get_method_ids_off(dex_file_begin_val)
	
	class_idx = method_id_item.get_class_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	class_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, class_idx)
	class_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, class_descriptor_idx)
	# if config.debug:
		# print "[LoadMethod] class name = %s" % class_descriptor_content
		
	name_idx = method_id_item.get_name_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	name_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, name_idx)
	# if config.debug:
		# print "[LoadMethod] method name = %s" % name_content
	
	proto_idx = method_id_item.get_proto_idx(dex_file_begin_val, method_ids_off, art_method_dex_method_index_val)
	proto_return_type_idx = proto_id_item.get_return_type_idx(dex_file_begin_val, proto_ids_off, proto_idx)
	proto_return_type_descriptor_idx = type_id_item.get_descriptor_idx(dex_file_begin_val, type_ids_off, proto_return_type_idx)
	proto_return_type_descriptor_content = string_id_item.get_string_id_item_data(dex_file_begin_val, string_ids_off, proto_return_type_descriptor_idx)
	# if config.debug:
		# print "[LoadMethod] return type = %s" % proto_return_type_descriptor_content
	
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
		# print "[DoCall] parameters = %s" % parameters_content
	
	method_signature = "%s %s->%s %s%s" % (config.resolve_method_access_flags(art_method_access_flags_value), class_descriptor_content, proto_return_type_descriptor_content, name_content, parameters_content)
	if config.debug:
		print "[LoadMethod] method signature = %s" % method_signature
		
	config.log_print("[LoadMethod] suspicious method signature = %s" % method_signature)
	
	suspicious_ArtMethod_declaring_class = class_ptr
	suspicious_ArtMethod_access_flags = art_method_access_flags_value
	suspicious_ArtMethod_dex_code_item_offset = art_method_dex_code_item_offset_value
	suspicious_ArtMethod_dex_method_index = art_method_dex_method_index_val
	suspicious_ArtMethod_signature = method_signature
	
	# if (origin_ArtMethod_declaring_class != suspicious_ArtMethod_declaring_class) or \
	# (origin_ArtMethod_access_flags != suspicious_ArtMethod_access_flags) or \
	# (origin_ArtMethod_dex_code_item_offset != suspicious_ArtMethod_dex_code_item_offset):
		# config.log_print("[LoadMethod] hooked !!!")
		# assert origin_ArtMethod_dex_method_index == suspicious_ArtMethod_dex_method_index
		# config.log_print("[LoadMethod][origin]     declaring_class_ = %0#10x, access_flags_ = %#x, dex_code_item_offset_ = %0#10x" % (origin_ArtMethod_declaring_class, origin_ArtMethod_access_flags, origin_ArtMethod_dex_code_item_offset))
		# config.log_print("[LoadMethod][suspicious] declaring_class_ = %0#10x, access_flags_ = %#x, dex_code_item_offset_ = %0#10x" % (suspicious_ArtMethod_declaring_class, suspicious_ArtMethod_access_flags, suspicious_ArtMethod_dex_code_item_offset))

		# # dump the code_item on-demand
		# padding = 0x2 if (tries_size_val > 0) and (code_item_insns_size_in_code_units_val % 2 == 1) else 0x0
		# code_item_size = config.offset_DexFile_CodeItem_insns_size_in_code_units_ + 0x4 + 0x2 * code_item_insns_size_in_code_units_val + padding + 0x8 * tries_size_val
		# code_item_size = code_item_size + encoded_catch_handler_list.parse_encoded_catch_handler_list(dex_file_begin_val, suspicious_ArtMethod_dex_code_item_offset + code_item_size, tries_size_val)
		# file_path = os.path.join(config.workspace, config.dex_directory, "code_item_%#x_%0#10x.bin" % (origin_ArtMethod_dex_method_index, origin_ArtMethod_dex_code_item_offset))
		# file_format = "binary"
		# file_vtl_start_address = (dex_file_begin_val + suspicious_ArtMethod_dex_code_item_offset) & 0xffffffff
		# file_vtl_end_address = ((dex_file_begin_val + suspicious_ArtMethod_dex_code_item_offset) & 0xffffffff) + code_item_size - 0x1
		# memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
		
	# Notice: for ijiami-16, we force dump the code_item
	if (art_method_dex_code_item_offset_value != 0x0):
		padding = 0x2 if (tries_size_val > 0) and (code_item_insns_size_in_code_units_val % 2 == 1) else 0x0
		code_item_size = config.offset_DexFile_CodeItem_insns_size_in_code_units_ + 0x4 + 0x2 * code_item_insns_size_in_code_units_val + padding + 0x8 * tries_size_val
		code_item_size = code_item_size + encoded_catch_handler_list.parse_encoded_catch_handler_list(dex_file_begin_val, suspicious_ArtMethod_dex_code_item_offset + code_item_size, tries_size_val)
		file_path = os.path.join(config.workspace, config.dex_directory, "code_item_%#x_%0#10x.bin" % (origin_ArtMethod_dex_method_index, origin_ArtMethod_dex_code_item_offset))
		file_format = "binary"
		file_vtl_start_address = (dex_file_begin_val + suspicious_ArtMethod_dex_code_item_offset) & 0xffffffff
		file_vtl_end_address = ((dex_file_begin_val + suspicious_ArtMethod_dex_code_item_offset) & 0xffffffff) + code_item_size - 0x1
		memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
			
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	LoadMethod()
	sys.exit()
