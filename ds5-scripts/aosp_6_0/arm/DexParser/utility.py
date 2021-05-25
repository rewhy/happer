from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

import config
import memory

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()


def readuleb128(char_array_ptr):
	result = memory.readMemory8(char_array_ptr)
	length = 1
	if result > 0x7f:
		current = memory.readMemory8(char_array_ptr + length)
		result = (result & 0x7f) | ((current & 0x7f) << (0x7 * length))
		length = length + 1
		if current > 0x7f:
			current = memory.readMemory8(char_array_ptr + length)
			result = result | ((current & 0x7f) << (0x7 * length))
			length = length + 1
			if current > 0x7f:
				current = memory.readMemory8(char_array_ptr + length)
				result = result | ((current & 0x7f) << (0x7 * length))
				length = length + 1
				if current > 0x7f:
					current = memory.readMemory8(char_array_ptr + length)
					result = result | (current << (0x7 * length))
					length = length + 1

	return result, length
	
	
def readsleb128(char_array_ptr):
	result = 0
	length = 0
	shift = 0
	for idx in range(0, 5):
		current = memory.readMemory8(char_array_ptr + length)
		result |= (current & 0x7f) << shift
		length = length + 1
		shift += 7
		if not current & 0x80:
			bit_left = max(32 - shift, 0)
			result = result << bit_left
			if result > 0x7fffffff:
				result = (0x7fffffff & result) - 0x80000000
			result = result >> bit_left
			break

	return result, length