# setup.py is used to configure the unpacking environment

import os
import shutil
import sys

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def cleanup():
	# remove all obsoleted breakpoints
	execution_state.getBreakpointService().removeBreakpoints()
	
	# delete the obsolete files in the workspace
	if os.path.exists(config.workspace):
		# log file
		if os.path.exists(os.path.join(config.workspace, config.log_file)):
			os.remove(os.path.join(config.workspace, config.log_file))
		# time info file
		if os.path.exists(os.path.join(config.workspace, config.time_info_file)):
			os.remove(os.path.join(config.workspace, config.time_info_file))
		# range info file
		if os.path.exists(os.path.join(config.workspace, config.range_info_file)):
			os.remove(os.path.join(config.workspace, config.range_info_file))
		# class info file
		if os.path.exists(os.path.join(config.workspace, config.class_info_file)):
			os.remove(os.path.join(config.workspace, config.class_info_file))
	else:
		raise RuntimeError("workspace \"%s\" is not existed !" % config.workspace)
	
	# delete the obsolete directories in the workspace
	if os.path.exists(config.workspace):
		# dex directory
		if os.path.exists(os.path.join(config.workspace, config.dex_directory)):
			shutil.rmtree(os.path.join(config.workspace, config.dex_directory), ignore_errors=True)
		# library directory
		if os.path.exists(os.path.join(config.workspace, config.library_directory)):
			shutil.rmtree(os.path.join(config.workspace, config.library_directory), ignore_errors=True)
		# libart memory directory
		if os.path.exists(os.path.join(config.workspace, config.libart_memory_directory)):
			shutil.rmtree(os.path.join(config.workspace, config.libart_memory_directory), ignore_errors=True)
		# libc memory directory
		if os.path.exists(os.path.join(config.workspace, config.libc_memory_directory)):
			shutil.rmtree(os.path.join(config.workspace, config.libc_memory_directory), ignore_errors=True)
		# liblog memory directory
		if os.path.exists(os.path.join(config.workspace, config.liblog_memory_directory)):
			shutil.rmtree(os.path.join(config.workspace, config.liblog_memory_directory), ignore_errors=True)
	else:
		raise RuntimeError("workspace \"%s\" is not existed !" % config.workspace)


def setup():
	# create the essential directories
	if os.path.exists(config.workspace):
		# dex directory
		if not os.path.exists(os.path.join(config.workspace, config.dex_directory)):
			os.mkdir(os.path.join(config.workspace, config.dex_directory))
		# library directory
		if not os.path.exists(os.path.join(config.workspace, config.library_directory)):
			os.mkdir(os.path.join(config.workspace, config.library_directory))
		# libart memory directory
		if not os.path.exists(os.path.join(config.workspace, config.libart_memory_directory)):
			os.mkdir(os.path.join(config.workspace, config.libart_memory_directory))
		# libc memory directory
		if not os.path.exists(os.path.join(config.workspace, config.libc_memory_directory)):
			os.mkdir(os.path.join(config.workspace, config.libc_memory_directory))
		# liblog memory directory
		if not os.path.exists(os.path.join(config.workspace, config.liblog_memory_directory)):
			os.mkdir(os.path.join(config.workspace, config.liblog_memory_directory))
	else:
		raise RuntimeError("workspace \"%s\" is not existed !" % config.workspace)
	
	# configure the execution environment
	set_mode_cmd = "set arm force-mode T32"
	execution_state.executeDSCommand(set_mode_cmd)
	# set_log_cmd = "log config error"
	# execution_state.executeDSCommand(set_log_cmd)
	set_breakpoint_cmd = "set breakpoint auto-hw off"
	execution_state.executeDSCommand(set_breakpoint_cmd)
	
	# general settings
	if config.art:
		# we assume that the "shell" dex file will be loaded at the very beginning, therefore, the do_dlopen breakpoint is asked to be enabled at the very beginning
		brk_do_dlopen_cmd = "break" + " " + str(hex(config.brk_do_dlopen)).replace('L', '')
		execution_state.executeDSCommand(brk_do_dlopen_cmd)
	
		for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
			brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
			if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_do_dlopen:
				bs_entrypoint_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.entrypoint_script)
				execution_state.executeDSCommand(bs_entrypoint_cmd)
				brk_object.enable()
	if config.dvm:
		# we assume that the "shell" dex file will be loaded at the very beginning, therefore, the DexFile breakpoint is required to be enabled at the very beginning
		brk_DexFile_cmd = "break" + " " + str(hex(config.brk_DexFile)).replace('L', '')
		execution_state.executeDSCommand(brk_DexFile_cmd)
	
		for idx in range(0, execution_state.getBreakpointService().getBreakpointCount()):
			brk_object = execution_state.getBreakpointService().getBreakpoint(idx)
			if (int(brk_object.getAddresses()[0]) & 0xffffffff) == config.brk_DexFile:
				bs_entrypoint_cmd = "break-script" + " " + str(brk_object.getId()) + " " + os.path.join(config.workspace, config.script_directory, config.entrypoint_script)
				execution_state.executeDSCommand(bs_entrypoint_cmd)
				brk_object.enable()


if __name__ == '__main__':
	cleanup()
	setup()
	sys.exit()