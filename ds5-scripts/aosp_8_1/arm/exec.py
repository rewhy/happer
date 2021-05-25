
import gc
import os
import sys

import memory
import mmu

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def cleanup():
	if mmu.page_table is not None:
		del mmu.page_table
		gc.collect()

# MemRead  -> 1868
# MemWrite -> 18e8
if __name__ == '__main__':
	'''
	reg = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R3")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R4")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R5")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R6")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R7")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R8")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R9")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R10")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R11")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("R12")) & 0xffffffff
	reg = int(execution_state.getRegisterService().getValue("SP")) & 0xffffffff
	pc = int(execution_state.getRegisterService().getValue("PC")) & 0xffffffff
	lr = int(execution_state.getRegisterService().getValue("LR")) & 0xffffffff
	'''
	loop = 2
	while loop > 0:
		memory.dump("D:\\tmp.bin", "binary", 0xd49ef000, 0xd49ef000 + 0x6000 - 0x1)
		os.remove("D:\\tmp.bin")
		loop = loop - 1
	
	# cleanup()
	execution_state.getExecutionService().resume()
