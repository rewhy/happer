# method_id_item.py is used to parse the method_id_item element of the dex file in 32-bit mode.

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


offset_class_idx = 0x0
offset_proto_idx = 0x2
offset_name_idx	 = 0x4


# this is a template
def parse_method_id_item(dex_file_off, method_ids_off, method_id):
	method_id_item_ptr = dex_file_off + method_ids_off + method_id * 0x8
	
	class_idx = memory.readMemory16(method_id_item_ptr + offset_class_idx)
	proto_idx = memory.readMemory16(method_id_item_ptr + offset_proto_idx)
	name_idx = memory.readMemory32(method_id_item_ptr + offset_name_idx)
	
	
def get_class_idx(dex_file_off, method_ids_off, method_id):
	method_id_item_ptr = dex_file_off + method_ids_off + method_id * 0x8
	return memory.readMemory16(method_id_item_ptr + offset_class_idx)
	
	
def get_proto_idx(dex_file_off, method_ids_off, method_id):
	method_id_item_ptr = dex_file_off + method_ids_off + method_id * 0x8
	return memory.readMemory16(method_id_item_ptr + offset_proto_idx)
	
	
def get_name_idx(dex_file_off, method_ids_off, method_id):
	method_id_item_ptr = dex_file_off + method_ids_off + method_id * 0x8
	return memory.readMemory32(method_id_item_ptr + offset_name_idx)