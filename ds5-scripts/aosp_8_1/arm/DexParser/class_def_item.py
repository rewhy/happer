# class_def_item.py is used to parse the class_def_item element of the dex file in 32-bit mode.

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


offset_class_idx = 0x0


# this is a template
def parse_class_def_item(dex_file_off, class_defs_off, class_def_id):
	class_def_item_ptr = dex_file_off + class_defs_off + class_def_id * 0x20
	
	class_idx = memory.readMemory32(class_def_item_ptr + offset_class_idx)
	
	
def get_class_idx(dex_file_off, class_defs_off, class_def_id):
	class_def_item_ptr = dex_file_off + class_defs_off + class_def_id * 0x20
	return memory.readMemory32(class_def_item_ptr + offset_class_idx)