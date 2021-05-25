# fopen.py

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
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_fopen:
			brk_object.disable()
			
			
def end_prolog():
	# enable the do_dlopen breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_fopen:
			brk_object.enable()


fgets_start 	= 0x0004374e
strstr_start 	= 0x00046574
def fopen():
	# -- HEAD -- #
	start_prolog()
			
	# -- BODY -- #
	
	pid = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff
	
	# -1-
	# read the "name" parameter
	path_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	path_val = "unknown"
	if path_ptr != 0x0:
		path_val = memory.retrieve_char_array(path_ptr)
	# config.log_print("[fopen] %s" % path_val)
	
	if path_val == ("/proc/%d/maps" % pid) or path_val == "/proc/self/maps":
		# goto the fgets method
		brk_fgets = config.libc_base + fgets_start - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_fgets)
		try:
			execution_state.getExecutionService().waitForStop(5000)  # wait for 5s
		except DebugException:
			# -- TAIL -- #
			end_prolog()
		
			# continue the execution of the target application
			cleanup()
			execution_state.getExecutionService().resume()
			return
			
		# goto the strstr method
		brk_strstr = config.libc_base + strstr_start - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_strstr)
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
		
		# config.log_print("[strstr-1] %s %s" % (first_string_val, second_string_val))
		if second_string_val != "@com.android.reverse-":
			# -- TAIL -- #
			end_prolog()
		
			# continue the execution of the target application
			cleanup()
			execution_state.getExecutionService().resume()
			return
			
		# goto the strstr method
		brk_strstr = config.libc_base + strstr_start - config.libc_file_offset + config.libc_memory_offset
		execution_state.getExecutionService().resumeTo(brk_strstr)
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
		
		# config.log_print("[strstr-2] %s %s" % (first_string_val, second_string_val))		
		if second_string_val == ".apk@classes.dex":
			config.log_print("[polyu] ADI-1 found !!!")
	else:
		pass
	
	# -- TAIL -- #
	end_prolog()
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	fopen()
	sys.exit()
