# strncmp.py

import gc
import os
import sys

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


def strncmp():
	p0 = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	p0_str = memory.retrieve_char_array(p0)
	
	p1 = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	p1_str = memory.retrieve_char_array(p1)
	
	p2 = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff

	if config.debug:
		print "strncmp(%s, %s, %#x)" % (p0_str, p1_str, p2)
	config.log_print("strncmp(%s, %s, %#x)" % (p0_str, p1_str, p2))
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup
	return


if __name__ == '__main__':
	strncmp()
	sys.exit()
