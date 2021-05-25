# time.py

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
	# disable the time breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_time:
			brk_object.disable()
			

def end_prolog():
	# enable the time breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_time:
			brk_object.enable()


TIME_INTERVAL = 1000000L  # usec
def time():
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
	time_t_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	if config.debug:
		print "[time] pid = %#x, lr = %0#10x, time_t_ptr = %0#10x" % (pid, lr, time_t_ptr)
	config.log_print("[time] pid = %#x, lr = %0#10x, time_t_ptr = %0#10x" % (pid, lr, time_t_ptr))
	
	brk_time = config.libc_base + config.time_end - config.libc_file_offset + config.libc_memory_offset
	execution_state.getExecutionService().resumeTo(brk_time)
	try:
		execution_state.getExecutionService().waitForStop(60000)  # wait for 60s
	except DebugException:
		raise RuntimeError("wtf !!!")
		
	# obtain the obtained value
	tv_sec = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	tv_usec = 0x0
	if config.debug:
		print "[time] (origin) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec)
	# config.log_print("[time] (origin) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec))
	
	# anti time checking
	tv_sec_old, tv_usec_old = config.load_time_info()
	if tv_sec <= tv_sec_old:
		tv_sec = tv_sec_old + 0x1
	
	if tv_sec < tv_sec_old:
		# TODO: should raise an exception, but we just ignore it at this time
		assert False
	else:
		if tv_sec_old != 0:
			time_interval = (tv_sec * 1000000L) - (tv_sec_old * 1000000L)
			if time_interval > TIME_INTERVAL:
				tv_sec_new = int(((tv_sec_old * 1000000L) + TIME_INTERVAL) / 1000000L)
				tv_usec_new = int(((tv_sec_old * 1000000L) + TIME_INTERVAL) - (tv_sec_new * 1000000L))
				assert tv_usec_new == 0
				
				# verification
				time_old = tv_sec_old * 1000000L + tv_usec_old
				time_new = tv_sec_new * 1000000L + tv_usec_new
				assert time_new == (time_old + TIME_INTERVAL)
				
				config.save_time_info(tv_sec_new, tv_usec_new)
				
				execution_state.getRegisterService().setValue("R0", tv_sec_new)
				
				# obtain the adjusted value
				tv_sec = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
				tv_usec = 0x0
				if config.debug:
					print "[time] (adjust) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec)
				# config.log_print("[time] (adjust) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec))
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
	time()
	sys.exit()
