# open.py is used to ... when the open method is invoked in 32-bit mode.

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
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_open:
			brk_object.disable()
			
			
def end_prolog():
	# enable the do_dlopen breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_open:
			brk_object.enable()


def open():
	# -- HEAD -- #
	start_prolog()
			
	# -- BODY -- #
	
	path_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	path_val = memory.retrieve_char_array(path_ptr)
	if config.debug:
		print "[open] path = %s" % path_val
	config.log_print("[open] path = %s" % path_val)
		
	# -- TAIL -- #
	end_prolog()
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	open()
	sys.exit()
