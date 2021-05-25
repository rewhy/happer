# string_id_item.py is used to parse the string_id_item element of the dex file in 32-bit mode.

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import utility

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


# string_id_item
offset_string_data_off = 0x0
# string_data_item
offset_utf16_size_off = 0x0
offset_data_off = None


# this is a template
def parse_string_id_item(dex_file_off, string_ids_off, string_id):
	string_data_item_ptr = dex_file_off + string_ids_off + string_id * 0x4
	string_data_item_off = memory.readMemory32(string_data_item_ptr + offset_string_data_off)
	
	utf16_size, offset_data_off = utility.readuleb128(dex_file_off + string_data_item_off + offset_utf16_size_off)
	data = memory.retrieve_char_array(dex_file_off + string_data_item_off + offset_data_off)
	
	
def get_string_id_item_data(dex_file_off, string_ids_off, string_id):
	string_data_item_ptr = dex_file_off + string_ids_off + string_id * 0x4
	string_data_item_off = memory.readMemory32(string_data_item_ptr + offset_string_data_off)
	
	utf16_size, offset_data_off = utility.readuleb128(dex_file_off + string_data_item_off + offset_utf16_size_off)
	
	data = memory.retrieve_char_array(dex_file_off + string_data_item_off + offset_data_off)
	return data