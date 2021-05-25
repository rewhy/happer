#!/bin/sh

if [ ! -d "/home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_bin/" ]; then
	mkdir /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_bin/
fi

OBJDUMP=/home/zhouhao/Android/android-ndk-r17b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-objdump

echo /media/zhouhao/D313-DBB3/android/system/bin/linker64
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/bin/linker64 > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_bin/system_bin_linker64.txt

# part-2 #

if [ ! -d "/home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_binHeader/" ]; then
	mkdir /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_binHeader/
fi

#OBJDUMP=/home/zhouhao/Android/android-ndk-r17b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-objdump

echo /media/zhouhao/D313-DBB3/android/system/bin/linker64
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/bin/linker64 > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_binHeader/system_bin_linker64.txt

