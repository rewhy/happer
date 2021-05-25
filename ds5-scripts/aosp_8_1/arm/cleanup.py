# cleanup.py is used to release the unpacking environment

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
		for file in os.listdir(config.workspace):
			if config.pid_file.endswith(file):
				os.remove(config.pid_file)
			if config.dex_hash_file.endswith(file):
				os.remove(config.dex_hash_file)
			if config.log_file.endswith(file):
				os.remove(config.log_file)
			if os.path.join(config.workspace, file).startswith(config.class_data_off_file_prefix) and file.endswith(config.class_data_off_file_suffix):
				os.remove(os.path.join(config.workspace, file))
			if os.path.join(config.workspace, file).startswith(config.enterinterpreterfromentrypoint_config_prefix) and file.endswith(config.enterinterpreterfromentrypoint_config_suffix):
				os.remove(os.path.join(config.workspace, file))
			if os.path.join(config.workspace, file).startswith(config.art_method_file_prefix) and file.endswith(config.art_method_file_suffix):
				os.remove(os.path.join(config.workspace, file))
			if os.path.join(config.workspace, file).startswith(config.loadclass_config_prefix) and file.endswith(config.loadclass_config_suffix):
				os.remove(os.path.join(config.workspace, file))
	else:
		raise RuntimeError("workspace \"%s\" is not existed !" % config.workspace)
	
	# delete the obsolete directories in the workspace
	if os.path.exists(config.workspace):
		# dex directory
		if os.path.exists(os.path.join(config.workspace, config.dex_directory)):
			shutil.rmtree(os.path.join(config.workspace, config.dex_directory), ignore_errors=True)
	else:
		raise RuntimeError("workspace \"%s\" is not existed !" % config.workspace)


if __name__ == '__main__':
	cleanup()
	sys.exit()