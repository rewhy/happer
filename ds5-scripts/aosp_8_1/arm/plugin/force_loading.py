# force_loading.py is used to force loading a specific memory page into the memory
# NOTE: this script does not use the methods defined in the memory.py to access memory content

import os

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import mmu

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()

page_size = 0x1000

# page table descriptor format
# | ?? | reserved | UXN | PXN | ???? | AF | SH | AP | NS | Indx | ?? |
#         58 - 55    54    53          10   9-8  7-6  5     4-2      

def force_loading(data_address, data_length):
	page_vtl_start_address = None
	page_phy_descriptor_address = None
	page_origin_descriptor = None  # we will restore the origin page descriptor value later
	
	# find a page table entry which is readable and executable
	assert mmu.page_table is not None
	
	for vtl_start_address in sorted(mmu.page_table):
		if vtl_start_address <= config.libc_executable_end:
			continue
			
		physical_descriptor_address = mmu.page_table[vtl_start_address]
		descriptor = long(execution_state.getMemoryService().readMemory64("NP:" + str(hex(physical_descriptor_address)).replace('L', ''))) & 0xffffffffffffffffL
			
		if (descriptor & 0x0040000000000000L) == 0x0000000000000000L and (descriptor & 0x0020000000000000L) == 0x0020000000000000L:
			if (descriptor & 0x00000000000000c0L) == 0x00000000000000c0L:
				page_vtl_start_address = vtl_start_address
				page_phy_descriptor_address = physical_descriptor_address
				page_origin_descriptor = descriptor
					
				# add writable property to the page descriptor
				try:
					descriptor = descriptor & 0xffffffffffffff7fL
					execution_state.getMemoryService().writeMemory8("NP:" + str(hex(page_phy_descriptor_address)).replace('L', ''), descriptor)
				except DebugException:
					# if fail, we continue to search for the next candidate
					continue
				except TypeError:
					# if fail, we continue to search for the next candidate
					continue
					
				# verification
				try:
					# try to set a breakpoint to the selected address
					brk_force_loading_end_cmd = "hbreak" + " " + str(hex(page_vtl_start_address)).replace('L', '')
					execution_state.executeDSCommand(brk_force_loading_end_cmd)
					rm_brks = []
					for breakpoint_index in range(0, execution_state.getBreakpointService().getBreakpointCount()):
						breakpoint_object = execution_state.getBreakpointService().getBreakpoint(breakpoint_index)
						if (int(breakpoint_object.getAddresses()[0]) & 0xffffffffL) == page_vtl_start_address:
							rm_brks.append(breakpoint_object)
					for brk_obj in rm_brks:
						brk_obj.remove()
					
					# try to write a value to the selected address
					origin_data = execution_state.getMemoryService().read(page_vtl_start_address, page_size)
					execution_state.getMemoryService().write(page_vtl_start_address, origin_data)
						
					break
				except DebugException:
					# if fail, we continue to search for the next candidate
					continue
				except TypeError:
					# if fail, we continue to search for the next candidate
					continue	
				
	assert page_vtl_start_address is not None
	assert page_phy_descriptor_address is not None
	assert page_origin_descriptor is not None
	
	# if config.debug:
		# print "[force_loading] page_vtl_start_address = N:%0#18x" % page_vtl_start_address
		# print "[force_loading] page_phy_descriptor_address = NP:%0#18x" % page_phy_descriptor_address
		# print "[force_loading] page_origin_descriptor = %0#18x" % page_origin_descriptor
		# print "[force_loading] page_modify_descriptor = %0#18x" % (page_origin_descriptor & 0xffffffffffffff7fL)
	
	# save the origin page content, which will be restored later as well
	origin_content = execution_state.getMemoryService().read(page_vtl_start_address, page_size)
	
	# write the assembly code, which is used to perform the force loading, to the memory page
	'''
	push	{r0}
	push	{r1}  # begin_
	push	{r2}
	push	{r3}
	mov		r2, size / page_size + 0x1
	mov 	r3, #0x0
*	ldr		r1, [r0]
	add		r0, page_size
	add		r3, 0x1
	cmp		r3, r2
*	bne		lb
	pop		{r3}
	pop		{r2}
	pop		{r1}
	pop		{r0}
	'''
	executable_ptr = page_vtl_start_address
	memory_assemble_start_cmd = "assemble %0#10x T32" % executable_ptr
	execution_state.executeDSCommand(memory_assemble_start_cmd)
	
	# offset -> 0x0
	memory_assemble_instruction_cmd = "push	{r0}"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x2
	memory_assemble_instruction_cmd = "push	{r1}"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x4
	memory_assemble_instruction_cmd = "push	{r2}"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x6
	memory_assemble_instruction_cmd = "push	{r3}"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x8
	memory_assemble_instruction_cmd = "mov	r2, #%#x" % ((data_length / page_size) + 1)
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0xc
	memory_assemble_instruction_cmd = "mov	r3, #0x0"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x10
	memory_assemble_instruction_cmd = "ldr	r1, [r0]"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x12
	memory_assemble_instruction_cmd = "add	r0, r0, #%#x" % page_size
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x16
	memory_assemble_instruction_cmd = "add	r3, r3, #0x1"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x1a
	memory_assemble_instruction_cmd = "cmp	r3, r2"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x1c
	memory_assemble_instruction_cmd = "bne	{pc}-%#x" % (0x1c - 0x10)
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x1e
	memory_assemble_instruction_cmd = "pop	{r3}"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x20
	memory_assemble_instruction_cmd = "pop	{r2}"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x22
	memory_assemble_instruction_cmd = "pop	{r1}"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x24
	memory_assemble_instruction_cmd = "pop	{r0}"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x26
	memory_assemble_instruction_cmd = "nop"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x28
	memory_assemble_instruction_cmd = "nop"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x2a
	memory_assemble_instruction_cmd = "nop"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	# offset -> 0x2c
	memory_assemble_instruction_cmd = "nop"
	execution_state.executeDSCommand(memory_assemble_instruction_cmd)
	
	memory_assemble_end_cmd = "end"
	execution_state.executeDSCommand(memory_assemble_end_cmd)
	
	# save the origin R0 and PC registers
	origin_r0 = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	origin_pc = int(execution_state.getRegisterService().getValue("PC")) & 0xffffffff
	
	# adjust the R0 and PC registers
	execution_state.getRegisterService().setValue("R0", data_address)
	execution_state.getRegisterService().setValue("PC", executable_ptr)
	
	pid = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff
	brk_force_loading_end_address = page_vtl_start_address + 0x26
	brk_force_loading_end_cmd = "hbreak" + " " + str(hex(brk_force_loading_end_address)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# brk_force_loading_end_cmd = "break" + " " + str(hex(brk_force_loading_end_address)).replace('L', '')
	execution_state.executeDSCommand(brk_force_loading_end_cmd)
	
	while True:
		execution_state.getExecutionService().resume()
		try:
			execution_state.getExecutionService().waitForStop(timeout=120000)  # wait for 120s
			brk_address = long(execution_state.getRegisterService().getValue("PC")) & 0xffffffffffffffffL
			if brk_address == brk_force_loading_end_address:
				rm_brks = []
				for breakpoint_index in range(0, execution_state.getBreakpointService().getBreakpointCount()):
					breakpoint_object = execution_state.getBreakpointService().getBreakpoint(breakpoint_index)
					if (int(breakpoint_object.getAddresses()[0]) & 0xffffffffL) == brk_force_loading_end_address:
						rm_brks.append(breakpoint_object)
				for brk_obj in rm_brks:
					brk_obj.remove()
					
				break  # jump out of the while-loop
			else:
				raise RuntimeError("unexpected breakpoint")
		except DebugException:
			raise RuntimeError("wtf !!!")
	
	# restore the origin R0 and PC registers
	execution_state.getRegisterService().setValue("R0", origin_r0)
	execution_state.getRegisterService().setValue("PC", origin_pc)
	
	# restore the origin content of this memory page
	execution_state.getMemoryService().write(page_vtl_start_address, origin_content)
	
	# restore the origin page descriptor
	execution_state.getMemoryService().writeMemory8("NP:" + str(hex(page_phy_descriptor_address)).replace('L', ''), page_origin_descriptor)
	
	return
	