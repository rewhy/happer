import binascii
import os


# normal configurations
debug = True

workspace = "D:\\unpacking\\memory_dump_unpacking_aosp_6_0"
script_directory = "arm"
dex_directory = "dex"
libc_memory_directory = "libc_memory"
libart_memory_directory = "libart_memory"


# package name
# normal
# package_name = "com.holokenmod"
package_name = "com.markuspage.android.atimetracker"

# package_name = "com.xianhuosong.admin"
# package_name = "com.chuxin"
# package_name = "com.simtrons.dance"
# package_name = "com.huohuang.kpxzs1106"
# package_name = "Copy.ByLiuHeng"
# package_name = "com.goplaycn.googleinstall"
# package_name = "i.want.money.hongbao"
# package_name = "Copy.by.budaoweng"
# package_name = "cn.vpnserve"
# package_name = "com.inewcontentfine.ngb"
# package_name = "com.mianfeilixiantxts.novelbook"
# package_name = "com.example.xrx02"
# package_name = "com.studentmath"
# package_name = "br.com.rodrigokolb.realdrum"
# package_name = "com.vertech.regist"
# package_name = "com.point.cn.my.wgjy"
# package_name = "com.xudeliang.qxcyc"
# package_name = "com.hssc.browser"
# package_name = "com.ivyn.gopu0"
# package_name = "com.lt.lighting"
# package_name = "com.hd.android"
# package_name = "cn.sc.beso"
# package_name = "com.KXtec.SuperPig"
# package_name = "system.operating.dominance.proj"
# package_name = "com.kdsiowl.mskiwl.ll"
# package_name = "com.ditangsf.penguin"
# package_name = "com.syezon.wifi"
# package_name = "qyg.project.ttfx"
# package_name = "com.example.xnjh"
# package_name = "com.bbk.appstore"
# package_name = "fsghsty.com"
# package_name = "com.xin.lon"
# package_name = "com.ctzsl"

# packer specific
packer_specific_package_names = ["Anonymous-DexFile", "internal"]  # for baidu packer

def package_filter(dex_file_location):
	if dex_file_location.__contains__(package_name):
		return True
	for candidate_name in packer_specific_package_names:
		if dex_file_location.__contains__(candidate_name):
			return True
	
	return False
	
	
# framework method filter
framework_specific_class_names = ["java/util/stream", "android/content/res/ResourcesImpl", "android/widget/TableRow", 
								  "com/android/internal/app/AlertController", "android/preference", ]

def framework_filter(method_signature):
	for candidate_name in framework_specific_class_names:
		if method_signature.__contains__(candidate_name):
			return True
	
	return False
	

log_file = "log.txt"
def log_print(log_info):
	log_path = os.path.join(workspace, log_file)
	log_handler = open(log_path, 'a+')
	log_handler.write(log_info)
	log_handler.write('\n')
	log_handler.flush()
	log_handler.close()
	

# dex info	
dex_info_file = "dex_info.txt"

def save_dex_info(base, size, name):
	dex_info_path = os.path.join(workspace, dex_info_file)
	dex_info_handler = open(dex_info_path, 'a+')
	
	dex_info = "%0#10x, %#x, %s" % (base, size, name)
	dex_info_handler.write(dex_info)
	dex_info_handler.write('\n')
	dex_info_handler.flush()
	dex_info_handler.close()

def load_dex_info():
	dex_info_path = os.path.join(workspace, dex_info_file)
	dex_info_handler = open(dex_info_path, 'r')
	
	dex_info_list = []
	for dex_info in dex_info_handler.readlines():
		base = int(dex_info.split(',')[0].strip(), 16)
		size = int(dex_info.split(',')[1].strip(), 16)
		name = dex_info.split(',')[2].strip()
		dex_info_list.append((base, size, name))
	
	dex_info_handler.close()
	
	return dex_info_list
	
	
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
	
		return tv_sec, tv_usec
	else:
		return 0, 0
	

# - address -

# library
# libart.so
libart_base 								= 0xf4a7d000
libart_memory_offset 						= 0x00097630
libart_file_offset 							= 0x000a5630
libart_executable_start						= libart_base
libart_executable_end						= 0xf4eb2000
# libc.so
libc_base									= 0xf6e6e000
libc_memory_offset							= 0x000158d0
libc_file_offset							= 0x000158d0
libc_executable_start						= libc_base
libc_executable_end							= 0xf6ee0000

# method

# - libart.so - #
# DexFile_start 								= 0x0015edc0
DexFile_start								= 0x00161450
DexFile_end 								= 0x0015ee3a
DexFile_script 								= "DexFile.py"
LoadClassMembers_start						= 0x0011da44
LoadClassMembers_end 						= 0x0011dd6a
LoadClassMembers_script						= "LoadClassMembers.py"
LoadMethod_start							= 0x0011d794
LoadMethod_end								= 0x0011d84e
LoadMethod_script 							= "LoadMethod.py"
LoadNativeLibrary_start						= 0x0024fea4
LoadNativeLibrary_end						= 0x0024ffa4
LoadNativeLibrary_script 					= "LoadNativeLibrary.py"
JNI_onLoad_start							= 0x0025033a  # -> JNI_onLoad
JNI_onLoad_end								= 0x0025033c  # JNI_onLoad <-
JNI_onLoad_script							= "JNI_onLoad.py"
DexModification_script						= "DexModification.py"
ArtQuickGenericJniTrampoline_start 			= 0x003e7a54
ArtQuickGenericJniTrampoline_end			= 0x003e7df2
ArtQuickGenericJniTrampoline_script 		= "ArtQuickGenericJniTrampoline.py"
ArtQuickGenericJniEndTrampoline_start		= 0x003e7fdc
ArtQuickGenericJniEndTrampoline_end			= 0x0  # this method has two exits
ArtQuickGenericJniEndTrampoline_script		= "ArtQuickGenericJniEndTrampoline.py"
ArtQuickToInterpreterBridge_start 			= 0x003e9ac4
ArtQuickToInterpreterBridge_end				= 0x003e9d2a
ArtQuickToInterpreterBridge_script 			= "ArtQuickToInterpreterBridge.py"
# ArtInterpreterToInterpreterBridge_start 	= 0x0
# ArtInterpreterToInterpreterBridge_end		= 0x0
# ArtInterpreterToInterpreterBridge_script	= "ArtInterpreterToInterpreterBridge.py"
# ArtInterpreterToCompiledCodeBridge_start	= 0x0
# ArtInterpreterToCompiledCodeBridge_end		= 0x0
# ArtInterpreterToCompiledCodeBridge_script	= "ArtInterpreterToCompiledCodeBridge.py"
DoCall_start								= 0x001fbab8
DoCall_end									= 0x001fbc26
DoCall_script								= "DoCall.py"
ClassModification_script					= "ClassModification.py"
Invoke_start								= 0x000ec54c
Invoke_end									= 0x000ec624
Invoke_script								= "Invoke.py"

# - libc.so - #
strcmp_start								= 0x000183ec
strcmp_end									= 0x00018680
strcmp_script								= "strcmp.py"
memcmp_start								= 0x00018d64
memcmp_end									= 0x00018fec
memcmp_script								= "memcmp.py"
strncmp_start								= 0x000354ea
strncmp_end									= 0x00035512
strncmp_script								= "strncmp.py"
clock_gettime_start							= 0x0004140c
clock_gettime_end							= 0x00041424
clock_gettime_script						= "clock_gettime.py"
gettimeofday_start							= 0x000418c8
gettimeofday_end							= 0x000418dc
gettimeofday_script							= "gettimeofday.py"


# - breakpoint -

# - libart.so - #
brk_DexFile									= libart_base + DexFile_start - libart_file_offset + libart_memory_offset
brk_LoadClassMembers						= libart_base + LoadClassMembers_start - libart_file_offset + libart_memory_offset
brk_LoadMethod 								= libart_base + LoadMethod_start - libart_file_offset + libart_memory_offset
brk_LoadNativeLibrary						= libart_base + LoadNativeLibrary_start - libart_file_offset + libart_memory_offset
brk_JNI_onLoad								= libart_base + JNI_onLoad_end - libart_file_offset + libart_memory_offset
brk_ArtQuickGenericJniTrampoline			= libart_base + ArtQuickGenericJniTrampoline_start - libart_file_offset + libart_memory_offset
brk_ArtQuickGenericJniEndTrampoline			= libart_base + ArtQuickGenericJniEndTrampoline_start - libart_file_offset + libart_memory_offset
# brk_ArtInterpreterToInterpreterBridge		= libart_base + ArtInterpreterToInterpreterBridge_start - libart_file_offset + libart_memory_offset
# brk_ArtInterpreterToCompiledCodeBridge		= libart_base + ArtInterpreterToCompiledCodeBridge_start - libart_file_offset + libart_memory_offset
brk_ArtQuickToInterpreterBridge				= libart_base + ArtQuickToInterpreterBridge_start - libart_file_offset + libart_memory_offset
brk_DoCall									= libart_base + DoCall_start - libart_file_offset + libart_memory_offset
brk_Invoke									= libart_base + Invoke_start - libart_file_offset + libart_memory_offset

# - libc.so - #
brk_strcmp									= libc_base + strcmp_start - libc_file_offset + libc_memory_offset
brk_strncmp									= libc_base + strncmp_start - libc_file_offset + libc_memory_offset
brk_clock_gettime							= libc_base + clock_gettime_start - libc_file_offset + libc_memory_offset
brk_gettimeofday							= libc_base + gettimeofday_start - libc_file_offset + libc_memory_offset


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
offset_DexCache_dex_file_ 								= 0x20

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
offset_ShadowFrame_link_ 								= 0x4
offset_ShadowFrame_method_ 								= 0x8

# art::runtime::ArtMethod
offset_ArtMethod_declaring_class_ 						= 0x0
offset_ArtMethod_dex_cache_resolved_methods_ 			= 0x4
offset_ArtMethod_dex_cache_resolved_types_				= 0x8
offset_ArtMethod_access_flags_ 							= 0xc
offset_ArtMethod_dex_code_item_offset_ 					= 0x10
offset_ArtMethod_dex_method_index_ 						= 0x14
offset_ArtMethod_method_index_ 							= 0x18
offset_ArtMethod_entry_point_from_interpreter_			= 0x1c
offset_ArtMethod_entry_point_from_jni_					= 0x20
offset_ArtMethod_entry_point_from_quick_compiled_code_ 	= 0x24


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
	
	

