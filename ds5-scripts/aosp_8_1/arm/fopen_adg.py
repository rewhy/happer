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


strncmp_start 	= 0x0003ce58
fgets_start 	= 0x0004374e
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
	
	if path_val == ("/proc/%d/status" % pid) or path_val == "/proc/self/status":
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
		
		if first_string_val == "TracerPid" or second_string_val == "TracerPid":
			config.log_print("[polyu] ADG-3 found !!!")
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
