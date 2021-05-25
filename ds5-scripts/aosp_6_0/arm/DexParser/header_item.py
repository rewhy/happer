# header_item.py is used to parse the head_item element of the dex file in 32-bit mode.

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def byte_array_to_hex_string(byte_array):
	hex_string = ""
	for byte in byte_array:
		hex_string = hex_string + ("%02x" % (int(byte) & 0xff))
	return hex_string


offset_magic 			= 0x0
offset_checksum 		= 0x8
offset_signature 		= 0x8+0x4
offset_file_size 		= 0x8+0x4+0x14
offset_header_size 		= 0x8+0x4+0x14+0x4
offset_endian_tag 		= 0x8+0x4+0x14+0x4+0x4
offset_link_size 		= 0x8+0x4+0x14+0x4+0x4+0x4
offset_link_off 		= 0x8+0x4+0x14+0x4+0x4+0x4+0x4
offset_map_off 			= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4
offset_string_ids_size 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4
offset_string_ids_off 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_type_ids_size 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_type_ids_off 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_proto_ids_size 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_proto_ids_off 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_field_ids_size 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_field_ids_off 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_method_ids_size 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_method_ids_off 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_class_defs_size 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_class_defs_off 	= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_data_size 		= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4
offset_data_off 		= 0x8+0x4+0x14+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4+0x4

def parse_header_item(header_item_ptr):
	magic 				= memory.retrieve_byte_array(header_item_ptr + offset_magic, 0x8)
	checksum 			= memory.readMemory32(header_item_ptr + offset_checksum)
	signature			= memory.retrieve_byte_array(header_item_ptr + offset_signature, 0x14)
	file_szie 			= memory.readMemory32(header_item_ptr + offset_file_size)
	header_size 		= memory.readMemory32(header_item_ptr + offset_header_size)
	assert header_size == 0x70
	endian_tag 			= memory.readMemory32(header_item_ptr + offset_endian_tag)
	link_size			= memory.readMemory32(header_item_ptr + offset_link_size)
	link_off			= memory.readMemory32(header_item_ptr + offset_link_off)
	map_off				= memory.readMemory32(header_item_ptr + offset_map_off)
	string_ids_size 	= memory.readMemory32(header_item_ptr + offset_string_ids_size)
	string_ids_off		= memory.readMemory32(header_item_ptr + offset_string_ids_off)
	type_ids_size 		= memory.readMemory32(header_item_ptr + offset_type_ids_size)
	type_ids_off		= memory.readMemory32(header_item_ptr + offset_type_ids_off)
	proto_ids_size 		= memory.readMemory32(header_item_ptr + offset_proto_ids_size)
	proto_ids_off		= memory.readMemory32(header_item_ptr + offset_proto_ids_off)
	field_ids_size 		= memory.readMemory32(header_item_ptr + offset_field_ids_size)
	field_ids_off		= memory.readMemory32(header_item_ptr + offset_field_ids_off)
	method_ids_size 	= memory.readMemory32(header_item_ptr + offset_method_ids_size)
	method_ids_off		= memory.readMemory32(header_item_ptr + offset_method_ids_off)
	class_defs_size 	= memory.readMemory32(header_item_ptr + offset_class_defs_size)
	class_defs_off		= memory.readMemory32(header_item_ptr + offset_class_defs_off)
	data_size 			= memory.readMemory32(header_item_ptr + offset_data_size)
	data_off			= memory.readMemory32(header_item_ptr + offset_data_off)
	
	if config.debug:
		print "[header_item] magic = %s" 			% byte_array_to_hex_string(magic)
		print "[header_item] checksum = %#x" 		% checksum
		print "[header_item] signature = %s" 		% byte_array_to_hex_string(signature)
		print "[header_item] file_szie = %#x" 		% file_szie
		print "[header_item] header_size = %#x" 	% header_size
		print "[header_item] endian_tag = %#x" 		% endian_tag
		print "[header_item] link_size = %#x" 		% link_size
		print "[header_item] link_off = %#x" 		% link_off
		print "[header_item] map_off = %#x" 		% map_off
		print "[header_item] string_ids_size = %#x" % string_ids_size
		print "[header_item] string_ids_off = %#x" 	% string_ids_off
		print "[header_item] type_ids_size = %#x" 	% type_ids_size
		print "[header_item] type_ids_off = %#x" 	% type_ids_off
		print "[header_item] proto_ids_size = %#x" 	% proto_ids_size
		print "[header_item] proto_ids_off = %#x" 	% proto_ids_off
		print "[header_item] field_ids_size = %#x" 	% field_ids_size
		print "[header_item] field_ids_off = %#x" 	% field_ids_off
		print "[header_item] method_ids_size = %#x" % method_ids_size
		print "[header_item] method_ids_off = %#x" 	% method_ids_off
		print "[header_item] class_defs_size = %#x" % class_defs_size
		print "[header_item] class_defs_off = %#x" 	% class_defs_off
		print "[header_item] data_size = %#x" 		% data_size
		print "[header_item] data_off = %#x" 		% data_off
		
		
def get_map_off(header_item_ptr):
	return memory.readMemory32(header_item_ptr + offset_map_off)
		
		
def get_string_ids_off(header_item_ptr):
	return memory.readMemory32(header_item_ptr + offset_string_ids_off)
	
	
def get_type_ids_off(header_item_ptr):
	return memory.readMemory32(header_item_ptr + offset_type_ids_off)
	
	
def get_proto_ids_off(header_item_ptr):
	return memory.readMemory32(header_item_ptr + offset_proto_ids_off)
	

def get_method_ids_off(header_item_ptr):
	return memory.readMemory32(header_item_ptr + offset_method_ids_off)
	