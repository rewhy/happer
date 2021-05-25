# wcscmp.py

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


def wcscmp():
	# p0 = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	# p0_str = memory.retrieve_char_array(p0)
	
	# p1 = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	# p1_str = memory.retrieve_char_array(p1)

	# if config.debug:
		# print "wcscmp(%s, %s)" % (p0_str, p1_str)
	# config.log_print("wcscmp(%s, %s)" % (p0_str, p1_str))
	
	# continue the execution of the target application
	# execution_state.getExecutionService().resume()
	cleanup
	return


if __name__ == '__main__':
	wcscmp()
	sys.exit()
