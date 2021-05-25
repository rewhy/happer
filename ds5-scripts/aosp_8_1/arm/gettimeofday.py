# gettimeofday.py

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
		
		
def start_prolog():
	# disable the gettimeofday breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_gettimeofday:
			brk_object.disable()
			

def end_prolog():
	# enable the gettimeofday breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_gettimeofday:
			brk_object.enable()


TIME_INTERVAL = 100000L  # usec
def gettimeofday():
	# -- HEAD -- #
	start_prolog()
			
	# -- BODY -- #

	pid = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff
	
	# only focus on the invocation from app -> gettimeofday
	lr = int(execution_state.getRegisterService().getValue("LR")) & 0xffffffff
	if not config.in_app_range(lr):
		# -- TAIL -- #
		end_prolog()
		
		# continue the execution of the target application
		execution_state.getExecutionService().resume()
		cleanup()
		return

	# get timeval pointer
	timeval_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	if config.debug:
		print "[gettimeofday] pid = %#x, lr = %0#10x, timeval_ptr = %0#10x" % (pid, lr, timeval_ptr)
	config.log_print("[gettimeofday] pid = %#x, lr = %0#10x, timeval_ptr = %0#10x" % (pid, lr, timeval_ptr))
	
	brk_gettimeofday = config.libc_base + config.gettimeofday_end - config.libc_file_offset + config.libc_memory_offset
	execution_state.getExecutionService().resumeTo(brk_gettimeofday)
	try:
		execution_state.getExecutionService().waitForStop(60000)  # wait for 60s
	except DebugException:
		raise RuntimeError("wtf !!!")
	
	# obtain tv_sec value
	tv_sec_ptr = timeval_ptr + 0x0
	tv_sec = memory.readMemory32(tv_sec_ptr)
	
	# obtain tv_usec_value
	tv_usec_ptr = timeval_ptr + 0x4
	tv_usec = memory.readMemory32(tv_usec_ptr)

	if config.debug:
		print "[gettimeofday] (origin) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec)
	# config.log_print("[gettimeofday] (origin) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec))
	
	# anti time checking
	tv_sec_old, tv_usec_old = config.load_time_info()
	if tv_sec <= tv_sec_old:
		tv_sec = tv_sec_old + 0x1
	
	if tv_sec < tv_sec_old:
		# TODO: should raise an exception, but we just ignore it at this time
		assert False
	else:
		if tv_sec_old != 0 and tv_usec_old != 0:
			time_interval = (tv_sec * 1000000L + tv_usec) - (tv_sec_old * 1000000L + tv_usec_old)
			if time_interval > TIME_INTERVAL:
				tv_sec_new = int(((tv_sec_old * 1000000L + tv_usec_old) + TIME_INTERVAL) / 1000000L)
				tv_usec_new = int(((tv_sec_old * 1000000L + tv_usec_old) + TIME_INTERVAL) - (tv_sec_new * 1000000L))
				
				# verification
				time_old = tv_sec_old * 1000000L + tv_usec_old
				time_new = tv_sec_new * 1000000L + tv_usec_new
				assert time_new == (time_old + TIME_INTERVAL)
				
				time_memory_old = tv_sec_old * (2**32) * 0x1L + tv_usec_old
				print "[old] sec = %#x, usec = %#x, in-memory = %#x" % (tv_sec_old, tv_usec_old, time_memory_old)
				time_memory_new = tv_sec_new * (2**32) * 0x1L + tv_usec_new
				print "[new] sec = %#x, usec = %#x, in-memory = %#x" % (tv_sec_new, tv_usec_new, time_memory_new)
				
				config.save_time_info(tv_sec_new, tv_usec_new)
				
				memory_set_cmd = "memory set %0#10x 0 %#x" % (timeval_ptr + 0x0, tv_sec_new)
				execution_state.executeDSCommand(memory_set_cmd)
				memory_set_cmd = "memory set %0#10x 0 %#x" % (timeval_ptr + 0x4, tv_usec_new)
				execution_state.executeDSCommand(memory_set_cmd)
				
				# obtain tv_sec value
				tv_sec_ptr = timeval_ptr + 0x0
				tv_sec = memory.readMemory32(tv_sec_ptr)
				
				# obtain tv_usec_value
				tv_usec_ptr = timeval_ptr + 0x4
				tv_usec = memory.readMemory32(tv_usec_ptr)

				if config.debug:
					print "[gettimeofday] (adjust) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec)
				# config.log_print("[gettimeofday] (adjust) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec))
			else:
				config.save_time_info(tv_sec, tv_usec)
		elif tv_sec_old == 0 and tv_usec_old == 0:
			config.save_time_info(tv_sec, tv_usec)
		else:
			raise RuntimeError("invalid timeval valus !!!")
		
	# -- TAIL -- #
	end_prolog()
		
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	gettimeofday()
	sys.exit()
