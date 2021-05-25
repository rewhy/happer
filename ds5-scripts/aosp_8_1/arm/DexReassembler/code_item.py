import os
import sys


# argv[1] -> workspace
# argv[2] -> dex file
def reassemble():
	workspace = sys.argv[1]
	dex_file_path = sys.argv[2]

	dex_file_handler = open(dex_file_path, 'rb')
	dex_file_raw = bytearray(dex_file_handler.read())
	
	configuration_file_handler = open(os.path.join(workspace, "adjust_code_item.txt"), 'a')
	if os.path.exists(workspace):
		for file in os.listdir(workspace):
			if file.startswith("code_item_"):
				method_idx = int(file.replace("code_item_", "").replace(".bin", "").split("_")[0], 16)
				origin_code_off = int(file.replace("code_item_", "").replace(".bin", "").split("_")[1], 16)
				adjust_code_off = len(dex_file_raw)
				# append the class_data_item to the end of the dex file
				code_item_handler = open(os.path.join(workspace, file), 'rb')
				code_item_raw = bytearray(code_item_handler.read())
				assert origin_code_off % 0x4 == 0
				padding = (0x4 - adjust_code_off % 0x4)
				adjust_code_off = adjust_code_off + padding
				padding_bytes = None
				if padding == 0x1:
					padding_bytes = bytearray(b'\x0e')
				if padding == 0x2:
					padding_bytes = bytearray(b'\x0e\x0e')
				if padding == 0x3:
					padding_bytes = bytearray(b'\x0e\x0e\x0e')
				if padding == 0x4:
					padding_bytes = bytearray(b'\x0e\x0e\x0e\x0e')
				dex_file_raw = dex_file_raw + padding_bytes + code_item_raw

				# write the mapping to the configuration file
				configuration_file_handler.write("%#x,%0#10x,%0#10x\n" % (method_idx, origin_code_off, adjust_code_off))

	# save the modified dex file
	reassemble_file_handler = open(("%s.%s" % (dex_file_path, "new")) , 'wb')
	reassemble_file_handler.write(dex_file_raw)
	reassemble_file_handler.flush()
	reassemble_file_handler.close()

	# cleanup
	if dex_file_handler != None:
		dex_file_handler.close()
	if configuration_file_handler != None:
		configuration_file_handler.close()


if __name__ == '__main__':
	reassemble()