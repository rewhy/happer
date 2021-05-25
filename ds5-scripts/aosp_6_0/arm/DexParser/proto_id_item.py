# string_id_item.py is used to parse the string_id_item element of the dex file in 32-bit mode.

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


# proto_id_item
offset_shorty_idx = 0x0
offset_return_type_idx = 0x4
offset_parameters_off = 0x8
# type_list
offset_type_list_size = 0x0
offset_type_list_list = 0x4


# this is a template
def parse_proto_id_item(dex_file_off, proto_ids_off, proto_id):
	proto_id_item_ptr = dex_file_off + proto_ids_off + proto_id * 0xc
	
	shorty_idx = memory.readMemory32(proto_id_item_ptr + offset_shorty_idx)
	return_type_idx = memory.readMemory32(proto_id_item_ptr + offset_return_type_idx)
	
	parameters_off = memory.readMemory32(proto_id_item_ptr + offset_parameters_off)
	type_list_ptr = dex_file_off + parameters_off
	type_list_size = memory.readMemory32(type_list_ptr + offset_type_list_size)
	type_list_list_ptr = type_list_ptr + offset_type_list_list
	type_item_list = []
	for type_item_idx in range(type_list_size):
		type_idx = memory.readMemory16(type_list_list_ptr + type_item_idx * 0x2)
		type_item_list.append(type_idx)
	
	
def get_shorty_idx(dex_file_off, proto_ids_off, proto_id):
	proto_id_item_ptr = dex_file_off + proto_ids_off + proto_id * 0xc
	return memory.readMemory32(proto_id_item_ptr + offset_shorty_idx)
	
	
def get_return_type_idx(dex_file_off, proto_ids_off, proto_id):
	proto_id_item_ptr = dex_file_off + proto_ids_off + proto_id * 0xc
	return memory.readMemory32(proto_id_item_ptr + offset_return_type_idx)
	
	
def get_parameters_list(dex_file_off, proto_ids_off, proto_id):
	proto_id_item_ptr = dex_file_off + proto_ids_off + proto_id * 0xc
	
	parameters_off = memory.readMemory32(proto_id_item_ptr + offset_parameters_off)
	if parameters_off == 0:
		# it refers that this prototype has no parameters
		return []
	
	type_list_ptr = dex_file_off + parameters_off
	type_list_size = memory.readMemory32(type_list_ptr + offset_type_list_size)
	assert type_list_size < 100
	type_list_list_ptr = type_list_ptr + offset_type_list_list
	type_item_list = []
	for type_item_idx in range(type_list_size):
		type_idx = memory.readMemory16(type_list_list_ptr + type_item_idx * 0x2)
		type_item_list.append(type_idx)
		
	return type_item_list