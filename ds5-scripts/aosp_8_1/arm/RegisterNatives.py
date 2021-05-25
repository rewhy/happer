# RegisterNatives.py is used to ... when the RegisterNatives method is invoked in 32-bit mode.

import gc
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
		

def RegisterNatives():
	class_ptr = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	methods_ptr = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	method_count = int(execution_state.getRegisterService().getValue("R3")) & 0xffffffff
	for idx in range(method_count):
		method_name_ptr = memory.readMemory32((methods_ptr + idx * 0xc) + 0x0)
		method_name_val = memory.retrieve_char_array(method_name_ptr)
		method_subsignature_ptr = memory.readMemory32((methods_ptr + idx * 0xc) + 0x4)
		method_subsignature_val = memory.retrieve_char_array(method_subsignature_ptr)
		method_pointer_ptr = (methods_ptr + idx * 0xc) + 0x8
		method_pointer_val = memory.readMemory32(method_pointer_ptr)
		config.log_print("[RegisterNatives] signature = %s%s, method_ptr = %0#10x" % (method_name_val, method_subsignature_val, method_pointer_val))

	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	RegisterNatives()
	sys.exit()
