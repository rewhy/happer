# do_dlopen.py is used to ... when the do_dlopen method is invoked in 32-bit mode.

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


def cacheflush():
	svc_number = long(execution_state.getRegisterService().getValue("X0")) & 0xffffffffffffffffL
	assert svc_number == 0xF0002
	
	memory_start_address = long(execution_state.getRegisterService().getValue("X1")) & 0xffffffffffffffffL
	memory_end_address = long(execution_state.getRegisterService().getValue("X20")) & 0xffffffffffffffffL
	svc_ret_address = long(execution_state.getRegisterService().getValue("X22")) & 0xffffffff
	
	config.log_print("[svc] [__NR_clear_cache] start: %0#10x, end: %0#10x, ret: %0#10x" % (memory_start_address, memory_end_address, svc_ret_address))
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	cacheflush()
	sys.exit()
