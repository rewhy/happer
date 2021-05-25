# android_log_write.py

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


def android_log_write():
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup
	return


if __name__ == '__main__':
	android_log_write()
	sys.exit()
