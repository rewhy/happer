# DexFile.py is used to dump the dex file when the "DexFile::<init>" method is invoked in 32-bit mode.

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


# define the analyzing configuration related to online tracing module
def online_tracing(pid):
	# define the breakpoints
	brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
	brk_clear_cache_cmd = "hbreak" + " " + "EL1N:0xFFFFFF800809541C" + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_clear_cache_cmd)
	# brk_mmap_cmd = "hbreak" + " " + str(hex(config.brk_mmap)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_mmap_cmd)
	# brk_munmap_cmd = "hbreak" + " " + str(hex(config.brk_munmap)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_munmap_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			bs_do_dlopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.do_dlopen_script)
			execution_state.executeDSCommand(bs_do_dlopen_cmd)
			brk_object.enable()
		
		if (long(brk_object.getAddresses()[0]) & 0xffffffffffffffffL) == 0xFFFFFF800809541CL:
			bs_clear_cache_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.clear_cache_script)
			execution_state.executeDSCommand(bs_clear_cache_cmd)
			brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_mmap:
			# bs_mmap_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.mmap_script)
			# execution_state.executeDSCommand(bs_mmap_cmd)
			# brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_munmap:
			# bs_munmap_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.munmap_script)
			# execution_state.executeDSCommand(bs_munmap_cmd)
			# brk_object.enable()


# define the analyzing configuration related to the DexFile loading
def dex_setup(pid):
	# define the breakpoints
	brk_DexFile_cmd = "hbreak" + " " + str(hex(config.brk_DexFile)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_DexFile_cmd)

	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_DexFile:
			bs_DexFile_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.DexFile_script)
			execution_state.executeDSCommand(bs_DexFile_cmd)
			brk_object.enable()


# define the analyzing configuration related to the Java execution flow
def je_setup(pid):
	# define the breakpoints
	brk_ArtQuickToInterpreterBridge_cmd = "hbreak" + " " + str(hex(config.brk_ArtQuickToInterpreterBridge)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_ArtQuickToInterpreterBridge_cmd)
	# brk_ArtInterpreterToInterpreterBridge_cmd = "hbreak" + " " + str(hex(config.brk_ArtInterpreterToInterpreterBridge)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_ArtInterpreterToInterpreterBridge_cmd)
	# brk_ArtInterpreterToCompiledCodeBridge_cmd = "hbreak" + " " + str(hex(config.brk_ArtInterpreterToCompiledCodeBridge)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_ArtInterpreterToCompiledCodeBridge_cmd)
	brk_DoCall_cmd = "hbreak" + " " + str(hex(config.brk_DoCall)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_DoCall_cmd)
	# brk_ArtQuickGenericJniTrampoline_cmd = "hbreak" + " " + str(hex(config.brk_ArtQuickGenericJniTrampoline)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_ArtQuickGenericJniTrampoline_cmd)
	brk_InvokeWithArgArray_cmd = "hbreak" + " " + str(hex(config.brk_InvokeWithArgArray)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_InvokeWithArgArray_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtQuickToInterpreterBridge:
			bs_ArtQuickToInterpreterBridge_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtQuickToInterpreterBridge_script)
			execution_state.executeDSCommand(bs_ArtQuickToInterpreterBridge_cmd)
			brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtInterpreterToInterpreterBridge:
			# bs_ArtInterpreterToInterpreterBridge_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtInterpreterToInterpreterBridge_script)
			# execution_state.executeDSCommand(bs_ArtInterpreterToInterpreterBridge_cmd)
			# brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtInterpreterToCompiledCodeBridge:
			# bs_ArtInterpreterToCompiledCodeBridge_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtInterpreterToCompiledCodeBridge_script)
			# execution_state.executeDSCommand(bs_ArtInterpreterToCompiledCodeBridge_cmd)
			# brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_DoCall:
			bs_DoCall_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.DoCall_script)
			execution_state.executeDSCommand(bs_DoCall_cmd)
			brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtQuickGenericJniTrampoline:
			# bs_ArtQuickGenericJniTrampoline_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtQuickGenericJniTrampoline_script)
			# execution_state.executeDSCommand(bs_ArtQuickGenericJniTrampoline_cmd)
			# brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_InvokeWithArgArray:
			bs_InvokeWithArgArray_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.InvokeWithArgArray_script)
			execution_state.executeDSCommand(bs_InvokeWithArgArray_cmd)
			brk_object.enable()


# define the analyzing configuration related to the Native execution flow		
def ne_setup(pid):
	# define the breakpoints
	
	# - JNI_onLoad - #
	# brk_LoadNativeLibrary_cmd = "hbreak" + " " + str(hex(config.brk_LoadNativeLibrary)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_LoadNativeLibrary_cmd)
	# brk_JNI_onLoad_cmd = "hbreak" + " " + str(hex(config.brk_JNI_onLoad)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_JNI_onLoad_cmd)
	
	# - JNI method - #
	brk_ArtQuickGenericJniTrampoline_cmd = "hbreak" + " " + str(hex(config.brk_ArtQuickGenericJniTrampoline)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_ArtQuickGenericJniTrampoline_cmd)
	brk_GenericJniMethodEnd_cmd = "hbreak" + " " + str(hex(config.brk_GenericJniMethodEnd)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_GenericJniMethodEnd_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		
		# - JNI_onLoad - #
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadNativeLibrary:
			# bs_LoadNativeLibrary_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.LoadNativeLibrary_script)
			# execution_state.executeDSCommand(bs_LoadNativeLibrary_cmd)
			# brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_JNI_onLoad:
			# bs_JNI_onLoad_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.JNI_onLoad_script)
			# execution_state.executeDSCommand(bs_JNI_onLoad_cmd)
			# brk_object.enable()
		
		# - JNI method - #
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_ArtQuickGenericJniTrampoline:
			bs_ArtQuickGenericJniTrampoline_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ArtQuickGenericJniTrampoline_script)
			execution_state.executeDSCommand(bs_ArtQuickGenericJniTrampoline_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_GenericJniMethodEnd:
			bs_GenericJniMethodEnd_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.GenericJniMethodEnd_script)
			execution_state.executeDSCommand(bs_GenericJniMethodEnd_cmd)
			brk_object.enable()


# define the analyzing configuration related to the linker
def linker_setup(pid):
	# define the breakpoints
	# brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
	# brk_JNI_onLoad_cmd = "hbreak" + " " + str(hex(config.brk_JNI_onLoad)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_JNI_onLoad_cmd)
	brk_RegisterNatives_cmd = "hbreak" + " " + str(hex(config.brk_RegisterNatives)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_RegisterNatives_cmd)
	
	# brk_clear_cache_cmd = "hbreak" + " " + "EL1N:0xFFFFFF800809541C" + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_clear_cache_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			# bs_do_dlopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.do_dlopen_script)
			# execution_state.executeDSCommand(bs_do_dlopen_cmd)
			# brk_object.enable()
		
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_JNI_onLoad:
			# bs_JNI_onLoad_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.JNI_onLoad_script)
			# execution_state.executeDSCommand(bs_JNI_onLoad_cmd)
			# brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_RegisterNatives:
			bs_RegisterNatives_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.RegisterNatives_script)
			execution_state.executeDSCommand(bs_RegisterNatives_cmd)
			brk_object.enable()
			
		# if (long(brk_object.getAddresses()[0]) & 0xffffffffffffffffL) == 0xFFFFFF800809541CL:
			# bs_clear_cache_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.clear_cache_script)
			# execution_state.executeDSCommand(bs_cacheflush_cmd)
			# brk_object.enable()


# ---- #

# ADG
def anti_debugging(pid):
	# define the breakpoints
	brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
	brk_fopen_cmd = "hbreak" + " " + str(hex(config.brk_fopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_fopen_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			bs_do_dlopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.do_dlopen_script)
			execution_state.executeDSCommand(bs_do_dlopen_cmd)
			brk_object.enable()
		
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_fopen:
			bs_fopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.fopen_adg_script)
			execution_state.executeDSCommand(bs_fopen_cmd)
			brk_object.enable()


# AEU
def anti_emulator(pid):
	# define the breakpoints
	brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
	brk_fopen_cmd = "hbreak" + " " + str(hex(config.brk_fopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_fopen_cmd)
	brk_system_property_get = "hbreak" + " " + str(hex(config.brk_system_property_get)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_system_property_get)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			bs_do_dlopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.do_dlopen_script)
			execution_state.executeDSCommand(bs_do_dlopen_cmd)
			brk_object.enable()
		
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_fopen:
			bs_fopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.fopen_aeu_script)
			execution_state.executeDSCommand(bs_fopen_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_system_property_get:
			bs_system_property_get_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.system_property_get_script)
			execution_state.executeDSCommand(bs_system_property_get_cmd)
			brk_object.enable()


# ADI			
def anti_instrumentation(pid):
	# define the breakpoints
	brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
	brk_fopen_cmd = "hbreak" + " " + str(hex(config.brk_fopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_fopen_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			bs_do_dlopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.do_dlopen_script)
			execution_state.executeDSCommand(bs_do_dlopen_cmd)
			brk_object.enable()
		
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_fopen:
			bs_fopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.fopen_adi_script)
			execution_state.executeDSCommand(bs_fopen_cmd)
			brk_object.enable()


# TCK (gettimeofday for ijiami, time for qihoo)
def time_checking_setup(pid):
	# define the breakpoints
	brk_gettimeofday_cmd = "hbreak" + " " + str(hex(config.brk_gettimeofday)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_gettimeofday_cmd)
	# brk_time_cmd = "hbreak" + " " + str(hex(config.brk_time)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_time_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_gettimeofday:
			bs_gettimeofday_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.gettimeofday_script)
			execution_state.executeDSCommand(bs_gettimeofday_cmd)
			brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_time:
			# bs_time_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.time_script)
			# execution_state.executeDSCommand(bs_time_cmd)
			# brk_object.enable()


# SLH
def system_library_hooking_setup(pid):
	# define the breakpoints
	brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
	brk_clear_cache_cmd = "hbreak" + " " + "EL1N:0xFFFFFF800809541C" + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_clear_cache_cmd)
	# brk_mmap_cmd = "hbreak" + " " + str(hex(config.brk_mmap)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_mmap_cmd)
	# brk_munmap_cmd = "hbreak" + " " + str(hex(config.brk_munmap)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	# execution_state.executeDSCommand(brk_munmap_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			bs_do_dlopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.do_dlopen_script)
			execution_state.executeDSCommand(bs_do_dlopen_cmd)
			brk_object.enable()
		
		if (long(brk_object.getAddresses()[0]) & 0xffffffffffffffffL) == 0xFFFFFF800809541CL:
			bs_clear_cache_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.clear_cache_script)
			execution_state.executeDSCommand(bs_clear_cache_cmd)
			brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_mmap:
			# bs_mmap_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.mmap_script)
			# execution_state.executeDSCommand(bs_mmap_cmd)
			# brk_object.enable()
		# if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_munmap:
			# bs_munmap_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.munmap_script)
			# execution_state.executeDSCommand(bs_munmap_cmd)
			# brk_object.enable()


# ---- #


def art_object_modification_setup(pid):
	# define the breakpoints
	brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
	brk_LoadClassMembers_cmd = "hbreak" + " " + str(hex(config.brk_LoadClassMembers)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_LoadClassMembers_cmd)
	brk_LoadMethod_cmd = "hbreak" + " " + str(hex(config.brk_LoadMethod)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_LoadMethod_cmd)

	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			bs_do_dlopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.do_dlopen_script)
			execution_state.executeDSCommand(bs_do_dlopen_cmd)
			brk_object.enable()
		
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadClassMembers:
			bs_LoadClassMembers_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.LoadClassMembers_script)
			execution_state.executeDSCommand(bs_LoadClassMembers_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadMethod:
			bs_LoadMethod_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.LoadMethod_script)
			execution_state.executeDSCommand(bs_LoadMethod_cmd)
			brk_object.enable()


def force_art_object_modification_setup(pid):
	# define the breakpoints
	brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
	brk_FindClass_cmd = "hbreak" + " " + str(hex(config.brk_FindClass)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_FindClass_cmd)
	brk_LoadMethod_cmd = "hbreak" + " " + str(hex(config.brk_LoadMethod)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_LoadMethod_cmd)

	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			bs_do_dlopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.do_dlopen_script)
			execution_state.executeDSCommand(bs_do_dlopen_cmd)
			brk_object.enable()
		
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_FindClass:
			bs_FindClass_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.FindClass_ijiami_script)
			execution_state.executeDSCommand(bs_FindClass_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadMethod:
			bs_LoadMethod_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.LoadMethod_script)
			execution_state.executeDSCommand(bs_LoadMethod_cmd)
			brk_object.enable()


def class_modification_setup(pid):
	# define the breakpoints
	brk_ClassModification_cmd = "hbreak" + " " + str(hex(config.brk_DoCall)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_ClassModification_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_DoCall:
			bs_ClassModification_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.ClassModification_script)
			execution_state.executeDSCommand(bs_ClassModification_cmd)
			brk_object.enable()


def force_class_modification_setup(pid):
	# define the breakpoints
	brk_FindClass_cmd = "hbreak" + " " + str(hex(config.brk_FindClass)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_FindClass_cmd)
	brk_InitClass_cmd = "hbreak" + " " + str(hex(config.brk_InitClass)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_InitClass_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_FindClass:
			bs_FindClass_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.FindClass_kiwi_script)
			execution_state.executeDSCommand(bs_FindClass_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_InitClass:
			bs_InitClass_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.InitClass_kiwi_script)
			execution_state.executeDSCommand(bs_InitClass_cmd)
			brk_object.disable()


# ---- #

def unpack_baidu_2018(pid):
	pass


def unpack_bangcle_2018(pid):
	pass


def unpack_ijiami_2018(pid):
	time_checking_setup(pid)
	force_art_object_modification_setup(pid)
	pass


def unpack_kiwi_2018(pid):
	force_class_modification_setup(pid)
	pass


def unpack_qihoo_2018(pid):
	pass


def unpack_tencent_2018(pid):
	pass


# ---- #

# performance			
def cf_bench(pid):
	# define the breakpoints
	# brk_LoadNativeLibrary_cmd = "hbreak" + " " + str(hex(config.brk_LoadNativeLibrary)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	brk_LoadNativeLibrary_cmd = "hbreak" + " " + str(hex(config.brk_LoadNativeLibrary)).replace('L', '')
	execution_state.executeDSCommand(brk_LoadNativeLibrary_cmd)
	# brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	brk_do_dlopen_cmd = "hbreak" + " " + str(hex(config.brk_do_dlopen)).replace('L', '')
	execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
	brk_clock_gettime_cmd = "hbreak" + " " + str(hex(config.brk_clock_gettime)).replace('L', '') + " " + "context" + " " + str(hex(pid)).replace('L', '')
	execution_state.executeDSCommand(brk_clock_gettime_cmd)
	
	# define the breakpoint scripts
	for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
		brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_LoadNativeLibrary:
			bs_LoadNativeLibrary_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.LoadNativeLibrary_script)
			execution_state.executeDSCommand(bs_LoadNativeLibrary_cmd)
			brk_object.enable()
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
			bs_do_dlopen_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.do_dlopen_script)
			execution_state.executeDSCommand(bs_do_dlopen_cmd)
			brk_object.enable()
		
		if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_clock_gettime:
			bs_clock_gettime_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.clock_gettime_script)
			execution_state.executeDSCommand(bs_clock_gettime_cmd)
			brk_object.enable()
			brk_object.disable()


# ---- #

# set the analyzing environment
def setup(pid):
	assert execution_state.getBreakpointService().getBreakpointCount() == 1
	# remove all current breakpoints
	try:
		debugger.removeAllBreakpoints()
	except DebugException:
		rm_brks = []
		for breakpoint_index in range(0, execution_state.getBreakpointService().getBreakpointCount()):
			breakpoint_object = execution_state.getBreakpointService().getBreakpoint(breakpoint_index)
			if breakpoint_object.isHardware() or ((int(breakpoint_object.getAddresses()[0]) & 0xffffffff) == config.brk_DexFile):
				rm_brks.append(breakpoint_object)
		for brk_obj in rm_brks:
			brk_obj.remove()
	
	# -- Common BRK -- #
	dex_setup(pid)
	# je_setup(pid) # ??
	# ne_setup(pid) # ??
	# linker_setup(pid) # ??
	
	# -- Behavior BRK -- #
	# anti_debugging(pid)
	# anti_emulator(pid)
	# anti_instrumentation(pid)
	# time_checking_setup(pid)
	# system_library_hooking_setup(pid)
	# art_object_modification_setup(pid)
	# class_modification_setup(pid)
	
	# -- Unpack BRK -- #
	# unpack_baidu_2018(pid)
	# unpack_bangcle_2018(pid)
	# unpack_ijiami_2018(pid)
	# unpack_kiwi_2018(pid)
	# unpack_qihoo_2018(pid)
	# unpack_tencent_2018(pid)
	
	# -- Evaluation BRK -- #
	# cf_bench(pid)
	

def retrieve_string_value(string_ptr):
	length_val = memory.readMemory32(string_ptr + config.offset_string_length)
	reference_ptr = memory.readMemory32(string_ptr + config.offset_string_reference)
	char_array = memory.retrieve_char_array(reference_ptr)
	
	return char_array
	
	
def cleanup():
	if mmu.page_table is not None:
		del mmu.page_table
		gc.collect()
		
		
find_library_offset 		= 0x0000592e
call_constructors_offset 	= 0x00005970
def init_art():
	# get the PID
	pid_val = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff
	
	# -1-
	# read the "name" parameter
	name_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	name_val = memory.retrieve_char_array(name_ptr)
	# read the "flags" parameter
	flags_val = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	# read the "extinfo" parameter
	extinfo_ptr = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	
	if config.debug:
		print "[entrypoint] [do_dlopen] pid = %#x" % pid_val
		print "[entrypoint] [do_dlopen] name = %s" % name_val
		print "[entrypoint] [do_dlopen] flags_val = %#x" % flags_val
		print "[entrypoint] [do_dlopen] extinfo_ptr = %0#10x" % extinfo_ptr
	
	# the first loaded Oat file must be our target
	if not config.package_filter(name_val):
		# should not be reached
		assert False
		
	config.log_print("[entrypoint] [do_dlopen] pid = %#x" % pid_val)
	
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
		print "[entrypoint] [do_dlopen] si = %0#10x" % si_ptr
		
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
		print "[entrypoint] [do_dlopen] si->base = %0#10x" % base_val
		print "[entrypoint] [do_dlopen] si->size = %#x" % size_val
	
	config.log_print("[entrypoint] [do_dlopen] name = %s, si->base = %0#10x, si->size = %#x" % (name_val, base_val, size_val))
	if not base_val == 0x0:
		config.save_range_info(base_val, base_val + size_val - 0x1)
	
	# initialization
	setup(pid_val)
	
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


def init_dvm():
	# get the PID
	pid_val = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$CONTEXTIDR_EL1.PROCID")) & 0xffffffff

	# get the pointer that refers to the DexFile structure
	dex_file_ptr = int(execution_state.getRegisterService().getValue("R0")) & 0xffffffff
	
	# read the "begin_" field
	dex_file_begin_val = int(execution_state.getRegisterService().getValue("R1")) & 0xffffffff
	
	# read the "size_" field
	dex_file_size_val = int(execution_state.getRegisterService().getValue("R2")) & 0xffffffff
	
	# read the "location_" field
	dex_file_location_ptr = int(execution_state.getRegisterService().getValue("R3")) & 0xffffffff
	# retrieve the value of the std::string structure
	dex_file_location_string_val = retrieve_string_value(dex_file_location_ptr)
	
	if config.debug:
		print "[entrypoint] [DexFile] pid = %#x" % pid_val
		print "[entrypoint] [DexFile] begin_ = %0#10x" % dex_file_begin_val
		print "[entrypoint] [DexFile] size_ = %#x" % dex_file_size_val
		print "[entrypoint] [DexFile] location_ = %s" % dex_file_location_string_val
		
	# the first loaded Dex file must be our target
	if not config.package_filter(dex_file_location_string_val):
		# should not be reached
		assert False
		
	config.log_print("[DexFile] pid = %#x" % pid_val)
	config.log_print("[DexFile] begin_ = %0#10x, size_ = %#x, location_ = %s" % (dex_file_begin_val, dex_file_size_val, dex_file_location_string_val))
		
	# initialization
	setup(pid_val)
	
	# dump the in-memory DexFile
	file_path = os.path.join(config.workspace, config.dex_directory, dex_file_location_string_val.split("/")[-1])
	file_format = "binary"
	file_vtl_start_address = dex_file_begin_val
	file_vtl_end_address = dex_file_begin_val + dex_file_size_val - 0x1
	memory.dump(file_path, file_format, file_vtl_start_address, file_vtl_end_address)
		
	# continue the execution of the target application
	execution_state.getExecutionService().resume()
	cleanup()
	return


# ---- #

if __name__ == '__main__':
	if config.art:
		init_art()
	if config.dvm:
		init_dvm()
	
	sys.exit()
