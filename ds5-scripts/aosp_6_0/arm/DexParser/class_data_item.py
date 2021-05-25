# class_data_item.py is used to parse the class_data_item element of the dex file in 32-bit mode.

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import utility

import encoded_field
import encoded_method

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


offset_static_fields_size = 0x0
offset_instance_fields_size = 0x0
offset_direct_methods_size = 0x0
offset_virtual_methods_size = 0x0
offset_static_fields = 0x0
offset_instance_fields = 0x0
offset_direct_methods = 0x0
offset_virtual_methods = 0x0


# this is a template
def parse_class_data_item(dex_file_off, class_data_off):
	class_data_item_ptr = (dex_file_off + class_data_off) & 0xffffffff
	
	# static_fields_size
	offset_static_fields_size = 0x0
	static_fields_size, length_static_fields_size = utility.readuleb128(class_data_item_ptr + offset_static_fields_size)
	# instance_fields_size
	offset_instance_fields_size = offset_static_fields_size + length_static_fields_size
	instance_fields_size, length_instance_fields_size = utility.readuleb128(class_data_item_ptr + offset_instance_fields_size)
	# direct_methods_size
	offset_direct_methods_size = offset_instance_fields_size + length_instance_fields_size
	direct_methods_size, length_direct_methods_size = utility.readuleb128(class_data_item_ptr + offset_direct_methods_size)
	# virtual_methods_size
	offset_virtual_methods_size = offset_direct_methods_size + length_direct_methods_size
	virtual_methods_size, length_virtual_methods_size = utility.readuleb128(class_data_item_ptr + offset_virtual_methods_size)
	# static_fields
	offset_static_fields = offset_virtual_methods_size + length_virtual_methods_size
	encoded_field_off = offset_static_fields
	for idx in range(static_fields_size):
		field_idx_diff_off = 0x0
		field_idx_diff, length_field_idx_diff = encoded_field.get_field_idx_diff(dex_file_off, class_data_off, encoded_field_off, field_idx_diff_off)
		access_flags_off = field_idx_diff_off + length_field_idx_diff
		access_flags, length_access_flags = encoded_field.get_access_flags(dex_file_off, class_data_off, encoded_field_off, access_flags_off)
		
		encoded_field_off = access_flags_off + length_access_flags
	# instance_fields
	offset_instance_fields = encoded_field_off
	encoded_field_off = offset_instance_fields
	for idx in range(instance_fields_size):
		field_idx_diff_off = 0x0
		field_idx_diff, length_field_idx_diff = encoded_field.get_field_idx_diff(dex_file_off, class_data_off, encoded_field_off, field_idx_diff_off)
		access_flags_off = field_idx_diff_off + length_field_idx_diff
		access_flags, length_access_flags = encoded_field.get_access_flags(dex_file_off, class_data_off, encoded_field_off, access_flags_off)
		
		encoded_field_off = access_flags_off + length_access_flags
	# direct_methods
	offset_direct_methods = encoded_field_off
	encoded_method_off = offset_direct_methods
	for idx in range(direct_methods_size):
		method_idx_diff_off = 0x0
		method_idx_diff, length_method_idx_diff = encoded_method.get_method_idx_diff(dex_file_off, class_data_off, encoded_method_off, method_idx_diff_off)
		access_flags_off = method_idx_diff_off + length_method_idx_diff
		access_flags, length_access_flags = encoded_method.get_access_flags(dex_file_off, class_data_off, encoded_method_off, access_flags_off)
		code_off_off = access_flags_off + length_access_flags
		code_off, length_code_off = encoded_method.get_code_off(dex_file_off, class_data_off, encoded_method_off, code_off_off)
		
		encoded_method_off = code_off_off + length_code_off
	# virtual_methods
	offset_virtual_methods = encoded_method_off
	encoded_method_off = offset_virtual_methods
	for idx in range(virtual_methods_size):
		method_idx_diff_off = 0x0
		method_idx_diff, length_method_idx_diff = encoded_method.get_method_idx_diff(dex_file_off, class_data_off, encoded_method_off, method_idx_diff_off)
		access_flags_off = method_idx_diff_off + length_method_idx_diff
		access_flags, length_access_flags = encoded_method.get_access_flags(dex_file_off, class_data_off, encoded_method_off, access_flags_off)
		code_off_off = access_flags_off + length_access_flags
		code_off, length_code_off = encoded_method.get_code_off(dex_file_off, class_data_off, encoded_method_off, code_off_off)
		
		encoded_method_off = code_off_off + length_code_off
		
		
def get_static_fields_size(dex_file_off, class_data_off, static_fields_size_off):
	class_data_item_ptr = (dex_file_off + class_data_off) & 0xffffffff
	
	static_fields_size, length_static_fields_size = utility.readuleb128(class_data_item_ptr + static_fields_size_off)
	return static_fields_size, length_static_fields_size
	
	
def get_instance_fields_size(dex_file_off, class_data_off, instance_fields_size_off):
	class_data_item_ptr = (dex_file_off + class_data_off) & 0xffffffff
	
	instance_fields_size, length_instance_fields_size = utility.readuleb128(class_data_item_ptr + instance_fields_size_off)
	return instance_fields_size, length_instance_fields_size
	

def get_direct_methods_size(dex_file_off, class_data_off, direct_methods_size_off):
	class_data_item_ptr = (dex_file_off + class_data_off) & 0xffffffff
	
	direct_methods_size, length_direct_methods_size = utility.readuleb128(class_data_item_ptr + direct_methods_size_off)
	return direct_methods_size, length_direct_methods_size
	
	
def get_virtual_methods_size(dex_file_off, class_data_off, virtual_methods_size_off):
	class_data_item_ptr = (dex_file_off + class_data_off) & 0xffffffff
	
	virtual_methods_size, length_virtual_methods_size = utility.readuleb128(class_data_item_ptr + virtual_methods_size_off)
	return virtual_methods_size, length_virtual_methods_size
	
	
def get_static_fields(dex_file_off, class_data_off, static_fields_off, static_fields_size):
	encoded_fields = []
	length_static_fields = 0x0

	encoded_field_off = static_fields_off
	for idx in range(static_fields_size):
		field_idx_diff_off = 0x0
		field_idx_diff, length_field_idx_diff = encoded_field.get_field_idx_diff(dex_file_off, class_data_off, encoded_field_off, field_idx_diff_off)
		access_flags_off = field_idx_diff_off + length_field_idx_diff
		access_flags, length_access_flags = encoded_field.get_access_flags(dex_file_off, class_data_off, encoded_field_off, access_flags_off)
		
		encoded_fields.append((field_idx_diff, access_flags))
		length_static_fields = length_static_fields + length_field_idx_diff + length_access_flags
		
		encoded_field_off = encoded_field_off + access_flags_off + length_access_flags
	
	return encoded_fields, length_static_fields
	
	
def get_instance_fields(dex_file_off, class_data_off, instance_fields_off, instance_fields_size):
	encoded_fields = []
	length_instance_fields = 0x0

	encoded_field_off = instance_fields_off
	for idx in range(instance_fields_size):
		field_idx_diff_off = 0x0
		field_idx_diff, length_field_idx_diff = encoded_field.get_field_idx_diff(dex_file_off, class_data_off, encoded_field_off, field_idx_diff_off)
		access_flags_off = field_idx_diff_off + length_field_idx_diff
		access_flags, length_access_flags = encoded_field.get_access_flags(dex_file_off, class_data_off, encoded_field_off, access_flags_off)
		
		encoded_fields.append((field_idx_diff, access_flags))
		length_instance_fields = length_instance_fields + length_field_idx_diff + length_access_flags
		
		encoded_field_off = encoded_field_off + access_flags_off + length_access_flags
	
	return encoded_fields, length_instance_fields
	
	
def get_direct_methods(dex_file_off, class_data_off, direct_methods_off, direct_methods_size):
	encoded_methods = []
	length_direct_methods = 0x0
	
	encoded_method_off = direct_methods_off
	for idx in range(direct_methods_size):
		method_idx_diff_off = 0x0
		method_idx_diff, length_method_idx_diff = encoded_method.get_method_idx_diff(dex_file_off, class_data_off, encoded_method_off, method_idx_diff_off)
		access_flags_off = method_idx_diff_off + length_method_idx_diff
		access_flags, length_access_flags = encoded_method.get_access_flags(dex_file_off, class_data_off, encoded_method_off, access_flags_off)
		code_off_off = access_flags_off + length_access_flags
		code_off, length_code_off = encoded_method.get_code_off(dex_file_off, class_data_off, encoded_method_off, code_off_off)
		
		encoded_methods.append((method_idx_diff, access_flags, code_off))
		length_direct_methods = length_direct_methods + length_method_idx_diff + length_access_flags + length_code_off
		
		encoded_method_off = encoded_method_off + code_off_off + length_code_off
	
	return encoded_methods, length_direct_methods
	
	
def get_virtual_methods(dex_file_off, class_data_off, virtual_methods_off, virtual_methods_size):
	encoded_methods = []
	length_virtual_methods = 0x0
	
	encoded_method_off = virtual_methods_off
	for idx in range(virtual_methods_size):
		method_idx_diff_off = 0x0
		method_idx_diff, length_method_idx_diff = encoded_method.get_method_idx_diff(dex_file_off, class_data_off, encoded_method_off, method_idx_diff_off)
		access_flags_off = method_idx_diff_off + length_method_idx_diff
		access_flags, length_access_flags = encoded_method.get_access_flags(dex_file_off, class_data_off, encoded_method_off, access_flags_off)
		code_off_off = access_flags_off + length_access_flags
		code_off, length_code_off = encoded_method.get_code_off(dex_file_off, class_data_off, encoded_method_off, code_off_off)
		
		encoded_methods.append((method_idx_diff, access_flags, code_off))
		length_virtual_methods = length_virtual_methods + length_method_idx_diff + length_access_flags + length_code_off
		
		encoded_method_off = encoded_method_off + code_off_off + length_code_off
	
	return encoded_methods, length_virtual_methods
