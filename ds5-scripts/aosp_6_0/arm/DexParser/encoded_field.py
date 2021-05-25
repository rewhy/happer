# encoded_field.py is used to parse the encoded_field element of the dex file in 32-bit mode.

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import utility

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


offset_field_idx_diff = 0x0
offset_access_flags = 0x0


# this is a template
def parse_encoded_field(dex_file_off, class_data_off, encoded_field_off):
	encoded_field_ptr = (dex_file_off + class_data_off + encoded_field_off) & 0xffffffff
	
	# field_idx_diff
	offset_field_idx_diff = 0x0
	field_idx_diff, length_field_idx_diff = utility.readuleb128(encoded_field_ptr + offset_field_idx_diff)
	# access_flags
	offset_access_flags = offset_field_idx_diff + length_field_idx_diff
	access_flags, length_access_flags = utility.readuleb128(encoded_field_ptr + offset_access_flags)
	

def get_field_idx_diff(dex_file_off, class_data_off, encoded_field_off, field_idx_diff_off):
	encoded_field_ptr = (dex_file_off + class_data_off + encoded_field_off) & 0xffffffff
	
	field_idx_diff, length_field_idx_diff = utility.readuleb128(encoded_field_ptr + field_idx_diff_off)
	return field_idx_diff, length_field_idx_diff
	
	
def get_access_flags(dex_file_off, class_data_off, encoded_field_off, access_flags_off):
	encoded_field_ptr = (dex_file_off + class_data_off + encoded_field_off) & 0xffffffff
	
	access_flags, length_access_flags = utility.readuleb128(encoded_field_ptr + access_flags_off)
	return access_flags, length_access_flags