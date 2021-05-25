#  of the dex file in 32-bit mode.

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
def parse_encoded_catch_handler_list(dex_file_off, encoded_catch_handler_list_off, tries_size):
	if tries_size == 0x0:
		return 0x0

	encoded_catch_handler_list_ptr = (dex_file_off + encoded_catch_handler_list_off) & 0xffffffff
	
	# size
	offset_size = 0x0
	size, length_size = utility.readuleb128(encoded_catch_handler_list_ptr + offset_size)
	print "[encoded_catch_handler_list] size = %#x" % size
	
	offset_catch_handler = offset_size + length_size
	length_catch_handler = 0x0
	# encoded_catch_handler list
	encoded_catch_handler_ptr = encoded_catch_handler_list_ptr + offset_catch_handler
	for handler_idx in range(size):
		offset_size = 0x0
		size, length_size = utility.readsleb128(encoded_catch_handler_ptr + offset_size)
		print "[encoded_catch_handler] (idx = %#x) size = %#x" % (handler_idx, size)
		
		offset_encoded_type_addr_pair = offset_size + length_size
		length_encoded_type_addr_pair = 0x0
		# encoded_type_addr_pair
		encoded_type_addr_pair_ptr = encoded_catch_handler_ptr + offset_encoded_type_addr_pair
		for pair_idx in range(abs(size)):
			off_type_idx = 0x0
			type_idx, length_type_idx = utility.readuleb128(encoded_type_addr_pair_ptr + off_type_idx)
			off_addr = off_type_idx + length_type_idx
			addr, length_addr = utility.readuleb128(encoded_type_addr_pair_ptr + off_addr)
			print "[encoded_type_addr_pair] (idx = %#x) (pair_idx = %#x) type_idx = %#x, addr = %#x" % (handler_idx, pair_idx, type_idx, addr)
			# update length_encoded_type_addr_pair, encoded_type_addr_pair_ptr
			length_encoded_type_addr_pair = length_encoded_type_addr_pair + length_type_idx + length_addr
			encoded_type_addr_pair_ptr = encoded_type_addr_pair_ptr + length_type_idx + length_addr
		
		offset_catch_all_addr = offset_encoded_type_addr_pair + length_encoded_type_addr_pair
		length_catch_all_addr = 0x0
		if size <= 0:
			catch_all_addr, length_catch_all_addr = utility.readuleb128(encoded_catch_handler_ptr + offset_catch_all_addr)
			print "[encoded_catch_handler] (idx = %#x) catch_all_addr = %#x" % (handler_idx, catch_all_addr)
			
		# update length_catch_handler, encoded_catch_handler_ptr
		length_catch_handler = length_catch_handler + length_size + length_encoded_type_addr_pair + length_catch_all_addr
		encoded_catch_handler_ptr = encoded_catch_handler_ptr + length_size + length_encoded_type_addr_pair + length_catch_all_addr
		
	return length_size + length_catch_handler