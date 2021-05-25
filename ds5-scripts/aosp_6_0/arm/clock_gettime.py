# clock_gettime.py

import gc
import os
import sys

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory
import mmu
from DexParser import header_item

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def clock_gettime():
	print "[clock_gettime]"
	config.log_print("[clock_gettime]")
		
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	# cleanup()
	return


if __name__ == '__main__':
	clock_gettime()
	sys.exit()
