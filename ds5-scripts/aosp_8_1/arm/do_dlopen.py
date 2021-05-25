# do_dlopen.py is used to ... when the do_dlopen method is invoked in 32-bit mode.

import gc
import os
import sys
import time

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
	# disable the do_dlopen breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			brk_object.disable()
			
			
def end_prolog():
	# enable the do_dlopen breakpoint
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			brk_object.enable()


find_library_offset 		= 0x0000592e
call_constructors_offset 	= 0x00005970
def do_dlopen():
	# -- HEAD -- #
	start_prolog()
			
	# -- BODY -- #
	pid = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff
	
	# -1-
	# read the "name" parameter
	name_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	name_val = "unknown"
	if name_ptr != 0x0:
		name_val = memory.retrieve_char_array(name_ptr)
	# read the "flags" parameter
	flags_val = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	# read the "extinfo" parameter
	extinfo_ptr = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	if config.debug:
		print "[do_dlopen] pid = %0#10x" % pid
		print "[do_dlopen] name = %s" % name_val
		print "[do_dlopen] flags_val = %#x" % flags_val
		print "[do_dlopen] extinfo_ptr = %0#10x" % extinfo_ptr
	
	# we only focus on specific packer libraries
	if not config.library_filter(name_val):
		# -- TAIL -- #
		end_prolog()
	
		# continue the execution of the target application
		cleanup()
		execution_state.getExecutionService().resume()
		return
	
	# -2-
	# goto the invocation of the find_library method
	brk_find_library_offset = config.linker_base + find_library_offset - config.linker_file_offset + config.linker_memory_offset
	execution_state.getExecutionService().resumeTo(brk_find_library_offset)
	try:
		execution_state.getExecutionService().waitForStop(120000)  # wait for 120s
	except DebugException:
		raise RuntimeError("wtf !!!")
		
	# retrieve soinfo pointer
	si_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	if config.debug:
		print "[do_dlopen] si = %0#10x" % si_ptr
		
	if si_ptr == 0x0:
		# -- TAIL -- #
		end_prolog()
	
		# continue the execution of the target application
		cleanup()
		execution_state.getExecutionService().resume()
		return
		
	base_ptr = si_ptr + config.offset_soinfo_base
	base_val = memory.readMemory32(base_ptr)
	size_ptr = si_ptr + config.offset_soinfo_size
	size_val = memory.readMemory32(size_ptr)
	
	if base_val == 0x0 or size_val == 0x0:
		# -3-
		# goto the invocation of the call_constructors method
		brk_call_constructors_offset = config.linker_base + call_constructors_offset - config.linker_file_offset + config.linker_memory_offset
		execution_state.getExecutionService().resumeTo(brk_call_constructors_offset)
		try:
			execution_state.getExecutionService().waitForStop(120000)  # wait for 120s
		except DebugException:
			raise RuntimeError("wtf !!!")
			
		base_ptr = si_ptr + config.offset_soinfo_base
		base_val = memory.readMemory32(base_ptr)
		size_ptr = si_ptr + config.offset_soinfo_size
		size_val = memory.readMemory32(size_ptr)
	
	if config.debug:
		print "[do_dlopen] si->base = %0#10x" % base_val
		print "[do_dlopen] si->size = %#x" % size_val
	
	config.log_print("[do_dlopen] pid = %0#x, name = %s, si->base = %0#10x, si->size = %#x" % (pid, name_val, base_val, size_val))
	if not base_val == 0x0:
		config.save_range_info(base_val, base_val + size_val - 0x1)
	
	# e_shoff_ptr = base_val + config.offset_Ehdr_e_shoff
	# e_shoff_val = memory.readMemory32(e_shoff_ptr)
	# e_shentsize_ptr = base_val + config.offset_Ehdr_e_shentsize
	# e_shentsize_val = memory.readMemory16(e_shentsize_ptr)
	# e_shnum_ptr = base_val + config.offset_Ehdr_e_shnum
	# e_shnum_val = memory.readMemory16(e_shnum_ptr)
	# config.log_print("[do_dlopen] Ehdr->e_shoff = %0#10x, Ehdr->e_shentsize = %#x, Ehdr->e_shnum = %#x" % (e_shoff_val, e_shentsize_val, e_shnum_val))
	# e_phoff_ptr = base_val + config.offset_Ehdr_e_phoff
	# e_phoff_val = memory.readMemory32(e_phoff_ptr)
	# e_phentsize_ptr = base_val + config.offset_Ehdr_e_phentsize
	# e_phentsize_val = memory.readMemory16(e_phentsize_ptr)
	# e_phnum_ptr = base_val + config.offset_Ehdr_e_phnum
	# e_phnum_val = memory.readMemory16(e_phnum_ptr)
	# config.log_print("[do_dlopen] Ehdr->e_phoff = %0#10x, Ehdr->e_phentsize = %#x, Ehdr->e_phnum = %#x" % (e_phoff_val, e_phentsize_val, e_phnum_val))
	
	# pt_load_segments = []
	# for idx in range(e_phnum_val):
		# p_type_ptr = (base_val + e_phoff_val + idx * e_phentsize_val) + config.offset_Phdr_p_type
		# p_type_val = memory.readMemory32(p_type_ptr)
		# p_offset_ptr = (base_val + e_phoff_val + idx * e_phentsize_val) + config.offset_Phdr_p_offset
		# p_offset_val = memory.readMemory32(p_offset_ptr)
		# p_vaddr_ptr	= (base_val + e_phoff_val + idx * e_phentsize_val) + config.offset_Phdr_p_vaddr
		# p_vaddr_val = memory.readMemory32(p_vaddr_ptr)
		# # p_paddr_ptr	= (e_phoff_val + idx * e_phentsize_val) + config.offset_Phdr_p_paddr
		# # p_paddr_val = memory.readMemory32(p_paddr_ptr)
		# p_filesz_ptr = (base_val + e_phoff_val + idx * e_phentsize_val) + config.offset_Phdr_p_filesz
		# p_filesz_val = memory.readMemory32(p_filesz_ptr)
		# p_memsz_ptr	= (base_val + e_phoff_val + idx * e_phentsize_val) + config.offset_Phdr_p_memsz
		# p_memsz_val = memory.readMemory32(p_memsz_ptr)
		# # p_flags_ptr	= (e_phoff_val + idx * e_phentsize_val) + config.offset_Phdr_p_flags
		# # p_flags_val = memory.readMemory32(p_flags_ptr)
		# p_align_ptr	= (base_val + e_phoff_val + idx * e_phentsize_val) + config.offset_Phdr_p_align
		# p_align_val = memory.readMemory32(p_align_ptr)
		# config.log_print("[do_dlopen] Phdr->p_type = %#x, Phdr->p_vaddr = %0#10x, Phdr->p_memsz = %#x, Phdr->p_offset = %0#10x, Phdr->p_filesz = %#x, Phdr->p_align = %#x" % (p_type_val, p_vaddr_val, p_memsz_val, p_offset_val, p_filesz_val, p_align_val))
	
		# # PT_LOAD = 1; PT_DYNAMIC = 2; PT_INTERP = 3; PT_NOTE = 4; PT_SHLIB = 5; PT_PHDR = 6;
		# if p_type_val == 1:
			# pt_load_segments.append((p_vaddr_val, p_memsz_val, p_offset_val))
		
	# # -4-
	# # dump the in-memory library
	# try:
		# for idx in range(len(pt_load_segments)):
			# file_path = os.path.join(config.workspace, config.library_directory, name_val.split("/")[-1].split(".")[0] + "_" + ("%0#10x" % pt_load_segments[idx][2]) + ".so")
			# file_format = "binary"
			# file_vtl_start_address = base_val + pt_load_segments[idx][0]
			# file_vtl_end_address = base_val + pt_load_segments[idx][0] + pt_load_segments[idx][1] - 0x1
			# memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
	# except Exception, e:
		# print e
		
	# -- TAIL -- #
	end_prolog()
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


if __name__ == '__main__':
	do_dlopen()
	sys.exit()
