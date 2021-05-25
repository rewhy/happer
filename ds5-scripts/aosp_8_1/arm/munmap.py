# munmap.py

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
	# disable the mmap breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_munmap:
			brk_object.disable()
			

def end_prolog():
	# enable the munmap breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_munmap:
			brk_object.enable()


def munmap():
	# -- HEAD -- #
	start_prolog()
	
	# -- BODY -- #
	
	# only focus on the invocation from app -> gettimeofday
	lr = int(execution_state.getRegisterService().getValue("LR")) & 0xffffffff
	if not config.in_app_range(lr):
		# -- TAIL -- #
		end_prolog()
		
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return
	
	# get parameters
	start = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	length = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	
	config.log_print("[munmap] start = %0#10x, length = %0#10x" % (start, length))
	
	# -- TAIL -- #
	end_prolog()
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	munmap()
	sys.exit()
