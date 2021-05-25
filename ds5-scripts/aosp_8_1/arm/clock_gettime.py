# clock_gettime.py

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
	
# 0x0: "CLOCK_REALTIME"
# 0x1: "CLOCK_MONOTONIC"
# 0x2: "CLOCK_PROCESS_CPUTIME_ID"
# 0x3: "CLOCK_THREAD_CPUTIME_ID"
# 0x4: "CLOCK_MONOTONIC_RAW"
# 0x5: "CLOCK_REALTIME_COARSE"
# 0x6: "CLOCK_MONOTONIC_COARSE"
# 0x7: "CLOCK_BOOTTIME"
# 0x8: "CLOCK_REALTIME_ALARM"
# 0x9: "CLOCK_BOOTTIME_ALARM"
# 0xa: "CLOCK_SGI_CYCLE"
# 0xb: "CLOCK_TAI"
# TIME_INTERVAL = 1000000L  # usec
# def clock_gettime():
	# pid = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff

	# # get clk_id value
	# clk_id = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	# if clk_id != 0x0:
		# # continue the execution of the target application
		# execution_state.getExecutionService().resume()
		# cleanup()
		# return
	
	# # get tp pointer
	# tp_ptr = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	# if config.debug:
		# print "[clock_gettime] pid = %#x, clk_id = %#x, tp_ptr = %0#10x" % (pid, clk_id, tp_ptr)
	# config.log_print("[clock_gettime] pid = %#x, clk_id = %#x, tp_ptr = %0#10x" % (pid, clk_id, tp_ptr))
	
	# # disable itself
	# for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		# brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_clock_gettime:
			# brk_object.disable()
	
	# brk_clock_gettime = config.libc_base + config.clock_gettime_end - config.libc_file_offset + config.libc_memory_offset
	# execution_state.getExecutionService().resumeTo(brk_clock_gettime)
	# try:
		# execution_state.getExecutionService().waitForStop(60000)  # wait for 60s
	# except DebugException:
		# raise RuntimeError("wtf !!!")
	
	# # obtain tv_sec value
	# tv_sec_ptr = tp_ptr + 0x0
	# tv_sec = memory.readMemory32(tv_sec_ptr)
	
	# # obtain tv_nsec value (this is a trick !!! tv_usec or tv_nsec ??)
	# tv_usec_ptr = tp_ptr + 0x4
	# tv_usec = memory.readMemory32(tv_usec_ptr)

	# if config.debug:
		# print "[clock_gettime] (origin) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec)
	# config.log_print("[clock_gettime] (origin) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec))
	
	# # anti time checking
	# tv_sec_old, tv_usec_old = config.load_time_info()
	# if tv_sec < tv_sec_old:
		# pass
	# else:
		# if tv_sec_old != 0 and tv_usec_old != 0:
			# time_interval = (tv_sec * 1000000L + tv_usec) - (tv_sec_old * 1000000L + tv_usec_old)
			# if time_interval > 1 * TIME_INTERVAL:
				# tv_sec_new = int(((tv_sec_old * 1000000L + tv_usec_old) + 1 * TIME_INTERVAL) / 1000000L)
				# tv_usec_new = int(((tv_sec_old * 1000000L + tv_usec_old) + 1 * TIME_INTERVAL) - (tv_sec_new * 1000000L))
				# time_old = tv_sec_old * 1000000L + tv_usec_old
				# time_new = tv_sec_new * 1000000L + tv_usec_new
				# assert time_new == (time_old + 1 * TIME_INTERVAL)
				
				# time_memory_old = tv_sec_old * (2**32) *1L + tv_usec_old
				# print "[old] sec = %#x, usec = %#x, in-memory = %#x" % (tv_sec_old, tv_usec_old, time_memory_old)
				# time_memory_new = tv_sec_new * (2**32) *1L + tv_usec_new
				# print "[new] sec = %#x, usec = %#x, in-memory = %#x" % (tv_sec_new, tv_usec_new, time_memory_new)
				
				# config.save_time_info(tv_sec_new, tv_usec_new)
				# memory_set_cmd = "memory set %0#10x 0 %#x" % (tp_ptr + 0x0, tv_sec_new)
				# execution_state.executeDSCommand(memory_set_cmd)
				# memory_set_cmd = "memory set %0#10x 0 %#x" % (tp_ptr + 0x4, tv_usec_new)
				# execution_state.executeDSCommand(memory_set_cmd)
				
				# # obtain tv_sec value
				# tv_sec_ptr = tp_ptr + 0x0
				# tv_sec = memory.readMemory32(tv_sec_ptr)
				
				# # obtain tv_usec_value
				# tv_usec_ptr = tp_ptr + 0x4
				# tv_usec = memory.readMemory32(tv_usec_ptr)

				# if config.debug:
					# print "[clock_gettime] (adjust) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec)
				# config.log_print("[clock_gettime] (adjust) pid = %#x, tv_sec = %0#10x, tv_usec = %0#10x" % (pid, tv_sec, tv_usec))
			# else:
				# config.save_time_info(tv_sec, tv_usec)
		# elif tv_sec_old == 0 and tv_usec_old == 0:
			# config.save_time_info(tv_sec, tv_usec)
		# else:
			# raise RuntimeError("invalid tp valus !!!")
			
	# # enable itself
	# for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		# brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_clock_gettime:
			# brk_object.enable()
		
	# # continue the execution of the target application
	# # execution_state.getExecutionService().resume()
	# cleanup()
	# return
	
	
def clock_gettime():
	lr = int(execution_state.getRegisterService().getValue("LR")) & 0xffffffff
	print "%0#10x" % lr
	
	config.log_print("[clock_gettime] lr = %0#10x" % lr)
	
	execution_state.getExecutionService().resume()
	return


if __name__ == '__main__':
	clock_gettime()
	sys.exit()
