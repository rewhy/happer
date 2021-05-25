#!/bin/sh

# part-1 #

if [ ! -d "/home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_bin/" ]; then
	mkdir /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_bin/
fi

OBJDUMP=/home/zhouhao/Android/android-ndk-r17b/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-objdump

echo /media/zhouhao/D313-DBB3/android/system/bin/linker
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/bin/linker > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_bin/system_bin_linker.txt

# part-2 #

if [ ! -d "/home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_binHeader/" ]; then
	mkdir /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_binHeader/
fi

#OBJDUMP=/home/zhouhao/Android/android-ndk-r17b/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-objdump

echo /media/zhouhao/D313-DBB3/android/system/bin/linker
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/bin/linker > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_binHeader/system_bin_linker.txt

