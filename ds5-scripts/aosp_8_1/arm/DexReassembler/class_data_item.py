import os
import sys


# argv[1] -> workspace
# argv[2] -> dex file
def reassemble():
	workspace = sys.argv[1]
	dex_file_path = sys.argv[2]

	dex_file_handler = open(dex_file_path, 'rb')
	dex_file_raw = bytearray(dex_file_handler.read())
	
	configuration_file_handler = open(os.path.join(workspace, "adjust_class_data_item.txt"), 'a')
	if os.path.exists(workspace):
		for file in os.listdir(workspace):
			if file.startswith("class_data_item_"):
				origin_class_data_off = int(file.replace("class_data_item_", "").replace(".bin", ""), 16)
				adjust_class_data_off = len(dex_file_raw)
				# append the class_data_item to the end of the dex file
				class_data_item_handler = open(os.path.join(workspace, file), 'rb')
				class_data_item_raw = bytearray(class_data_item_handler.read())
				dex_file_raw = dex_file_raw + class_data_item_raw

				# write the mapping to the configuration file
				configuration_file_handler.write("%0#10x,%0#10x\n" % (origin_class_data_off, adjust_class_data_off))

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