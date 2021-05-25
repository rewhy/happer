import binascii
import os


# normal configurations
art = True  # otherwise, dvm = True
dvm = not art

debug = True
trace = True  # * by default, it is False * #
workspace = "D:\\unpacking\\unpacking_aosp_8_1"

script_directory = "arm"
dex_directory = "dex"
library_directory = "library"
libc_memory_directory = "libc_memory"
libart_memory_directory = "libart_memory"
liblog_memory_directory = "liblog_memory"


# package name
# normal
package_name = "hk.polyu.junodemo"
# package_name = "com.markuspage.android.atimetracker"
# package_name = "hk.polyu.fileoperation"
# package_name = "com.holokenmod"
# package_name = "eu.chainfire.cfbench"
# package_name = "hk.polyu.sha256sum"

# package_name = "com.xingmai.dazhong"
# package_name = "com.limitemp.interstellar"
# package_name = "com.fenixx.gameboosterplus"
# package_name = "cn.cash360.wolf"
# package_name = "com.cashnews.spicy"
# package_name = "com.systbfsh.dlwzpw2532"
# package_name = "lf.express.yunda"
# package_name = "com.newyork.porsche"
# package_name = "com.zzg.georgeapk.date20130229.flash42"
# package_name = "bjdgbvd.etguhgf.vxzcf"
# package_name = "com.android.toolss"
# package_name = "com.toolx.android2"
# package_name = "com.android.movil"
# package_name = "tgbetl.vkffmjl.vpbtfak"
# package_name = "com.coolx.android1"
# package_name = "nuwqbrr.woy.svotobpz"
# package_name = "HE.HL.ms1"

# package_name = "cn.com.wiisoft.polly"
# package_name = "cn.com.wiisoft.tutule"
# package_name = "cn.uqu8.wordPuzzles"
# package_name = "com.chinahuben.NCRE"
# package_name = "com.jiasu.duoshao.quanyuan2"
# package_name = "com.jmchn.typhoon"
# package_name = "com.lisaview.wewer"
# package_name = "com.michael.think"
# package_name = "com.newyork.audio"
# package_name = "com.newyork.porsche"
# package_name = "com.train"
# package_name = "com.xiaoji.xiadan.android"
# package_name = "com.xiao.xiadan.game.android"
# package_name = "com.xww.wanysys"
# package_name = "dktools.duokaidashibast"
# package_name = "org.michael.bubbles"

# package_name = "com.goplaycn.googleinstall"
# package_name = "com.mirageengine.tvzt.common.xxyw002.phone"
# package_name = "com.zsapp.entranslation.hw"
# package_name = "com.zsapp.jiakaok1.hw"
# package_name = "com.ztsoft.jiazhaokaoshik1.hw"
# package_name = "com.ztsoft.livetv"

# package_name = "bitoujf.com"
# package_name = "chengqiang.celever2005.English8900"
# package_name = "chengqiang.celever2005.medicine"
# package_name = "cn.bitsfun.light"
# package_name = "cn.com.creditloans"
# package_name = "cn.com.opda.android.clearmaster"
# package_name = "cn.gamedog.andrlolbox"
# package_name = "cn.gamedog.daypaoskill"


# packer specific
packer_specific_package_names = [ "Anonymous-DexFile", ]  # for baidu packer
packer_specific_library_names = [ "libbaiduprotect.so", 
								  "libexec.so", 
								  "libjiagu.so", 
								  "libBugly.so", "libshella", 
								  "libSecShell.so", 
								  "libkdp.so", "libkwscmm.so", 
								  "libs18000.so", 
								  "libCFBench.so", ]

def package_filter(dex_file_location):
	if dex_file_location.__contains__(package_name):
		return True
	for candidate_name in packer_specific_package_names:
		if dex_file_location.__contains__(candidate_name):
			return True
	
	return False


def library_filter(library_name):
	if library_name.__contains__(package_name):
		return True
	for candidate_name in packer_specific_library_names:
		if library_name.__contains__(candidate_name):
			return True
	
	return False
	
	
# # framework method filter
# framework_specific_class_names = ["java/util/stream", "android/content/res/ResourcesImpl", "android/widget/TableRow", 
								  # "com/android/internal/app/AlertController", "android/preference", ]

# def framework_filter(method_signature):
	# for candidate_name in framework_specific_class_names:
		# if method_signature.__contains__(candidate_name):
			# return True
	
	# return False


# log info
log_file = "log.txt"

def log_print(log_info):
	log_path = os.path.join(workspace, log_file)
	log_handler = open(log_path, 'a+')
	log_handler.write(log_info)
	log_handler.write('\n')
	log_handler.flush()
	log_handler.close()
	
	
# time info
time_info_file = "time_info.txt"

def save_time_info(tv_sec, tv_usec):
	time_info_path = os.path.join(workspace, time_info_file)
	time_info_handler = open(time_info_path, 'w')
	
	time_info = "%0#10x, %0#10x" % (tv_sec, tv_usec)
	time_info_handler.write(time_info)
	time_info_handler.write('\n')
	
	time_info_handler.flush()
	time_info_handler.close()

def load_time_info():
	if os.path.exists(os.path.join(workspace, time_info_file)):
		time_info_path = os.path.join(workspace, time_info_file)
		time_info_handler = open(time_info_path, 'r')
	
		time_info = time_info_handler.readlines()[0]
		tv_sec = int(time_info.split(',')[0].strip(), 16)
		tv_usec = int(time_info.split(',')[1].strip(), 16)
		
		time_info_handler.close()
	
		return tv_sec, tv_usec
	else:
		return 0, 0
		
		
# app range info
range_info_file = "range_info.txt"

def save_range_info(start, end):
	range_info_path = os.path.join(workspace, range_info_file)
	range_info_handler = open(range_info_path, 'a+')
	
	range_info = "%0#10x, %0#10x" % (start, end)
	range_info_handler.write(range_info)
	range_info_handler.write('\n')
	
	range_info_handler.flush()
	range_info_handler.close()

def load_range_info():
	range_info_set = set()
	
	if os.path.exists(os.path.join(workspace, range_info_file)):
		range_info_path = os.path.join(workspace, range_info_file)
		range_info_handler = open(range_info_path, 'r')
	
		range_infos = range_info_handler.readlines()
		for range_info in range_infos:
			start = int(range_info.split(',')[0].strip(), 16) & 0xffffffffL
			end = int(range_info.split(',')[1].strip(), 16) & 0xffffffffL
			range_info_set.add((start, end))
			
		range_info_handler.close()
	
	return range_info_set

def in_app_range(addr):
	range_info_set = load_range_info()
	for range_info in range_info_set:
		start = range_info[0]
		end = range_info[1]
		if addr >= start and addr <= end:
			return True
			
	return False
	

# mirror class info
class_info_file = "class_info.txt"

def save_class_info(thread_ptr, mirror_class_names, mirror_class_ptrs):
	class_info_path = os.path.join(workspace, class_info_file)
	class_info_handler = open(class_info_path, 'a+')
	
	for idx in range(len(mirror_class_names)):
		class_name = mirror_class_names[idx]
		class_ptr = mirror_class_ptrs[idx]
		class_info = "%0#10x, %s, %0#10x" % (thread_ptr, class_name, class_ptr)
		class_info_handler.write(class_info)
		class_info_handler.write('\n')
	
	class_info_handler.flush()
	class_info_handler.close()
	
def load_class_info():
	thread_ptr = None
	mirror_class_names = []
	mirror_class_ptrs = []
	
	if os.path.exists(os.path.join(workspace, class_info_file)):
		class_info_path = os.path.join(workspace, class_info_file)
		class_info_handler = open(class_info_path, 'r')
	
		class_infos = class_info_handler.readlines()
		for class_info in class_infos:
			thread_ptr = int(class_info.split(',')[0].strip(), 16) & 0xffffffffL
			class_name = class_info.split(',')[1].strip()
			class_ptr = int(class_info.split(',')[2].strip(), 16) & 0xffffffffL
			mirror_class_names.append(class_name)
			mirror_class_ptrs.append(class_ptr)
			
		class_info_handler.close()
	
	return thread_ptr, mirror_class_names, mirror_class_ptrs
		

# - address -

# library
libart_base 								= 0xf2c89000
libart_memory_offset 						= 0x0009f800
libart_file_offset 							= 0x000ab800
libart_executable_start						= libart_base
libart_executable_end						= 0xf30d6000

libc_base									= 0xf3445000
libc_memory_offset							= 0x00017190
libc_file_offset							= 0x00017190
libc_executable_start						= libc_base
libc_executable_end							= 0xf34d2000

# application
linker_base									= 0xf69ec000
linker_memory_offset						= 0x00002fa0
linker_file_offset							= 0x00002fa0
linker_executable_start						= linker_base
linker_executable_end						= 0xf6a74000


# method

# ??
entrypoint_script 							= "entrypoint.py"

# - libart.so - #
DexFile_start 								= 0x0013cef8
DexFile_end 								= 0x0013d042
DexFile_script 								= "DexFile.py"
FindClass_start								= 0x000ed8dc + 0x6
FindClass_end								= 0x000edb4c - 0x2
FindClass_ijiami_script						= "FindClass_ijiami.py"
FindClass_kiwi_script						= "FindClass_kiwi.py"
InitClass_start								= 0x000e686c + 0x6
InitClass_end								= 0x000e68fc - 0x2
InitClass_kiwi_script						= "InitClass_kiwi.py"
LoadClassMembers_start						= 0x000f2320
LoadClassMembers_end 						= 0x000f26f2
LoadClassMembers_script						= "LoadClassMembers.py"
LoadMethod_start							= 0x000f2d24
LoadMethod_end								= 0x000f2e48
LoadMethod_script 							= "LoadMethod.py"
LoadNativeLibrary_start						= 0x0024f134
LoadNativeLibrary_end						= 0x0024fb46
LoadNativeLibrary_script 					= "LoadNativeLibrary.py"
JNI_onLoad_start							= 0x0024f890  # -> JNI_onLoad
JNI_onLoad_end								= 0x0024f892  # JNI_onLoad <-
JNI_onLoad_script							= "JNI_onLoad.py"
ArtQuickGenericJniTrampoline_start 			= 0x003e4804
ArtQuickGenericJniTrampoline_end			= 0x003e4984
ArtQuickGenericJniTrampoline_script 		= "ArtQuickGenericJniTrampoline.py"
GenericJniMethodEnd_start					= 0x003e0648
GenericJniMethodEnd_end						= 0x003e0708
GenericJniMethodEnd_script					= "GenericJniMethodEnd.py"
ArtQuickToInterpreterBridge_start 			= 0x003e0e24
ArtQuickToInterpreterBridge_end				= 0x003e1002
ArtQuickToInterpreterBridge_script 			= "ArtQuickToInterpreterBridge.py"
ArtInterpreterToInterpreterBridge_start 	= 0x001e73ec
ArtInterpreterToInterpreterBridge_end		= 0x001e74a8
ArtInterpreterToInterpreterBridge_script	= "ArtInterpreterToInterpreterBridge.py"
ArtInterpreterToCompiledCodeBridge_start	= 0x00200d04
ArtInterpreterToCompiledCodeBridge_end		= 0x00200dfa
ArtInterpreterToCompiledCodeBridge_script	= "ArtInterpreterToCompiledCodeBridge.py"
DoCall_start								= 0x001fc118
DoCall_end									= 0x001fc42e
DoCall_script								= "DoCall.py"
#											= ??
#											= ??
ClassModification_script					= "ClassModification.py"
InvokeWithArgArray_start					= 0x00355b98
InvokeWithArgArray_end						= 0x00355be2
InvokeWithArgArray_script					= "InvokeWithArgArray.py"
RegisterNatives_start						= 0x002adb0c
RegisterNatives_end							= 0x002ae7f0
RegisterNatives_script						= "RegisterNatives.py"

# - libc.so - #
clock_gettime_start							= 0x00018334
clock_gettime_end							= 0x0001833c
clock_gettime_script						= "clock_gettime.py"
system_property_get_start					= 0x000222ec
system_property_get_end						= 0x000222fa
system_property_get_script					= "system_property_get.py"
time_start									= 0x00041c10
time_end									= 0x00041c48
time_script								 	= "time.py"
gettimeofday_start							= 0x00048bb8
gettimeofday_end							= 0x00048bcc
gettimeofday_script							= "gettimeofday.py"
fopen_start									= 0x00051230
fopen_end									= 0x000512a8
fopen_adg_script							= "fopen_adg.py"
fopen_aeu_script							= "fopen_aeu.py"
fopen_adi_script							= "fopen_adi.py"

# a special one !!!
clear_cache_script 							= "clear_cache.py"

# - linker - #
do_dlopen_start								= 0x000054fc
do_dlopen_end								= 0x00005a06
do_dlopen_script							= "do_dlopen.py"


# - breakpoint -

# - libart.so - #
brk_DexFile									= libart_base + DexFile_start - libart_file_offset + libart_memory_offset
brk_FindClass								= libart_base + FindClass_start - libart_file_offset + libart_memory_offset
brk_FindClass_end							= libart_base + FindClass_end - libart_file_offset + libart_memory_offset
brk_InitClass								= libart_base + InitClass_start - libart_file_offset + libart_memory_offset
brk_InitClass_end							= libart_base + InitClass_end - libart_file_offset + libart_memory_offset
brk_LoadClassMembers						= libart_base + LoadClassMembers_start - libart_file_offset + libart_memory_offset
brk_LoadMethod 								= libart_base + LoadMethod_start - libart_file_offset + libart_memory_offset
brk_LoadNativeLibrary						= libart_base + LoadNativeLibrary_start - libart_file_offset + libart_memory_offset
# brk_JNI_onLoad								= libart_base + JNI_onLoad_start - libart_file_offset + libart_memory_offset  # before JNI_onLoad
brk_JNI_onLoad								= libart_base + JNI_onLoad_end - libart_file_offset + libart_memory_offset  # after JNI_onLoad
brk_ArtQuickGenericJniTrampoline			= libart_base + ArtQuickGenericJniTrampoline_start - libart_file_offset + libart_memory_offset
brk_GenericJniMethodEnd						= libart_base + GenericJniMethodEnd_start - libart_file_offset + libart_memory_offset
brk_ArtInterpreterToInterpreterBridge		= libart_base + ArtInterpreterToInterpreterBridge_start - libart_file_offset + libart_memory_offset
brk_ArtInterpreterToCompiledCodeBridge		= libart_base + ArtInterpreterToCompiledCodeBridge_start - libart_file_offset + libart_memory_offset
brk_ArtQuickToInterpreterBridge				= libart_base + ArtQuickToInterpreterBridge_start - libart_file_offset + libart_memory_offset
brk_DoCall									= libart_base + DoCall_start - libart_file_offset + libart_memory_offset
brk_InvokeWithArgArray						= libart_base + InvokeWithArgArray_start - libart_file_offset + libart_memory_offset
brk_RegisterNatives							= libart_base + RegisterNatives_start - libart_file_offset + libart_memory_offset

# - libc.so - #
brk_clock_gettime							= libc_base + clock_gettime_start - libc_file_offset + libc_memory_offset
brk_system_property_get						= libc_base + system_property_get_start - libc_file_offset + libc_memory_offset
brk_time									= libc_base + time_start - libc_file_offset + libc_memory_offset
brk_gettimeofday							= libc_base + gettimeofday_start - libc_file_offset + libc_memory_offset
brk_fopen									= libc_base + fopen_start - libc_file_offset + libc_memory_offset

# - linker - #
brk_do_dlopen								= linker_base + do_dlopen_start - linker_file_offset + linker_memory_offset


# - structure -

# std::string
offset_string_length 									= 0x0
offset_string_capacity 									= 0x4
offset_string_reference 								= 0x8

# art::runtime::DexFile
offset_DexFile_begin_									= 0x4
offset_DexFile_size_ 									= 0x8
offset_DexFile_location_ 								= 0xc

# art::runtime::DexFile::CodeItem
offset_DexFile_CodeItem_tries_size_						= 0x6
offset_DexFile_CodeItem_insns_size_in_code_units_ 		= 0xc

# art::mirror::HeapReference
offset_HeapReference_reference_ 						= 0x0

# art::mirror::DexCache
offset_DexCache_dex_file_ 								= 0x10

# art::mirror::Class
offset_Class_class_loader 								= 0x0
offset_Class_component_type 							= 0x8
offset_Class_dex_cache_ 								= 0x10
# offset_Class_ext_data_ 								= 0x18
# offset_Class_iftable_									= 0x20
# offset_Class_name_ 									= 0x28
# offset_Class_super_class_ 							= 0x30
# offset_Class_vtable_ 									= 0x38

# art::mirror::CompressedReference
offset_CompressesReference_reference_ 					= 0x0

# art::runtime::GcRoot
offset_GcRoot_root_ 									= 0x0

# art::runtime::ShadowFrame
offset_ShadowFrame_link_ 								= 0x0
offset_ShadowFrame_method_ 								= 0x4

# art::runtime::ArtMethod
offset_ArtMethod_declaring_class_ 						= 0x0
offset_ArtMethod_access_flags_ 							= 0x4
offset_ArtMethod_dex_code_item_offset_ 					= 0x8
offset_ArtMethod_dex_method_index_ 						= 0xc
offset_ArtMethod_method_index_ 							= 0x10
offset_ArtMethod_hotness_count_ 						= 0x12
offset_ArtMethod_dex_cache_resolved_methods_ 			= 0x14
offset_ArtMethod_data_ 									= 0x18
offset_ArtMethod_entry_point_from_quick_compiled_code 	= 0x1c

# soinfo
offset_soinfo_old_name_            	= 0x0
offset_soinfo_phdr                 	= 0x80
offset_soinfo_phnum                	= 0x84
offset_soinfo_unused0              	= 0x88
offset_soinfo_base                 	= 0x8c
offset_soinfo_size                 	= 0x90
offset_soinfo_unused1              	= 0x94
offset_soinfo_dynamic              	= 0x98
offset_soinfo_unused2              	= 0x9c
offset_soinfo_unused3              	= 0xa0
offset_soinfo_next                 	= 0xa4
offset_soinfo_flags_               	= 0xa8
offset_soinfo_strtab_              	= 0xac
offset_soinfo_symtab_              	= 0xb0
offset_soinfo_nbucket_             	= 0xb4
offset_soinfo_nchain_              	= 0xb8
offset_soinfo_bucket_              	= 0xbc
offset_soinfo_chain_               	= 0xc0
offset_soinfo_plt_got_             	= 0xc4
offset_soinfo_plt_rel_             	= 0xc8
offset_soinfo_plt_rel_count_       	= 0xcc
offset_soinfo_rel_                 	= 0xd0
offset_soinfo_rel_count_           	= 0xd4
offset_soinfo_preinit_array_       	= 0xd8
offset_soinfo_preinit_array_count_ 	= 0xdc
offset_soinfo_init_array_          	= 0xe0
offset_soinfo_init_array_count_    	= 0xe4
offset_soinfo_fini_array_          	= 0xe8
offset_soinfo_fini_array_count_    	= 0xec
offset_soinfo_init_func_           	= 0xf0
offset_soinfo_fini_func_           	= 0xf4
offset_soinfo_ARM_exidx            	= 0xf8
offset_soinfo_ARM_exidx_count      	= 0xfc
offset_soinfo_ref_count_           	= 0x100
offset_soinfo_link_map_head        	= 0x104
offset_soinfo_constructors_called  	= 0x118
offset_soinfo_load_bias            	= 0x11c
offset_soinfo_has_text_relocations 	= 0x120
offset_soinfo_has_DT_SYMBOLIC      	= 0x121
offset_soinfo_version_             	= 0x124
offset_soinfo_st_dev_              	= 0x128
offset_soinfo_st_ino_              	= 0x12c
offset_soinfo_children_            	= 0x130
offset_soinfo_parents_             	= 0x138
offset_soinfo_file_offset_         	= 0x140
offset_soinfo_rtld_flags_          	= 0x148
offset_soinfo_dt_flags_1_          	= 0x14c
offset_soinfo_strtab_size_         	= 0x150
offset_soinfo_gnu_nbucket_         	= 0x154
offset_soinfo_gnu_bucket_          	= 0x158
offset_soinfo_gnu_chain_           	= 0x15c
offset_soinfo_gnu_maskwords_       	= 0x160
offset_soinfo_gnu_shift2_          	= 0x164
offset_soinfo_gnu_bloom_filter_    	= 0x168
offset_soinfo_local_group_root_    	= 0x16c
offset_soinfo_android_relocs_      	= 0x170
offset_soinfo_android_relocs_size_ 	= 0x174
offset_soinfo_soname_              	= 0x178
offset_soinfo_realpath_            	= 0x17c
offset_soinfo_versym_              	= 0x188
offset_soinfo_verdef_ptr_          	= 0x18c
offset_soinfo_verdef_cnt_          	= 0x190
offset_soinfo_verneed_ptr_         	= 0x194
offset_soinfo_verneed_cnt_         	= 0x198
offset_soinfo_target_sdk_version_  	= 0x19c
offset_soinfo_dt_runpath_          	= 0x1a0
offset_soinfo_primary_namespace_   	= 0x1ac
offset_soinfo_secondary_namespaces_	= 0x1b0
offset_soinfo_handle_              	= 0x1b8

# Ehdr
offset_Ehdr_e_ident 				= 0x0
offset_Ehdr_e_type					= 0x10
offset_Ehdr_e_machine				= 0x12
offset_Ehdr_e_version				= 0x14
offset_Ehdr_e_entry					= 0x18
offset_Ehdr_e_phoff					= 0x1c
offset_Ehdr_e_shoff					= 0x20
offset_Ehdr_e_flags					= 0x24
offset_Ehdr_e_ehsize				= 0x28
offset_Ehdr_e_phentsize				= 0x2a
offset_Ehdr_e_phnum					= 0x2c
offset_Ehdr_e_shentsize				= 0x2e
offset_Ehdr_e_shnum					= 0x30
offset_Ehdr_e_shstrndx				= 0x32

# Phdr
offset_Phdr_p_type					= 0x0
offset_Phdr_p_offset				= 0x4
offset_Phdr_p_vaddr					= 0x8
offset_Phdr_p_paddr					= 0xc
offset_Phdr_p_filesz				= 0x10
offset_Phdr_p_memsz					= 0x14
offset_Phdr_p_flags					= 0x18
offset_Phdr_p_align					= 0x1c


ACC_PUBLIC 					= 0x1
ACC_PRIVATE 				= 0x2
ACC_PROTECTED 				= 0x4
ACC_STATIC					= 0x8
ACC_FINAL					= 0x10
ACC_SYNCHRONIZED 			= 0x20
ACC_VOLATILE				= 0x40
ACC_TRANSIENT				= 0x80
ACC_NATIVE					= 0x100
ACC_INTERFACE				= 0x200
ACC_ABSTRACT				= 0x400
ACC_STRICT					= 0x800
ACC_SYNTHETIC 				= 0x1000
ACC_ANNOTATION				= 0x2000
ACC_ENUM					= 0x4000
ACC_CONSTRUCTOR				= 0x10000
ACC_DECLARED_SYNCHRONIZED 	= 0x20000

def resolve_access_flags(access_flags):
	flags = ""
	if access_flags & ACC_PUBLIC == 0x1:
		flags = flags + "ACC_PUBLIC" + " | "
		access_flags = access_flags - ACC_PUBLIC
	if access_flags & ACC_PRIVATE == 0x2:
		flags = flags + "ACC_PRIVATE" + " | "
		access_flags = access_flags - ACC_PRIVATE
	if access_flags & ACC_PROTECTED == 0x4:
		flags = flags + "ACC_PROTECTED" + " | "
		access_flags = access_flags - ACC_PROTECTED
	if access_flags & ACC_STATIC == 0x8:
		flags = flags + "ACC_STATIC" + " | "
		access_flags = access_flags - ACC_STATIC
	if access_flags & ACC_FINAL == 0x10:
		flags = flags + "ACC_FINAL" + " | "
		access_flags = access_flags - ACC_FINAL
	if access_flags & ACC_SYNCHRONIZED == 0x20:
		flags = flags + "ACC_SYNCHRONIZED" + " | "
		access_flags = access_flags - ACC_SYNCHRONIZED
	if access_flags & ACC_VOLATILE == 0x40:
		flags = flags + "ACC_VOLATILE" + " | "
		access_flags = access_flags - ACC_VOLATILE
	if access_flags & ACC_TRANSIENT == 0x80:
		flags = flags + "ACC_TRANSIENT" + " | "
		access_flags = access_flags - ACC_TRANSIENT
	if access_flags & ACC_NATIVE == 0x100:
		flags = flags + "ACC_NATIVE" + " | "
		access_flags = access_flags - ACC_NATIVE
	if access_flags & ACC_INTERFACE == 0x200:
		flags = flags + "ACC_INTERFACE" + " | "
		access_flags = access_flags - ACC_INTERFACE
	if access_flags & ACC_ABSTRACT == 0x400:
		flags = flags + "ACC_ABSTRACT" + " | "
		access_flags = access_flags - ACC_ABSTRACT
	if access_flags & ACC_STRICT == 0x800:
		flags = flags + "ACC_STRICT" + " | "
		access_flags = access_flags - ACC_STRICT
	if access_flags & ACC_SYNTHETIC == 0x1000:
		flags = flags + "ACC_SYNTHETIC" + " | "
		access_flags = access_flags - ACC_SYNTHETIC
	if access_flags & ACC_ANNOTATION == 0x2000:
		flags = flags + "ACC_ANNOTATION" + " | "
		access_flags = access_flags - ACC_ANNOTATION
	if access_flags & ACC_ENUM == 0x4000:
		flags = flags + "ACC_ENUM" + " | "
		access_flags = access_flags - ACC_ENUM
	if access_flags & ACC_CONSTRUCTOR == 0x10000:
		flags = flags + "ACC_CONSTRUCTOR" + " | "
		access_flags = access_flags - ACC_CONSTRUCTOR
	if access_flags & ACC_DECLARED_SYNCHRONIZED == 0x20000:
		flags = flags + "ACC_DECLARED_SYNCHRONIZED" + " | "
		access_flags = access_flags - ACC_DECLARED_SYNCHRONIZED
		
	# if access_flags != 0x0:
		# print "resolved flags %s" % flags
		# print "unresolved flags %#x" % access_flags
		# raise RuntimeError("unsupported access_flags = %#x" % access_flags)
		
	return flags

def resolve_method_access_flags(access_flags):
	flags = ""
	if access_flags & ACC_PUBLIC == 0x1:
		flags = flags + "public" + " "
		access_flags = access_flags - ACC_PUBLIC
	if access_flags & ACC_PRIVATE == 0x2:
		flags = flags + "private" + " "
		access_flags = access_flags - ACC_PRIVATE
	if access_flags & ACC_PROTECTED == 0x4:
		flags = flags + "protected" + " "
		access_flags = access_flags - ACC_PROTECTED
	if access_flags & ACC_STATIC == 0x8:
		flags = flags + "static" + " "
		access_flags = access_flags - ACC_STATIC
	if access_flags & ACC_FINAL == 0x10:
		flags = flags + "final" + " "
		access_flags = access_flags - ACC_FINAL
	if access_flags & ACC_SYNCHRONIZED == 0x20:
		flags = flags + "synchronized" + " "
		access_flags = access_flags - ACC_SYNCHRONIZED
	if access_flags & ACC_VOLATILE == 0x40:
		flags = flags + "volatile" + " "
		access_flags = access_flags - ACC_VOLATILE
	if access_flags & ACC_TRANSIENT == 0x80:
		flags = flags + "transient" + " "
		access_flags = access_flags - ACC_TRANSIENT
	if access_flags & ACC_NATIVE == 0x100:
		flags = flags + "native" + " "
		access_flags = access_flags - ACC_NATIVE
	if access_flags & ACC_INTERFACE == 0x200:
		flags = flags + "interface" + " "
		access_flags = access_flags - ACC_INTERFACE
	if access_flags & ACC_ABSTRACT == 0x400:
		flags = flags + "abstract" + " "
		access_flags = access_flags - ACC_ABSTRACT
	if access_flags & ACC_SYNTHETIC == 0x1000:
		flags = flags + "synthetic" + " "
		access_flags = access_flags - ACC_SYNTHETIC
	if access_flags & ACC_CONSTRUCTOR == 0x10000:
		flags = flags + "constructor" + " "
		access_flags = access_flags - ACC_CONSTRUCTOR
		
	return flags
	
	

