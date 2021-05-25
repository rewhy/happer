import struct

from arm_ds.debugger_v1 import Debugger
from arm_ds.debugger_v1 import DebugException

# obtain current execution state
debugger = Debugger()
execution_state = debugger.getCurrentExecutionContext()

page_size = 0x1000  # 2^12b= 4kb


# -*- Page Table -*- #

page_table = None  # "virtual address" -> "page descriptor address"
def resolve_page_table():
	global page_table

	# force update
	page_table = {}
	
	page_table_cmd = "mmu print EL1N_S1_TTBR0_EL1"
	for pg_info in execution_state.executeDSCommand(page_table_cmd).split('\n'):
		# filtering
		if len(pg_info.split('|')) == 0 or '0x' not in pg_info.split('|')[0]:
			continue
		
		# we start filling the page_table map by retrieving the Level 2 Table
		if pg_info.split('|')[1].strip() == "Level 2 Table":
			vtl_start_address = int(pg_info.split('|')[0].replace('+', '').replace('-', '').strip(), 16) & 0xffffffff
			phy_descriptor_address = long(pg_info.split('|')[2].replace('NP:', '').strip(), 16) & 0xffffffffffffffffL
			
			if page_table.has_key(vtl_start_address):
				# unexpected condition
				raise RuntimeError("wtf !!!")
			else:
				page_table[vtl_start_address] = phy_descriptor_address
				
	# supplement page_table map
	vtl_start_address_list = sorted(page_table.keys())
	for va in vtl_start_address_list:
		vtl_start_address = va
		phy_descriptor_address = page_table[vtl_start_address]
		while not page_table.has_key(vtl_start_address + page_size) and (vtl_start_address + page_size) < 0xffffffff:
			vtl_start_address = vtl_start_address + page_size
			phy_descriptor_address = phy_descriptor_address + 0x8
			
			if page_table.has_key(vtl_start_address):
				# unexpected condition
				raise RuntimeError("wtf !!!")
			else:
				# print "%0#10x -> %0#12x" % (vtl_start_address, phy_descriptor_address)
				page_table[vtl_start_address] = phy_descriptor_address
			

# -*- Memory Map -*- #

memory_map = None  # "virtual address" -> "physical address"
def resolve_memory_map():
	global memory_map
	
	# force update
	memory_map = {}
	
	# according to the address translation process, we should retrieve information from the L1I TLB cache, the L2 TLB cache, and the main memory respectively
	
	# -1- filling the memory-map from the L1I TLB Cache
	cache_L1I_cmd = "cache print L1I tlb"
	for tlb_info in execution_state.executeDSCommand(cache_L1I_cmd).split('\n'):
		if (len(tlb_info.split('|'))) > 1 and tlb_info.split('|')[0].startswith('EL1N:'):
			valid = True if ((tlb_info.split('|')[2].strip() == '1') and (tlb_info.split('|')[10].strip() == 'EL1 Non Secure')) else False
		
			vtl_start_address = long(tlb_info.split('|')[0].strip().replace('EL1N:', '').replace('0x', ''), 16) & 0xffffffffffffffffL
			if vtl_start_address >= 0xffffffff:
				# we ignore the kernel space
				continue
			
			phy_start_address = long(tlb_info.split('|')[1].strip().replace('NP:', '').replace('0x', ''), 16) & 0xffffffffffffffffL
			phy_raw_size = (int(tlb_info.split('|')[7].strip()) & 0xffffffff) / 4 * page_size
			
			asid_val = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$TTBR0_EL1.ASID")) & 0xffffffff
			asid = int(tlb_info.split('|')[4].strip(), 16) & 0xffffffff
			
			if valid and (asid == 0x0 or asid == asid_val):
				for i in range(phy_raw_size / page_size):
					if memory_map.has_key(vtl_start_address + (i * page_size)):
						# unexpected condition
						# print "%0#10x" % (vtl_start_address + (i * page_size))
						# raise RuntimeError("wtf (%0#10x) !!!" % (vtl_start_address + (i * page_size)))
						pass  # ??
					else:
						memory_map[vtl_start_address + (i * page_size)] = phy_start_address + (i * page_size)
				
	# -2- filling the memory-map from the L2 TLB Cache
	cache_L2_cmd = "cache print L2 tlb"
	for tlb_info in execution_state.executeDSCommand(cache_L2_cmd).split('\n'):
		if (len(tlb_info.split('|'))) > 1 and tlb_info.split('|')[0].startswith('EL1N:'):
			valid = True if ((tlb_info.split('|')[5].strip() == '1') and (tlb_info.split('|')[6].strip() == '1')) else False
		
			vtl_start_address = long(tlb_info.split('|')[0].strip().replace('EL1N:', '').replace('0x', ''), 16) & 0xffffffffffffffffL
			if vtl_start_address > 0xffffffff:
				# we ignore the kernel space
				continue
			
			phy_start_address = long(tlb_info.split('|')[1].strip().replace('NP:', '').replace('0x', ''), 16) & 0xffffffffffffffffL
			phy_raw_size = (int(tlb_info.split('|')[7].strip()) & 0xffffffff) / 4 * page_size
			
			asid_val = int(execution_state.getVariableService().readValue("$AARCH64::$System::$Memory::$TTBR0_EL1.ASID")) & 0xffffffff
			asid = int(tlb_info.split('|')[9].strip(), 16) & 0xffffffff
			
			if valid and (asid == 0x0 or asid == asid_val):
				for i in range(phy_raw_size / page_size):
					if memory_map.has_key(vtl_start_address + (i * page_size)):
						# unexpected condition
						raise RuntimeError("wtf (%0#10x) !!!" % (vtl_start_address + (i * page_size)))
						# pass
					else:
						memory_map[vtl_start_address + (i * page_size)] = phy_start_address + (i * page_size)
	
	# -3- filling the memory-map from the main memory (page table)
	mmu_cmd = "mmu memory-map EL1N_S1"
	for memory_info in execution_state.executeDSCommand(mmu_cmd).split('\n'):
		if len(memory_info.split('|')) > 1 and memory_info.split('|')[0].startswith('EL1N:'):
			vtl_is_mapped = True if 'unmapped' not in memory_info.split('|')[1].strip() else False
			
			vtl_range = memory_info.split('|')[0].strip().replace('EL1N:', '')
			vtl_start_address = long(vtl_range.split('-')[0].replace('0x', ''), 16) & 0xffffffffffffffffL
			if vtl_start_address >= 0xffffffff:
				# we ignore the kernel space and the 64-bit space
				continue
			vtl_end_address = long(vtl_range.split('-')[1].replace('0x', ''), 16) & 0xffffffffffffffffL
			vtl_raw_size = (vtl_end_address - vtl_start_address) + 0x1
			
			if vtl_is_mapped:
				phy_range = memory_info.split('|')[1].strip().replace('NP:', '')
				phy_start_address = long(phy_range.split('-')[0].replace('0x', ''), 16) & 0xffffffffffffffffL
				phy_end_address = long(phy_range.split('-')[1].replace('0x', ''), 16) & 0xffffffffffffffffL
				phy_raw_size = (phy_end_address - phy_start_address) + 0x1
				
				if phy_raw_size != vtl_raw_size:
					assert vtl_raw_size % page_size == 0
					assert phy_raw_size % page_size == 0
					assert vtl_raw_size % page_size == 0
					
					page_cnt = 0
					for i in range(vtl_raw_size / phy_raw_size):
						for j in range(phy_raw_size / page_size):
							if memory_map.has_key(vtl_start_address + page_cnt * page_size):
								# we will not update an existing mapping
								pass
							else:
								memory_map[vtl_start_address + page_cnt * page_size] = phy_start_address + (j * page_size)
							page_cnt = page_cnt + 1
				else:
					for i in range(phy_raw_size / page_size):
						if memory_map.has_key(vtl_start_address + (i * page_size)):
							# we will not update an existing mapping
							pass
						else:
							memory_map[vtl_start_address + (i * page_size)] = phy_start_address + (i * page_size)
			else:
				pass
	

# -*- Data Cache -*- #

data_cache = None  # "physical address" -> "modified content"
def resolve_data_cache():
	global data_cache
	
	# force update
	data_cache = {}
	
	cache_L1D_cmd = "cache print L1D content"
	for dcache_info in execution_state.executeDSCommand(cache_L1D_cmd).split('\n'):
		if (len(dcache_info.split('|'))) > 1 and dcache_info.split('|')[0].startswith('NP:'):
			phy_start_address = long(dcache_info.split('|')[0].strip().replace('NP:', '').replace('0x', ''), 16) & 0xffffffffffffffffL
		
			bytes = "";
			for i in range(0x10):
				bytes = bytes + struct.pack('<I', int(dcache_info.split('|')[i + 0x4].strip().replace('0x', ''), 16) & 0xffffffff)
			
			assert not data_cache.has_key(phy_start_address)
			data_cache[phy_start_address] = bytes

				
# -*- Address Translation -*- #
				
def translate_vtl_to_phy_fine_grained(vtl):
	assert memory_map is not None
	
	for va in sorted(memory_map.keys()):
		pa = memory_map[va]
		if (vtl >= va) and (vtl <= (va + page_size - 0x1)):
			return pa + (vtl - va)
			
	raise RuntimeError("cannot translate virtual address (%0#10x) to physical address" % vtl)


def translate_vtl_to_phy_coarse_grained(vtl):
	assert memory_map is not None
	
	for va in sorted(memory_map.keys()):
		pa = memory_map[va]
		if (vtl >= va) and (vtl <= (va + page_size - 0x1)):
			return pa
			
	raise RuntimeError("cannot translate virtual address (%0#10x) to physical address" % vtl)


# -*- Initialization -*- #

def init(force_update=False):
	global page_table
	global memory_map
	global data_cache
	
	page_table_is_latest = False
	if page_table is None:
		resolve_page_table()
		page_table_is_latest = True
	
	memory_map_is_latest = False
	if memory_map is None:
		resolve_memory_map()
		memory_map_is_latest = True
	
	data_cache_is_latest = False
	if data_cache is None:
		resolve_data_cache()
		data_cache_is_latest = True
		
	if force_update:
		if not page_table_is_latest:
			resolve_page_table()
		if not memory_map_is_latest:
			resolve_memory_map()
		if not data_cache_is_latest:
			resolve_data_cache()
			

def init_page_table(force_update=False):
	global page_table
	
	page_table_is_latest = False
	if page_table is None:
		resolve_page_table()
		page_table_is_latest = True
		
	if force_update:
		if not page_table_is_latest:
			resolve_page_table()
	
	
def init_memory_map(force_update=False):
	global memory_map
	
	memory_map_is_latest = False
	if memory_map is None:
		resolve_memory_map()
		memory_map_is_latest = True
		
	if force_update:
		if not memory_map_is_latest:
			resolve_memory_map()
	
	
def init_data_cache(force_update=False):
	global data_cache
	
	data_cache_is_latest = False
	if data_cache is None:
		resolve_data_cache()
		data_cache_is_latest = True
		
	if force_update:
		if not data_cache_is_latest:
			resolve_data_cache()