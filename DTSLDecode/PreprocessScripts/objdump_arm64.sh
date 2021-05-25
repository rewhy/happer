#!/bin/sh

if [ ! -d "/home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/" ]; then
	mkdir /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/
fi

OBJDUMP=/home/zhouhao/Android/android-ndk-r17b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-objdump

echo /media/zhouhao/D313-DBB3/android/system/lib64/android.frameworks.displayservice@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.frameworks.displayservice@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.frameworks.displayservice@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.frameworks.schedulerservice@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.frameworks.schedulerservice@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.frameworks.schedulerservice@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.frameworks.sensorservice@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.frameworks.sensorservice@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.frameworks.sensorservice@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.frameworks.vr.composer@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.frameworks.vr.composer@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.frameworks.vr.composer@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.audio.common@2.0-util.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.audio.common@2.0-util.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.audio.common@2.0-util.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.audio.common@2.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.audio.common@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.audio.common@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.audio.effect@2.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.audio.effect@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.audio.effect@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.audio@2.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.audio@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.audio@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.bluetooth@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.bluetooth@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.bluetooth@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.broadcastradio@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.broadcastradio@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.broadcastradio@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.broadcastradio@1.1.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.broadcastradio@1.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.broadcastradio@1.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.common@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.common@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.camera.common@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.device@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.device@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.camera.device@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.device@3.2.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.device@3.2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.camera.device@3.2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.device@3.3.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.device@3.3.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.camera.device@3.3.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.provider@2.4.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.camera.provider@2.4.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.camera.provider@2.4.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.cas.native@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.cas.native@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.cas.native@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.cas@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.cas@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.cas@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.configstore-utils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.configstore-utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.configstore-utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.configstore@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.configstore@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.configstore@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.contexthub@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.contexthub@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.contexthub@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.drm@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.drm@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.drm@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.dumpstate@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.dumpstate@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.dumpstate@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.gatekeeper@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.gatekeeper@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.gatekeeper@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.gnss@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.gnss@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.gnss@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.allocator@2.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.allocator@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.graphics.allocator@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.bufferqueue@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.bufferqueue@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.graphics.bufferqueue@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.common@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.common@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.graphics.common@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.composer@2.1.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.composer@2.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.graphics.composer@2.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.mapper@2.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.graphics.mapper@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.graphics.mapper@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.health@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.health@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.health@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.ir@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.ir@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.ir@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.keymaster@3.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.keymaster@3.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.keymaster@3.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.light@2.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.light@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.light@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.media.omx@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.media.omx@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.media.omx@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.media@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.media@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.media@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.memtrack@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.memtrack@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.memtrack@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.neuralnetworks@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.neuralnetworks@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.neuralnetworks@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.nfc@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.nfc@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.nfc@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.power@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.power@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.power@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.power@1.1.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.power@1.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.power@1.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.radio.deprecated@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.radio.deprecated@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.radio.deprecated@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.radio@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.radio@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.radio@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.radio@1.1.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.radio@1.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.radio@1.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.renderscript@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.renderscript@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.renderscript@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.sensors@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.sensors@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.sensors@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.soundtrigger@2.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.soundtrigger@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.txtundtrigger@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.tetheroffload.config@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.tetheroffload.config@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.tetheroffload.config@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.thermal@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.thermal@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.thermal@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.thermal@1.1.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.thermal@1.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.thermal@1.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.tv.cec@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.tv.cec@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.tv.cec@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.tv.input@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.tv.input@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.tv.input@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.vibrator@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.vibrator@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.vibrator@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.vibrator@1.1.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.vibrator@1.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.vibrator@1.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.vr@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.vr@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.vr@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.wifi.offload@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hardware.wifi.offload@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hardware.wifi.offload@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hidl.allocator@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hidl.allocator@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hidl.allocator@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hidl.memory@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hidl.memory@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hidl.memory@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hidl.token@1.0-utils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hidl.token@1.0-utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hidl.token@1.0-utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.hidl.token@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.hidl.token@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.hidl.token@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.system.net.netd@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.system.net.netd@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.system.net.netd@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/android.system.wifi.keystore@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/android.system.wifi.keystore@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_android.system.wifi.keystore@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/drm/libfwdlockengine.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/drm/libfwdlockengine.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_drm_libfwdlockengine.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/hw/android.hidl.memory@1.0-impl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/hw/android.hidl.memory@1.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_hw_android.hidl.memory@1.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/hw/audio.primary.juno.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/hw/audio.primary.juno.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_hw_audio.primary.juno.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/hw/bluetooth.default.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/hw/bluetooth.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_hw_bluetooth.default.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/hw/input.evdev.default.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/hw/input.evdev.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_hw_input.evdev.default.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/hw/keystore.default.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/hw/keystore.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_hw_keystore.default.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/ld-android.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/ld-android.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_ld-android.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libEGL.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libEGL.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libEGL.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libETC1.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libETC1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libETC1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libFFTEm.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libFFTEm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libFFTEm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libGLESv1_CM.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libGLESv1_CM.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libGLESv1_CM.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libGLESv2.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libGLESv2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libGLESv2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libGLESv3.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libGLESv3.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libGLESv3.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libLLVM.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libLLVM.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libLLVM.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libOpenMAXAL.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libOpenMAXAL.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libOpenMAXAL.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libOpenSLES.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libOpenSLES.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libOpenSLES.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libRS.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libRS.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libRS.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libRSCacheDir.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libRSCacheDir.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libRSCacheDir.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libRSCpuRef.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libRSCpuRef.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libRSCpuRef.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libRSDriver.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libRSDriver.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libRSDriver.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libRS_internal.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libRS_internal.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libRS_internal.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libRScpp.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libRScpp.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libRScpp.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libWnnEngDic.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libWnnEngDic.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libWnnEngDic.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libWnnJpnDic.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libWnnJpnDic.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libWnnJpnDic.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaaudio.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaaudio.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaaudio.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libandroid.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libandroid.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libandroid.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libandroid_runtime.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libandroid_runtime.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libandroid_runtime.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libandroid_servers.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libandroid_servers.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libandroid_servers.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libandroidfw.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libandroidfw.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libandroidfw.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libappfuse.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libappfuse.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libappfuse.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libart-compiler.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libart-compiler.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libart-compiler.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libart-dexlayout.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libart-dexlayout.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libart-dexlayout.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libart-disassembler.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libart-disassembler.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libart-disassembler.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libart.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libart.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libart.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libartd-compiler.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libartd-compiler.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libartd-compiler.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libartd-dexlayout.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libartd-dexlayout.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libartd-dexlayout.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libartd.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libartd.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libartd.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudioclient.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudioclient.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudioclient.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudioeffect_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudioeffect_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudioeffect_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudioflinger.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudioflinger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudioflinger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudiohal.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudiohal.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudiohal.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudiomanager.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudiomanager.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudiomanager.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudiopolicyenginedefault.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudiopolicyenginedefault.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudiopolicyenginedefault.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudiopolicymanager.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudiopolicymanager.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudiopolicymanager.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudiopolicymanagerdefault.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudiopolicymanagerdefault.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudiopolicymanagerdefault.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudiopolicyservice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudiopolicyservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudiopolicyservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudioprocessing.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudioprocessing.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudioprocessing.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudiospdif.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudiospdif.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudiospdif.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libaudioutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libaudioutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libaudioutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libavservices_minijail.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libavservices_minijail.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libavservices_minijail.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libbacktrace.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libbacktrace.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libbacktrace.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libbase.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libbase.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libbase.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libbatteryservice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libbatteryservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libbatteryservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libbcc.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libbcc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libbcc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libbcinfo.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libbcinfo.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libbcinfo.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libbinder.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libbinder.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libbinder.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libblas.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libblas.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libblas.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libbluetooth_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libbluetooth_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libbluetooth_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libbootanimation.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libbootanimation.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libbootanimation.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libc++.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libc++.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libc++.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libc.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libc_malloc_debug.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libc_malloc_debug.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libc_malloc_debug.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcamera2ndk.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcamera2ndk.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcamera2ndk.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcamera_client.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcamera_client.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcamera_client.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcamera_metadata.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcamera_metadata.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcamera_metadata.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcameraservice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcameraservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcameraservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcap.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcap.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcap.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libchrome.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libchrome.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libchrome.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libclang_rt.ubsan_standalone-aarch64-android.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libclang_rt.ubsan_standalone-aarch64-android.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libclang_rt.ubsan_standalone-aarch64-android.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcompiler_rt.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcompiler_rt.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcompiler_rt.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcrypto.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcrypto.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcrypto.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcrypto_utils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcrypto_utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcrypto_utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcups.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcups.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcups.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libcutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libcutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libcutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdebuggerd_client.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdebuggerd_client.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdebuggerd_client.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdefcontainer_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdefcontainer_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdefcontainer_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdiskconfig.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdiskconfig.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdiskconfig.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdisplayservicehidl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdisplayservicehidl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdisplayservicehidl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdng_sdk.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdng_sdk.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdng_sdk.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdrmframework.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdrmframework.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdrmframework.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdrmframework_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdrmframework_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdrmframework_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdumpstateaidl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdumpstateaidl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdumpstateaidl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libdumpstateutil.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libdumpstateutil.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libdumpstateutil.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libeffectsconfig.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libeffectsconfig.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libeffectsconfig.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libevent.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libevent.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libevent.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libexif.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libexif.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libexif.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libexpat.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libexpat.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libexpat.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libext2_blkid.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libext2_blkid.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libext2_blkid.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libext2_com_err.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libext2_com_err.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libext2_com_err.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libext2_e2p.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libext2_e2p.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libext2_e2p.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libext2_misc.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libext2_misc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libext2_misc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libext2_quota.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libext2_quota.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libext2_quota.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libext2_uuid.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libext2_uuid.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libext2_uuid.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libext2fs.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libext2fs.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libext2fs.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libext4_utils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libext4_utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libext4_utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libf2fs_sparseblock.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libf2fs_sparseblock.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libf2fs_sparseblock.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libfilterfw.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libfilterfw.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libfilterfw.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libfilterpack_imageproc.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libfilterpack_imageproc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libfilterpack_imageproc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libfmq.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libfmq.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libfmq.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libft2.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libft2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libft2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libgatekeeper.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libgatekeeper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libgatekeeper.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libgraphicsenv.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libgraphicsenv.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libgraphicsenv.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libgui.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libgui.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libgui.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libhardware.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libhardware.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libhardware.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libhardware_legacy.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libhardware_legacy.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libhardware_legacy.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libharfbuzz_ng.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libharfbuzz_ng.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libharfbuzz_ng.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libheif.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libheif.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libheif.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libhidcommand_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libhidcommand_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libhidcommand_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libhidl-gen-utils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libhidl-gen-utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libhidl-gen-utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libhidlbase.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libhidlbase.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libhidlbase.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libhidlmemory.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libhidlmemory.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libhidlmemory.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libhidltransport.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libhidltransport.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libhidltransport.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libhwbinder.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libhwbinder.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libhwbinder.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libhwui.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libhwui.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libhwui.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libicui18n.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libicui18n.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libicui18n.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libicuuc.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libicuuc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libicuuc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libimg_utils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libimg_utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libimg_utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libincident.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libincident.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libincident.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libinput.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libinput.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libinput.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libinput_evdev.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libinput_evdev.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libinput_evdev.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libinputflinger.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libinputflinger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libinputflinger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libinputservice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libinputservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libinputservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libion.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libion.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libion.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libiprouteutil.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libiprouteutil.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libiprouteutil.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjavacore.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjavacore.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjavacore.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjavacrypto.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjavacrypto.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjavacrypto.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjni_eglfence.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjni_eglfence.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjni_eglfence.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjni_filtershow_filters.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjni_filtershow_filters.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjni_filtershow_filters.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjni_jpegstream.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjni_jpegstream.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjni_jpegstream.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjni_jpegutil.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjni_jpegutil.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjni_jpegutil.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjni_latinime.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjni_latinime.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjni_latinime.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjni_pacprocessor.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjni_pacprocessor.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjni_pacprocessor.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjni_tinyplanet.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjni_tinyplanet.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjni_tinyplanet.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjnigraphics.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjnigraphics.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjnigraphics.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libjpeg.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libjpeg.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libjpeg.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libkeymaster_messages.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libkeymaster_messages.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libkeymaster_messages.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libkeymaster_portable.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libkeymaster_portable.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libkeymaster_portable.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libkeymaster_staging.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libkeymaster_staging.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libkeymaster_staging.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libkeystore-engine.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libkeystore-engine.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libkeystore-engine.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libkeystore_binder.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libkeystore_binder.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libkeystore_binder.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libkeyutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libkeyutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libkeyutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libldacBT_abr.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libldacBT_abr.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libldacBT_abr.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libldacBT_enc.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libldacBT_enc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libldacBT_enc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/liblog.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/liblog.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_liblog.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/liblogcat.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/liblogcat.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_liblogcat.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/liblogwrap.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/liblogwrap.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_liblogwrap.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/liblshal.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/liblshal.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_liblshal.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/liblz4.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/liblz4.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_liblz4.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/liblzma.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/liblzma.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_liblzma.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libm.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmdnssd.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmdnssd.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmdnssd.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmedia.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmedia.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmedia.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmedia_helper.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmedia_helper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmedia_helper.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmedia_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmedia_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmedia_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmedia_omx.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmedia_omx.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmedia_omx.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmediadrm.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmediadrm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmediadrm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmediaextractorservice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmediaextractorservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmediaextractorservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmedialogservice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmedialogservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmedialogservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmediametrics.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmediametrics.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmediametrics.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmediandk.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmediandk.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmediandk.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmediautils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmediautils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmediautils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmemtrack.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmemtrack.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmemtrack.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmemunreachable.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmemunreachable.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmemunreachable.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmetricslogger.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmetricslogger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmetricslogger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmidi.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmidi.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmidi.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libminijail.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libminijail.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libminijail.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libminikin.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libminikin.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libminikin.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libmtp.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libmtp.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libmtp.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnativebridge.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnativebridge.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnativebridge.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnativehelper.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnativehelper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnativehelper.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnativeloader.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnativeloader.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnativeloader.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnativewindow.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnativewindow.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnativewindow.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnbaio.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnbaio.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnbaio.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libncurses.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libncurses.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libncurses.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnetd_client.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnetd_client.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnetd_client.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnetdaidl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnetdaidl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnetdaidl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnetdutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnetdutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnetdutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnetlink.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnetlink.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnetlink.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnetutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnetutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnetutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libneuralnetworks.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libneuralnetworks.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libneuralnetworks.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnfc-nci.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnfc-nci.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnfc-nci.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnfc_nci_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnfc_nci_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnfc_nci_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libnl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libnl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libnl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdk.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdk.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libopenjdk.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkd.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkd.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libopenjdkd.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkjvm.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkjvm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libopenjdkjvm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkjvmd.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkjvmd.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libopenjdkjvmd.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkjvmti.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkjvmti.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libopenjdkjvmti.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkjvmtid.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libopenjdkjvmtid.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libopenjdkjvmtid.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpac.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpac.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpac.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpackagelistparser.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpackagelistparser.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpackagelistparser.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpagemap.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpagemap.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpagemap.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpcap.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpcap.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpcap.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpcre2.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpcre2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpcre2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpcrecpp.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpcrecpp.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpcrecpp.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpdfium.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpdfium.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpdfium.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpiex.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpiex.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpiex.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpixelflinger.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpixelflinger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpixelflinger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpng.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpng.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpng.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpower.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpower.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpower.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libpowermanager.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libpowermanager.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libpowermanager.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libprintspooler_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libprintspooler_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libprintspooler_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libprocessgroup.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libprocessgroup.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libprocessgroup.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libprocinfo.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libprocinfo.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libprocinfo.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libprotobuf-cpp-full.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libprotobuf-cpp-full.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libprotobuf-cpp-full.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libprotobuf-cpp-lite.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libprotobuf-cpp-lite.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libprotobuf-cpp-lite.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libradio_metadata.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libradio_metadata.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libradio_metadata.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/librs_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/librs_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_librs_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/librtp_jni.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/librtp_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_librtp_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libschedulerservicehidl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libschedulerservicehidl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libschedulerservicehidl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libselinux.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libselinux.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libselinux.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsensor.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsensor.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsensor.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsensorservice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsensorservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsensorservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsensorservicehidl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsensorservicehidl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsensorservicehidl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsepol.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsepol.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsepol.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libservices.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libservices.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libservices.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libserviceutility.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libserviceutility.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libserviceutility.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsigchain.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsigchain.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsigchain.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libskia.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libskia.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libskia.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsoftkeymaster.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsoftkeymaster.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsoftkeymaster.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsoftkeymasterdevice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsoftkeymasterdevice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsoftkeymasterdevice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsonic.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsonic.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsonic.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsonivox.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsonivox.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsonivox.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsoundpool.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsoundpool.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsoundpool.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsoundtrigger.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsoundtrigger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsoundtrigger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsoundtriggerservice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsoundtriggerservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsoundtriggerservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsparse.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsparse.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsparse.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libspeexresampler.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libspeexresampler.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libspeexresampler.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsqlite.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsqlite.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsqlite.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libssh.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libssh.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libssh.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libssl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libssl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libssl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_amrnb_common.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_amrnb_common.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright_amrnb_common.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_enc_common.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_enc_common.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright_enc_common.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_flacdec.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_flacdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright_flacdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_foundation.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_foundation.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright_foundation.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_http_support.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_http_support.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright_http_support.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_omx.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_omx.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright_omx.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_omx_utils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_omx_utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright_omx_utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_soft_h264dec.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_soft_h264dec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright_soft_h264dec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_xmlparser.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstagefright_xmlparser.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstagefright_xmlparser.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libstdc++.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libstdc++.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libstdc++.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsurfaceflinger.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsurfaceflinger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsurfaceflinger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsurfaceflinger_ddmconnection.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsurfaceflinger_ddmconnection.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsurfaceflinger_ddmconnection.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsuspend.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsuspend.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsuspend.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsync.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsync.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsync.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libsysutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libsysutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libsysutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libteec.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libteec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libteec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libtextclassifier.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libtextclassifier.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libtextclassifier.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libtextclassifier_hash.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libtextclassifier_hash.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libtextclassifier_hash.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libthermalcallback.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libthermalcallback.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libthermalcallback.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libthermalservice.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libthermalservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libthermalservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libtinyalsa.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libtinyalsa.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libtinyalsa.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libtinyxml2.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libtinyxml2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libtinyxml2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libtombstoned_client.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libtombstoned_client.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libtombstoned_client.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libui.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libui.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libui.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libunwind.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libunwind.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libunwind.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libunwindstack.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libunwindstack.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libunwindstack.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libusbhost.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libusbhost.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libusbhost.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libvintf.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libvintf.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libvintf.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libvixl-arm.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libvixl-arm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libvixl-arm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libvixl-arm64.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libvixl-arm64.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libvixl-arm64.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libvixld-arm.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libvixld-arm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libvixld-arm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libvixld-arm64.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libvixld-arm64.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libvixld-arm64.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libvndksupport.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libvndksupport.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libvndksupport.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libvorbisidec.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libvorbisidec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libvorbisidec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libvulkan.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libvulkan.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libvulkan.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libwebviewchromium_loader.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libwebviewchromium_loader.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libwebviewchromium_loader.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libwebviewchromium_plat_support.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libwebviewchromium_plat_support.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libwebviewchromium_plat_support.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libwfds.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libwfds.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libwfds.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libwifi-service.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libwifi-service.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libwifi-service.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libwifi-system-iface.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libwifi-system-iface.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libwifi-system-iface.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libwifi-system.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libwifi-system.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libwifi-system.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libwifikeystorehal.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libwifikeystorehal.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libwifikeystorehal.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libwilhelm.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libwilhelm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libwilhelm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libwnndict.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libwnndict.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libwnndict.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libz.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libz.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libz.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/libziparchive.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/libziparchive.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_libziparchive.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/android.hardware.graphics.allocator@2.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/android.hardware.graphics.allocator@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_android.hardware.graphics.allocator@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/android.hardware.graphics.common@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/android.hardware.graphics.common@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_android.hardware.graphics.common@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/android.hardware.graphics.mapper@2.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/android.hardware.graphics.mapper@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_android.hardware.graphics.mapper@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/android.hardware.renderscript@1.0.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/android.hardware.renderscript@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_android.hardware.renderscript@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libLLVM.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libLLVM.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libLLVM.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libRSCpuRef.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libRSCpuRef.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libRSCpuRef.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libRSDriver.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libRSDriver.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libRSDriver.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libRS_internal.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libRS_internal.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libRS_internal.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libbacktrace.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libbacktrace.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libbacktrace.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libbase.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libbase.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libbase.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libbcc.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libbcc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libbcc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libbcinfo.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libbcinfo.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libbcinfo.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libblas.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libblas.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libblas.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libc++.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libc++.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libc++.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libcompiler_rt.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libcompiler_rt.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libcompiler_rt.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libcutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libcutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libcutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libft2.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libft2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libft2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libhardware.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libhardware.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libhardware.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libhidlbase.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libhidlbase.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libhidlbase.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libhidltransport.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libhidltransport.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libhidltransport.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libhwbinder.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libhwbinder.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libhwbinder.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libion.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libion.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libion.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/liblzma.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/liblzma.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_liblzma.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libpng.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libpng.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libpng.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libunwind.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libunwind.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libunwind.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libunwindstack.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libunwindstack.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libunwindstack.txt
echo /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/system/lib64/vndk-sp/libutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/system_lib64_vndk-sp_libutils.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/egl/libGLES_mali.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/egl/libGLES_mali.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_egl_libGLES_mali.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.audio.effect@2.0-impl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.audio.effect@2.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_android.hardware.audio.effect@2.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.audio@2.0-impl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.audio@2.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_android.hardware.audio@2.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.broadcastradio@1.0-impl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.broadcastradio@1.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_android.hardware.broadcastradio@1.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.gnss@1.0-impl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.gnss@1.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_android.hardware.gnss@1.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.graphics.allocator@2.0-impl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.graphics.allocator@2.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_android.hardware.graphics.allocator@2.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.graphics.mapper@2.0-impl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.graphics.mapper@2.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_android.hardware.graphics.mapper@2.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.keymaster@3.0-impl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.keymaster@3.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_android.hardware.keymaster@3.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.memtrack@1.0-impl.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/android.hardware.memtrack@1.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_android.hardware.memtrack@1.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/audio.primary.default.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/audio.primary.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_audio.primary.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/gralloc.default.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/gralloc.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_gralloc.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/gralloc.juno.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/gralloc.juno.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_gralloc.juno.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/local_time.default.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/local_time.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_local_time.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/memtrack.default.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/memtrack.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_memtrack.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/power.default.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/power.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_power.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/vibrator.default.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/hw/vibrator.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_hw_vibrator.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libOpenCL.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libOpenCL.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libOpenCL.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libRSDriverArm.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libRSDriverArm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libRSDriverArm.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libbccArm.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libbccArm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libbccArm.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libeffects.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libeffects.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libeffects.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libhwminijail.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libhwminijail.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libhwminijail.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libminijail_vendor.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libminijail_vendor.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libminijail_vendor.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libreference-ril.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libreference-ril.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libreference-ril.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libril.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libril.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libril.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/librilutils.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/librilutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_librilutils.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libselinux_vendor.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libselinux_vendor.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libselinux_vendor.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/libwebrtc_audio_preprocessing.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/libwebrtc_audio_preprocessing.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_libwebrtc_audio_preprocessing.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/mediacas/libclearkeycasplugin.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/mediacas/libclearkeycasplugin.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_mediacas_libclearkeycasplugin.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/mediadrm/libdrmclearkeyplugin.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/mediadrm/libdrmclearkeyplugin.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_mediadrm_libdrmclearkeyplugin.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libaudiopreprocessing.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libaudiopreprocessing.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_soundfx_libaudiopreprocessing.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libbundlewrapper.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libbundlewrapper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_soundfx_libbundlewrapper.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libdownmix.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libdownmix.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_soundfx_libdownmix.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libeffectproxy.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libeffectproxy.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_soundfx_libeffectproxy.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libldnhncr.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libldnhncr.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_soundfx_libldnhncr.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libreverbwrapper.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libreverbwrapper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_soundfx_libreverbwrapper.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libvisualizer.so
$OBJDUMP -d /media/zhouhao/D313-DBB3/android/vendor/lib64/soundfx/libvisualizer.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/AArch64/system_lib/vendor_lib64_soundfx_libvisualizer.txt
