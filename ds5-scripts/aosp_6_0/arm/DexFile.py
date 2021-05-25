# DexFile.py is used to dump the dex file when the "DexFile::<init>" method is invoked in 32-bit mode.

import gc
import os
import sys

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import mmu
from DexParser import header_item, class_data_item
from OfflineDexParser import Dex

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


# define the analyzing configuration related to the DexFile loading
def dex_setup(pid):
	# define the breakpoints
	# DexFile related
	brk_DexFile_cmd = "hbreak" + " " + str(hex(config.brk_DexFile)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# brk_DexFile_cmd = "hbreak" + " " + str(hex(config.brk_DexFile)).replace('L', '')
	execution_state.executeDSCommand(brk_DexFile_cmd)

	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# DexFile related
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_DexFile:
			bs_DexFile_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.DexFile_script)
			execution_state.executeDSCommand(bs_DexFile_cmd)
			brk_object.enable()
	

# define the analyzing configuration related to the Java execution flow
def je_setup(pid):
	# define the breakpoints
	# execution flow related
	brk_ArtQuickToInterpreterBridge_cmd = "hbreak" + " " + str(hex(config.brk_ArtQuickToInterpreterBridge)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_ArtQuickToInterpreterBridge_cmd)
	# brk_ArtInterpreterToInterpreterBridge_cmd = "hbreak" + " " + str(hex(config.brk_ArtInterpreterToInterpreterBridge)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_ArtInterpreterToInterpreterBridge_cmd)
	# brk_ArtInterpreterToCompiledCodeBridge_cmd = "hbreak" + " " + str(hex(config.brk_ArtInterpreterToCompiledCodeBridge)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_ArtInterpreterToCompiledCodeBridge_cmd)
	brk_DoCall_cmd = "hbreak" + " " + str(hex(config.brk_DoCall)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_DoCall_cmd)
	brk_ArtQuickGenericJniTrampoline_cmd = "hbreak" + " " + str(hex(config.brk_ArtQuickGenericJniTrampoline)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_ArtQuickGenericJniTrampoline_cmd)
	brk_Invoke_cmd = "hbreak" + " " + str(hex(config.brk_Invoke)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_Invoke_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# execution flow related
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtQuickToInterpreterBridge:
			bs_ArtQuickToInterpreterBridge_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtQuickToInterpreterBridge_script)
			execution_state.executeDSCommand(bs_ArtQuickToInterpreterBridge_cmd)
			brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtInterpreterToInterpreterBridge:
			# bs_ArtInterpreterToInterpreterBridge_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtInterpreterToInterpreterBridge_script)
			# execution_state.executeDSCommand(bs_ArtInterpreterToInterpreterBridge_cmd)
			# brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtInterpreterToCompiledCodeBridge:
			# bs_ArtInterpreterToCompiledCodeBridge_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtInterpreterToCompiledCodeBridge_script)
			# execution_state.executeDSCommand(bs_ArtInterpreterToCompiledCodeBridge_cmd)
			# brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_DoCall:
			bs_DoCall_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.DoCall_script)
			execution_state.executeDSCommand(bs_DoCall_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtQuickGenericJniTrampoline:
			bs_ArtQuickGenericJniTrampoline_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtQuickGenericJniTrampoline_script)
			execution_state.executeDSCommand(bs_ArtQuickGenericJniTrampoline_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_Invoke:
			bs_Invoke_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.Invoke_script)
			execution_state.executeDSCommand(bs_Invoke_cmd)
			brk_object.enable()
			brk_object.ignore(0)


# define the analyzing configuration related to the Native execution flow		
def ne_setup(pid):
	# define the breakpoints
	# JNI_onLoad related
	brk_LoadNativeLibrary_cmd = "hbreak" + " " + str(hex(config.brk_LoadNativeLibrary)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_LoadNativeLibrary_cmd)
	brk_JNI_onLoad_cmd = "hbreak" + " " + str(hex(config.brk_JNI_onLoad)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_JNI_onLoad_cmd)
	# execution flow related
	brk_ArtQuickGenericJniTrampoline_cmd = "hbreak" + " " + str(hex(config.brk_ArtQuickGenericJniTrampoline)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_ArtQuickGenericJniTrampoline_cmd)
	brk_ArtQuickGenericJniEndTrampoline_cmd = "hbreak" + " " + str(hex(config.brk_ArtQuickGenericJniEndTrampoline)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_ArtQuickGenericJniEndTrampoline_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# JNI_onLoad related
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadNativeLibrary:
			bs_LoadNativeLibrary_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.LoadNativeLibrary_script)
			execution_state.executeDSCommand(bs_LoadNativeLibrary_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_JNI_onLoad:
			bs_JNI_onLoad_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.JNI_onLoad_script)
			execution_state.executeDSCommand(bs_JNI_onLoad_cmd)
			brk_object.enable()
		# execution flow related
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtQuickGenericJniTrampoline:
			bs_ArtQuickGenericJniTrampoline_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtQuickGenericJniTrampoline_script)
			execution_state.executeDSCommand(bs_ArtQuickGenericJniTrampoline_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtQuickGenericJniEndTrampoline:
			bs_ArtQuickGenericJniEndTrampoline_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtQuickGenericJniEndTrampoline_script)
			execution_state.executeDSCommand(bs_ArtQuickGenericJniEndTrampoline_cmd)
			brk_object.enable()
			
			
# define the analyzing configuration related to the Art-Runtime execution flow
def art_setup(pid):
	# define the breakpoints
	# execution flow related
	brk_LoadClassMembers_cmd = "hbreak" + " " + str(hex(config.brk_LoadClassMembers)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_LoadClassMembers_cmd)
	brk_LoadMethod_cmd = "hbreak" + " " + str(hex(config.brk_LoadMethod)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_LoadMethod_cmd)

	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# execution flow related
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadClassMembers:
			bs_LoadClassMembers_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.LoadClassMembers_script)
			execution_state.executeDSCommand(bs_LoadClassMembers_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadMethod:
			bs_LoadMethod_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.LoadMethod_script)
			execution_state.executeDSCommand(bs_LoadMethod_cmd)
			brk_object.enable()
			# brk_object.ignore(13)
		

# define the analyzing configuration related to the in-memory dex file modification
def dex_modification_setup(pid):
	# define the breakpoints
	# brk_DexModification_cmd = "hbreak" + " " + str(hex(config.brk_JNI_onLoad)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	brk_DexModification_cmd = "hbreak" + " " + str(hex(config.brk_ArtQuickGenericJniEndTrampoline)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_DexModification_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_JNI_onLoad:
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtQuickGenericJniEndTrampoline:
			bs_DexModification_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.DexModification_script)
			execution_state.executeDSCommand(bs_DexModification_cmd)
			brk_object.enable()
		
			
# define the analyzing configuration related to the Class-object modification
def class_modification_setup(pid):
	# define the breakpoints
	brk_ClassModification_cmd = "hbreak" + " " + str(hex(config.brk_DoCall)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_ClassModification_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_DoCall:
			bs_ClassModification_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ClassModification_script)
			execution_state.executeDSCommand(bs_ClassModification_cmd)
			brk_object.enable()
			
			
# define the analyzing configuration related to the anti-time-checking
def anti_time_checking_setup(pid):
	# define the breakpoints
	# brk_clock_gettime_cmd = "hbreak" + " " + str(hex(config.brk_clock_gettime)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_clock_gettime_cmd)
	brk_gettimeofday_cmd = "hbreak" + " " + str(hex(config.brk_gettimeofday)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_gettimeofday_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_clock_gettime:
			# bs_clock_gettime_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.clock_gettime_script)
			# execution_state.executeDSCommand(bs_clock_gettime_cmd)
			# brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_gettimeofday:
			bs_gettimeofday_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.gettimeofday_script)
			execution_state.executeDSCommand(bs_gettimeofday_cmd)
			brk_object.enable()
			
			
def anti_emulator(pid):
	# define the breakpoints
	brk_Invoke_cmd = "hbreak" + " " + str(hex(config.brk_Invoke)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_Invoke_cmd)
	brk_strcmp_cmd = "hbreak" + " " + str(hex(config.brk_strcmp)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_strcmp_cmd)
	brk_strncmp_cmd = "hbreak" + " " + str(hex(config.brk_strncmp)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_strncmp_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_Invoke:
			bs_Invoke_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.Invoke_script)
			execution_state.executeDSCommand(bs_Invoke_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_strcmp:
			bs_strcmp_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.strcmp_script)
			execution_state.executeDSCommand(bs_strcmp_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_strncmp:
			bs_strncmp_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.strncmp_script)
			execution_state.executeDSCommand(bs_strncmp_cmd)
			brk_object.enable()
			
			
def unpack_ali_2016(pid):
	dex_modification_setup(pid)
	
	
def unpack_baidu_2016(file_path, dex_file_base, dex_file_size):
	dex = Dex.Dex(file_path)
	for class_def_item in dex.class_defs.class_def_items:
		class_data_off = class_def_item.class_data_off
		if (class_data_off > dex_file_size) or (class_data_off < 0):
			# parse class_data_item
			static_fields_size_off = 0x0
			static_fields_size, length_static_fields_size = class_data_item.get_static_fields_size(dex_file_base, class_data_off, static_fields_size_off)
			config.log_print("[DexFile] [class_data_item] static_fields_size = %#x" % static_fields_size)
			
			instance_fields_size_off = static_fields_size_off + length_static_fields_size
			instance_fields_size, length_instance_fields_size = class_data_item.get_instance_fields_size(dex_file_base, class_data_off, instance_fields_size_off)
			config.log_print("[DexFile] [class_data_item] instance_fields_size = %#x" % instance_fields_size)
			
			direct_methods_size_off = instance_fields_size_off + length_instance_fields_size
			direct_methods_size, length_direct_methods_size = class_data_item.get_direct_methods_size(dex_file_base, class_data_off, direct_methods_size_off)
			config.log_print("[DexFile] [class_data_item] direct_methods_size = %#x" % direct_methods_size)
			
			virtual_methods_size_off = direct_methods_size_off + length_direct_methods_size
			virtual_methods_size, length_virtual_methods_size = class_data_item.get_virtual_methods_size(dex_file_base, class_data_off, virtual_methods_size_off)
			config.log_print("[DexFile] [class_data_item] virtual_methods_size = %#x" % virtual_methods_size)
			
			static_fields_off = virtual_methods_size_off + length_virtual_methods_size
			static_fields, length_static_fields = class_data_item.get_static_fields(dex_file_base, class_data_off, static_fields_off, static_fields_size)
			for idx in range(static_fields_size):
				config.log_print("[DexFile] [class_data_item] static_fields[%d].field_idx_diff = %#x" % (idx, static_fields[idx][0]))
				config.log_print("[DexFile] [class_data_item] static_fields[%d].access_flags = %0#10x" % (idx, static_fields[idx][1]))
			
			instance_fields_off = static_fields_off + length_static_fields
			instance_fields, length_instance_fields = class_data_item.get_instance_fields(dex_file_base, class_data_off, instance_fields_off, instance_fields_size)
			for idx in range(instance_fields_size):
				config.log_print("[DexFile] [class_data_item] instance_fields[%d].field_idx_diff = %#x" % (idx, instance_fields[idx][0]))
				config.log_print("[DexFile] [class_data_item] instance_fields[%d].access_flags = %0#10x" % (idx, instance_fields[idx][1]))

			direct_methods_off = instance_fields_off + length_instance_fields
			direct_methods, length_direct_methods = class_data_item.get_direct_methods(dex_file_base, class_data_off, direct_methods_off, direct_methods_size)
			for idx in range(direct_methods_size):
				config.log_print("[DexFile] [class_data_item] direct_methods[%d].method_idx_diff = %#x" % (idx, direct_methods[idx][0]))
				config.log_print("[DexFile] [class_data_item] direct_methods[%d].access_flags = %0#10x" % (idx, direct_methods[idx][1]))
				config.log_print("[DexFile] [class_data_item] direct_methods[%d].code_off = %0#10x" % (idx, direct_methods[idx][2]))
			
			virtual_methods_off = direct_methods_off + length_direct_methods
			virtual_methods, length_virtual_methods = class_data_item.get_virtual_methods(dex_file_base, class_data_off, virtual_methods_off, virtual_methods_size)
			for idx in range(virtual_methods_size):
				config.log_print("[DexFile] [class_data_item] virtual_methods[%d].method_idx_diff = %#x" % (idx, virtual_methods[idx][0]))
				config.log_print("[DexFile] [class_data_item] virtual_methods[%d].access_flags = %0#10x" % (idx, virtual_methods[idx][1]))
				config.log_print("[DexFile] [class_data_item] virtual_methods[%d].code_off = %0#10x" % (idx, virtual_methods[idx][2]))
			
			class_data_size = virtual_methods_off + length_virtual_methods
			
			file_path = os.path.join(config.workspace, config.dex_directory, "class_data_item_%0#10x.bin" % (class_data_off if class_data_off > 0 else (0xffffffff + class_data_off)))
			if not os.path.exists(file_path):
				file_format = "binary"
				file_vtl_start_address = (dex_file_base + class_data_off) & 0xffffffff
				file_vtl_end_address = ((dex_file_base + class_data_off) & 0xffffffff) + class_data_size - 0x1
				memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)

def unpack_bangcle_2016(pid):
	pass


def unpack_ijiami_2016(pid):
	art_setup(pid)
	anti_time_checking_setup(pid)
	

def unpack_qihoo_2016(pid):
	pass
	

# set the analyzing environment
def setup(pid):
	# if we re-enter the configuration process, we will perform some verifications
	if execution_state.getBreakpointService().getBreakpointCount() > 1:
		# we can infer that the base dex file has been loaded for more than once
		# further more, in normal cases, the pid for the DexFile breakpoint should remain the same
		info_breakpoint_cmd = "info breakpoints"
		breakpoint_info_list = execution_state.executeDSCommand(info_breakpoint_cmd).split('\n')
		for idx in range(len(breakpoint_info_list)):
			current_info = breakpoint_info_list[idx]
			if ("%0#10x" % config.brk_DexFile) in current_info:
				current_pid_info = breakpoint_info_list[idx + 2]
				if current_pid_info.strip().startswith("Only for Context ID "):
					previous_pid_string = current_pid_info.strip().replace("Only for Context ID ", "").replace(",", "")
					previous_pid = int(previous_pid_string)
					# in normal cases, we do nothing
					if previous_pid == pid:
						return
				break	
	
	# remove all current breakpoints
	try:
		debugger.removeAllBreakpoints()
	except DebugException:
		rm_brks = []
		for breakpoint_index in range(0, execution_state.getBreakpointService().getBreakpointCount()):
			breakpoint_object = execution_state.getBreakpointService().getBreakpoint(breakpoint_index)
			if breakpoint_object.isHardware() or ((int(breakpoint_object.getAddresses()[0]) & 0xffffffff) == config.brk_DexFile):
				rm_brks.append(breakpoint_object)
		for brk_obj in rm_brks:
			brk_obj.remove()
	
	# combination of different analyzing configurations
	dex_setup(pid)
	# je_setup(pid)
	# ne_setup(pid)
	# art_setup(pid)
	
	# class_modification_setup(pid)
	# anti_time_checking_setup(pid)
	# anti_emulator(pid)
	
	# unpack_ali_2016(pid)
	# unpack_bangcle_2016(pid)
	unpack_ijiami_2016(pid)
	# unpack_qihoo_2016(pid)


def retrieve_string_value(string_ptr):
	length_val = memory.readMemory32(string_ptr + config.offset_string_length)
	reference_ptr = memory.readMemory32(string_ptr + config.offset_string_reference)
	char_array = memory.retrieve_char_array(reference_ptr)
	
	return char_array
	
	
def cleanup():
	if mmu.page_table is not None:
		del mmu.page_table
		gc.collect()


def init_DexFile():
	# get the pointer that refers to the DexFile structure
	dex_file_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	
	# read the "begin_" field
	dex_file_begin_val = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	if config.debug:
		print "[DexFile] begin_ = %0#10x" % dex_file_begin_val
		
	# read the "size_" field
	dex_file_size_val = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	if config.debug:
		print "[DexFile] size_ = %#x" % dex_file_size_val
	
	# read the "location_" field
	dex_file_location_ptr = int(execution_state.getRegisterService().getValue("R3")) & 0xffffffff
	# retrieve the value of the std::string structure
	dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
	if config.debug:
		print "[DexFile] location_ = %s" % dex_file_location_string_val
		
	# if config.package_filter(dex_file_location_string_val) and dex_file_location_string_val.endswith("base.apk"):
	if config.package_filter(dex_file_location_string_val):
		pid_val = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff
		if config.debug:
			print "[DexFile] pid = %#x" % pid_val
		config.log_print("[DexFile] pid = %#x" % pid_val)
			
		setup(pid_val)
		
	# we only focus on the DexFile whose location is suspicious
	if not config.package_filter(dex_file_location_string_val):
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return
		
	# # parse the header_item of the dex file
	# header_item.parse_header_item(dex_file_begin_val)
	
	# # calculate the "size_" value from the "map_off" field of the header_item
	# dex_file_size_val_calc = 0x0
	# if config.package_filter(dex_file_location_string_val):
		# map_off = header_item.get_map_off(dex_file_begin_val)
		# map_list_ptr = dex_file_begin_val + map_off
		# map_list_size_val = memory.readMemory32(map_list_ptr + 0x0)
		# dex_file_size_val_calc = map_off + (0x4) + map_list_size_val * (0x2 + 0x2 + 0x4 + 0x4)
		
	# config.log_print("[DexFile] begin_ = %0#10x, size_ = %#x (inferring size = %#x), location_ = %s" % (dex_file_begin_val, dex_file_size_val, dex_file_size_val_calc, dex_file_location_string_val))
	config.log_print("[DexFile] begin_ = %0#10x, size_ = %#x, location_ = %s" % (dex_file_begin_val, dex_file_size_val, dex_file_location_string_val))
	config.save_dex_info(dex_file_begin_val, dex_file_size_val, dex_file_location_string_val.split("/")[-1])
	
	# dump the in-memory DexFile
	file_path = os.path.join(config.workspace, config.dex_directory, dex_file_location_string_val.split("/")[-1])
	file_format = "binary"
	file_vtl_start_address = dex_file_begin_val
	file_vtl_end_address = dex_file_begin_val + dex_file_size_val - 0x1
	file_path = memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	
	# unpack_baidu_2016(file_path, dex_file_begin_val, dex_file_size_val)
		
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	init_DexFile()
	sys.exit()
