# encoded_method.py is used to parse the encoded_method element of the dex file in 32-bit mode.

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import utility

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


offset_method_idx_diff = 0x0
offset_access_flags = 0x0
offset_code_off = 0x0


# this is a template
def parse_encoded_field(dex_file_off, class_data_off, encoded_method_off):
	encoded_method_ptr = dex_file_off + class_data_off + encoded_method_off
	
	# field_idx_diff
	offset_method_idx_diff = 0x0
	method_idx_diff, length_method_idx_diff = utility.readuleb128(encoded_method_ptr + offset_method_idx_diff)
	# access_flags
	offset_access_flags = offset_method_idx_diff + length_method_idx_diff
	access_flags, length_access_flags = utility.readuleb128(encoded_method_ptr + offset_access_flags)
	# code_off
	offset_code_off = offset_access_flags + length_access_flags
	code_off, length_code_off = utility.readuleb128(encoded_method_ptr + offset_code_off)
	

def get_method_idx_diff(dex_file_off, class_data_off, encoded_method_off, method_idx_diff_off):
	encoded_method_ptr = dex_file_off + class_data_off + encoded_method_off
	
	method_idx_diff, length_method_idx_diff = utility.readuleb128(encoded_method_ptr + method_idx_diff_off)
	return method_idx_diff, length_method_idx_diff
	
	
def get_access_flags(dex_file_off, class_data_off, encoded_method_off, access_flags_off):
	encoded_method_ptr = dex_file_off + class_data_off + encoded_method_off
	
	access_flags, length_access_flags = utility.readuleb128(encoded_method_ptr + access_flags_off)
	return access_flags, length_access_flags
	
	
def get_code_off(dex_file_off, class_data_off, encoded_method_off, code_off_off):
	encoded_method_ptr = dex_file_off + class_data_off + encoded_method_off
	
	code_off, length_code_off = utility.readuleb128(encoded_method_ptr + code_off_off)
	return code_off, length_code_off