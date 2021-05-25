# type_id_item.py is used to parse the type_id_item element of the dex file in 32-bit mode.

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


offset_descriptor_idx = 0x0


# this is a template
def parse_type_id_item(dex_file_off, type_ids_off, type_id):
	type_id_item_ptr = dex_file_off + type_ids_off + type_id * 0x4
	
	descriptor_idx = memory.readMemory32(type_id_item_ptr + offset_descriptor_idx)
	
	
def get_descriptor_idx(dex_file_off, type_ids_off, type_id):
	type_id_item_ptr = dex_file_off + type_ids_off + type_id * 0x4
	return memory.readMemory32(type_id_item_ptr + offset_descriptor_idx)