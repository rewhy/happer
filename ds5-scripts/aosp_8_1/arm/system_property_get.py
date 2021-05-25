# system_property_get.py

import gc
import os
import sys
import time

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import mmu

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def cleanup():
	if mmu.page_table is not None:
		del mmu.page_table
		gc.collect()
		

def start_prolog():
	# disable the do_dlopen breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_system_property_get:
			brk_object.disable()
			
			
def end_prolog():
	# enable the do_dlopen breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_system_property_get:
			brk_object.enable()


strncmp_start 	= 0x0003ce58
def system_property_get():
	# -- HEAD -- #
	start_prolog()
			
	# -- BODY -- #
	pid = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff
	
	# -1-
	# read the "name" parameter
	name_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	name_val = "unknown"
	if name_ptr != 0x0:
		name_val = memory.retrieve_char_array(name_ptr)
	# config.log_print("%s" % name_val)
	
	if name_val == "init.svc.qemud" or name_val == "init.svc.qemu-props" or name_val == "qemu.hw.mainkeys" or name_val == "qemu.sf.fake_camera" or name_val == "qemu.sf.lcd_density" or name_val == "ro.kernel.qemu" or name_val == "ro.kernel.android.qemud" or name_val == "ro.kernel.qemu.gles":
		config.log_print("[polyu] AEU-2 found !!!")
	elif name_val == "ro.bootloader" or name_val == "ro.bootmode":
		# goto the end of system_property_get method
		brk_system_property_get = config.libc_base + config.system_property_get_end - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_system_property_get)
		try:
			execution_state.getExecutionService().waitForStop(5000)  # wait for 5s
		except DebugException:
			raise RuntimeError
			
		# goto the strncmp method
		brk_strncmp = config.libc_base + strncmp_start - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_strncmp)
		try:
			execution_state.getExecutionService().waitForStop(5000)  # wait for 5s
		except DebugException:
			# -- TAIL -- #
			end_prolog()
		
			# continue the execution of the target application
			cleanup()
			execution_state.getExecutionService().resume()
			return
		
		first_string_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
		first_string_val = "??"
		if first_string_ptr != 0x0:
			first_string_val = memory.retrieve_char_array(first_string_ptr)
		second_string_ptr = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
		second_string_val = "??"
		if second_string_ptr != 0x0:
			second_string_val = memory.retrieve_char_array(second_string_ptr)
		
		# config.log_print("%s %s" % (first_string_val, second_string_val))
		if first_string_val == "unknown" or second_string_val == "unknown":
			config.log_print("[polyu] AEU-3-a found !!!")
	elif name_val == "ro.hardware":
		# goto the end of system_property_get method
		brk_system_property_get = config.libc_base + config.system_property_get_end - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_system_property_get)
		try:
			execution_state.getExecutionService().waitForStop(5000)  # wait for 5s
		except DebugException:
			raise RuntimeError
		
		# goto the strncmp method
		brk_strncmp = config.libc_base + strncmp_start - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_strncmp)
		try:
			execution_state.getExecutionService().waitForStop(5000)  # wait for 5s
		except DebugException:
			# -- TAIL -- #
			end_prolog()
		
			# continue the execution of the target application
			cleanup()
			execution_state.getExecutionService().resume()
			return
		
		first_string_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
		first_string_val = "??"
		if first_string_ptr != 0x0:
			first_string_val = memory.retrieve_char_array(first_string_ptr)
		second_string_ptr = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
		second_string_val = "??"
		if second_string_ptr != 0x0:
			second_string_val = memory.retrieve_char_array(second_string_ptr)
	
		# config.log_print("%s %s" % (first_string_val, second_string_val))
		if first_string_val == "goldfish" or second_string_val == "goldfish":
			config.log_print("[polyu] AEU-3-b found !!!")
	elif name_val == "ro.product.device":
		# goto the end of system_property_get method
		brk_system_property_get = config.libc_base + config.system_property_get_end - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_system_property_get)
		try:
			execution_state.getExecutionService().waitForStop(5000)  # wait for 5s
		except DebugException:
			raise RuntimeError
			
		# goto the strncmp method
		brk_strncmp = config.libc_base + strncmp_start - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_strncmp)
		try:
			execution_state.getExecutionService().waitForStop(5000)  # wait for 5s
		except DebugException:
			# -- TAIL -- #
			end_prolog()
		
			# continue the execution of the target application
			cleanup()
			execution_state.getExecutionService().resume()
			return
		
		first_string_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
		first_string_val = "??"
		if first_string_ptr != 0x0:
			first_string_val = memory.retrieve_char_array(first_string_ptr)
		second_string_ptr = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
		second_string_val = "??"
		if second_string_ptr != 0x0:
			second_string_val = memory.retrieve_char_array(second_string_ptr)
	
		# config.log_print("%s %s" % (first_string_val, second_string_val))
		if first_string_val == "generic" or second_string_val == "generic":
			config.log_print("[polyu] AEU-3-c found !!!")
	elif name_val == "ro.product.model" or name_val == "ro.product.name":
		# goto the end of system_property_get method
		brk_system_property_get = config.libc_base + config.system_property_get_end - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_system_property_get)
		try:
			execution_state.getExecutionService().waitForStop(5000)  # wait for 5s
		except DebugException:
			raise RuntimeError
			
		# goto the strncmp method
		brk_strncmp = config.libc_base + strncmp_start - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_strncmp)
		try:
			execution_state.getExecutionService().waitForStop(5000)  # wait for 5s
		except DebugException:
			# -- TAIL -- #
			end_prolog()
		
			# continue the execution of the target application
			cleanup()
			execution_state.getExecutionService().resume()
			return
		
		first_string_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
		first_string_val = "??"
		if first_string_ptr != 0x0:
			first_string_val = memory.retrieve_char_array(first_string_ptr)
		second_string_ptr = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
		second_string_val = "??"
		if second_string_ptr != 0x0:
			second_string_val = memory.retrieve_char_array(second_string_ptr)
	
		# config.log_print("%s %s" % (first_string_val, second_string_val))
		if first_string_val == "sdk" or second_string_val == "sdk":
			config.log_print("[polyu] AEU-3-d found !!!")
	else:
		pass
	
	# -- TAIL -- #
	end_prolog()
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	system_property_get()
	sys.exit()
