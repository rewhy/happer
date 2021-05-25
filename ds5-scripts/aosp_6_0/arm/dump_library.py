# dump_library.py is temporarily used to dump the libc.so and libart.so

import os
import sys
import time

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()

page_size = 0x1000

def dump(path, start, end):
	libart_handler = open(os.path.join(config.workspace, "libart.so"), 'rb')
	dump_handler = open(path, 'wb')

	for idx in range((end - start) / page_size + 1):
		cur_start = start + idx * page_size
		
		raw_data = libart_handler.read(page_size)
		dump_data = None
		try:
			dump_data = debugger.readMemory(cur_start, page_size)
			if raw_data != dump_data:
				print hex(idx * page_size)
		except DebugException:
			dump_data = bytearray(page_size)
			
		dump_handler.write(dump_data)
		dump_handler.flush()
	
	dump_handler.close()
	return
	

if __name__ == '__main__':
	dump(os.path.join(config.workspace, config.libart_memory_directory, "libart_" + str(time.time())), config.libart_executable_start, config.libart_executable_end)
	sys.exit()