#!/bin/sh

if [ ! -d "/home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/" ]; then
	mkdir /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/
fi

OBJDUMP=/home/zhouhao/Android/android-ndk-r17b/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-objdump

echo /media/zhouhao/D313-DBB3/android/system/lib/android.frameworks.schedulerservice@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.frameworks.schedulerservice@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.frameworks.schedulerservice@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.frameworks.sensorservice@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.frameworks.sensorservice@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.frameworks.sensorservice@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.frameworks.vr.composer@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.frameworks.vr.composer@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.frameworks.vr.composer@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.audio.common@2.0-util.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.audio.common@2.0-util.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.audio.common@2.0-util.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.audio.common@2.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.audio.common@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.audio.common@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.audio.effect@2.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.audio.effect@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.audio.effect@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.audio@2.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.audio@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.audio@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.bluetooth@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.bluetooth@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.bluetooth@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.broadcastradio@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.broadcastradio@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.broadcastradio@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.broadcastradio@1.1.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.broadcastradio@1.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.broadcastradio@1.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.common@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.common@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.camera.common@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.device@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.device@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.camera.device@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.device@3.2.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.device@3.2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.camera.device@3.2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.device@3.3.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.device@3.3.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.camera.device@3.3.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.provider@2.4.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.camera.provider@2.4.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.camera.provider@2.4.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.cas.native@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.cas.native@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.cas.native@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.cas@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.cas@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.cas@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.configstore-utils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.configstore-utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.configstore-utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.configstore@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.configstore@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.configstore@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.contexthub@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.contexthub@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.contexthub@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.drm@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.drm@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.drm@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.gnss@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.gnss@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.gnss@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.allocator@2.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.allocator@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.graphics.allocator@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.bufferqueue@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.bufferqueue@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.graphics.bufferqueue@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.common@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.common@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.graphics.common@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.composer@2.1.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.composer@2.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.graphics.composer@2.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.mapper@2.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.graphics.mapper@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.graphics.mapper@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.ir@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.ir@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.ir@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.keymaster@3.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.keymaster@3.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.keymaster@3.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.light@2.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.light@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.light@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.media.omx@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.media.omx@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.media.omx@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.media@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.media@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.media@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.memtrack@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.memtrack@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.memtrack@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.neuralnetworks@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.neuralnetworks@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.neuralnetworks@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.power@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.power@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.power@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.power@1.1.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.power@1.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.power@1.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.radio.deprecated@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.radio.deprecated@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.radio.deprecated@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.radio@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.radio@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.radio@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.radio@1.1.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.radio@1.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.radio@1.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.renderscript@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.renderscript@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.renderscript@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.sensors@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.sensors@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.sensors@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.soundtrigger@2.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.soundtrigger@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.txtundtrigger@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.tetheroffload.config@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.tetheroffload.config@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.tetheroffload.config@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.thermal@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.thermal@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.thermal@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.tv.cec@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.tv.cec@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.tv.cec@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.tv.input@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.tv.input@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.tv.input@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.vibrator@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.vibrator@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.vibrator@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.vibrator@1.1.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.vibrator@1.1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.vibrator@1.1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.vr@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hardware.vr@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hardware.vr@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hidl.allocator@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hidl.allocator@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hidl.allocator@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hidl.memory@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hidl.memory@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hidl.memory@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hidl.token@1.0-utils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hidl.token@1.0-utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hidl.token@1.0-utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/android.hidl.token@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/android.hidl.token@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_android.hidl.token@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/drm/libfwdlockengine.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/drm/libfwdlockengine.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_drm_libfwdlockengine.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/hw/android.hidl.memory@1.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/hw/android.hidl.memory@1.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_hw_android.hidl.memory@1.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/hw/audio.primary.juno.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/hw/audio.primary.juno.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_hw_audio.primary.juno.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/hw/bluetooth.default.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/hw/bluetooth.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_hw_bluetooth.default.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/hw/input.evdev.default.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/hw/input.evdev.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_hw_input.evdev.default.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/hw/keystore.default.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/hw/keystore.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_hw_keystore.default.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/ld-android.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/ld-android.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_ld-android.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libEGL.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libEGL.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libEGL.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libETC1.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libETC1.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libETC1.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libFFTEm.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libFFTEm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libFFTEm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libGLESv1_CM.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libGLESv1_CM.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libGLESv1_CM.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libGLESv2.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libGLESv2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libGLESv2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libGLESv3.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libGLESv3.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libGLESv3.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libLLVM.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libLLVM.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libLLVM.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libOpenMAXAL.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libOpenMAXAL.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libOpenMAXAL.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libOpenSLES.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libOpenSLES.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libOpenSLES.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libRS.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libRS.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libRS.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libRSCacheDir.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libRSCacheDir.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libRSCacheDir.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libRSCpuRef.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libRSCpuRef.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libRSCpuRef.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libRSDriver.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libRSDriver.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libRSDriver.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libRS_internal.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libRS_internal.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libRS_internal.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libRScpp.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libRScpp.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libRScpp.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libWnnEngDic.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libWnnEngDic.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libWnnEngDic.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libWnnJpnDic.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libWnnJpnDic.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libWnnJpnDic.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaaudio.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaaudio.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaaudio.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaaudioservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaaudioservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaaudioservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libandroid.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libandroid.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libandroid.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libandroid_runtime.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libandroid_runtime.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libandroid_runtime.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libandroid_servers.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libandroid_servers.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libandroid_servers.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libandroidfw.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libandroidfw.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libandroidfw.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libappfuse.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libappfuse.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libappfuse.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libart-compiler.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libart-compiler.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libart-compiler.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libart-dexlayout.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libart-dexlayout.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libart-dexlayout.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libart.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libart.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libart.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libartd-compiler.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libartd-compiler.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libartd-compiler.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libartd-dexlayout.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libartd-dexlayout.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libartd-dexlayout.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libartd.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libartd.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libartd.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudioclient.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudioclient.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudioclient.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudioeffect_jni.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudioeffect_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudioeffect_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudioflinger.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudioflinger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudioflinger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudiohal.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudiohal.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudiohal.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudiomanager.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudiomanager.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudiomanager.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudiopolicyenginedefault.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudiopolicyenginedefault.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudiopolicyenginedefault.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudiopolicymanager.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudiopolicymanager.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudiopolicymanager.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudiopolicymanagerdefault.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudiopolicymanagerdefault.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudiopolicymanagerdefault.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudiopolicyservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudiopolicyservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudiopolicyservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudioprocessing.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudioprocessing.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudioprocessing.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudiospdif.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudiospdif.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudiospdif.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libaudioutils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libaudioutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libaudioutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libbacktrace.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libbacktrace.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libbacktrace.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libbase.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libbase.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libbase.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libbcc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libbcc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libbcc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libbcinfo.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libbcinfo.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libbcinfo.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libbinder.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libbinder.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libbinder.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libblas.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libblas.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libblas.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libc++.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libc++.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libc++.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libc_malloc_debug.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libc_malloc_debug.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libc_malloc_debug.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libcamera2ndk.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libcamera2ndk.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libcamera2ndk.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libcamera_client.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libcamera_client.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libcamera_client.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libcamera_metadata.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libcamera_metadata.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libcamera_metadata.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libcameraservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libcameraservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libcameraservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libcap.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libcap.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libcap.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libchrome.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libchrome.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libchrome.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libcompiler_rt.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libcompiler_rt.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libcompiler_rt.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libcrypto.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libcrypto.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libcrypto.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libcutils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libcutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libcutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libdebuggerd_client.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libdebuggerd_client.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libdebuggerd_client.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libdl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libdl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libdl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libdng_sdk.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libdng_sdk.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libdng_sdk.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libdrmframework.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libdrmframework.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libdrmframework.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libdrmframework_jni.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libdrmframework_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libdrmframework_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libeffectsconfig.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libeffectsconfig.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libeffectsconfig.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libevent.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libevent.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libevent.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libexif.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libexif.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libexif.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libexpat.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libexpat.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libexpat.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libfilterfw.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libfilterfw.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libfilterfw.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libfilterpack_imageproc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libfilterpack_imageproc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libfilterpack_imageproc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libfmq.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libfmq.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libfmq.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libft2.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libft2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libft2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libgatekeeper.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libgatekeeper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libgatekeeper.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libgraphicsenv.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libgraphicsenv.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libgraphicsenv.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libgui.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libgui.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libgui.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libhardware.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libhardware.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libhardware.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libhardware_legacy.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libhardware_legacy.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libhardware_legacy.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libharfbuzz_ng.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libharfbuzz_ng.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libharfbuzz_ng.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libheif.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libheif.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libheif.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libhidlbase.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libhidlbase.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libhidlbase.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libhidlmemory.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libhidlmemory.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libhidlmemory.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libhidltransport.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libhidltransport.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libhidltransport.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libhwbinder.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libhwbinder.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libhwbinder.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libhwui.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libhwui.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libhwui.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libicui18n.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libicui18n.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libicui18n.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libicuuc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libicuuc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libicuuc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libimg_utils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libimg_utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libimg_utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libinput.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libinput.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libinput.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libinput_evdev.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libinput_evdev.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libinput_evdev.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libinputflinger.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libinputflinger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libinputflinger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libinputservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libinputservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libinputservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libion.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libion.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libion.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libiprouteutil.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libiprouteutil.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libiprouteutil.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libjavacore.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libjavacore.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libjavacore.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libjavacrypto.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libjavacrypto.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libjavacrypto.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libjnigraphics.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libjnigraphics.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libjnigraphics.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libjpeg.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libjpeg.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libjpeg.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libkeymaster_messages.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libkeymaster_messages.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libkeymaster_messages.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libkeymaster_portable.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libkeymaster_portable.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libkeymaster_portable.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libkeymaster_staging.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libkeymaster_staging.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libkeymaster_staging.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libkeystore_binder.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libkeystore_binder.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libkeystore_binder.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libldacBT_abr.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libldacBT_abr.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libldacBT_abr.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libldacBT_enc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libldacBT_enc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libldacBT_enc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/liblog.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/liblog.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_liblog.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/liblz4.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/liblz4.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_liblz4.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/liblzma.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/liblzma.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_liblzma.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libm.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmdnssd.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmdnssd.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmdnssd.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmedia.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmedia.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmedia.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmedia_helper.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmedia_helper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmedia_helper.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmedia_jni.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmedia_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmedia_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmedia_omx.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmedia_omx.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmedia_omx.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmediadrm.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmediadrm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmediadrm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmedialogservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmedialogservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmedialogservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmediametrics.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmediametrics.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmediametrics.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmediandk.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmediandk.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmediandk.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmediaplayerservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmediaplayerservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmediaplayerservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmediautils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmediautils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmediautils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmemtrack.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmemtrack.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmemtrack.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmemunreachable.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmemunreachable.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmemunreachable.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmidi.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmidi.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmidi.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libminikin.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libminikin.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libminikin.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libmtp.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libmtp.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libmtp.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libnativebridge.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libnativebridge.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libnativebridge.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libnativehelper.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libnativehelper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libnativehelper.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libnativeloader.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libnativeloader.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libnativeloader.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libnativewindow.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libnativewindow.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libnativewindow.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libnbaio.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libnbaio.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libnbaio.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libnetd_client.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libnetd_client.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libnetd_client.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libnetlink.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libnetlink.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libnetlink.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libnetutils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libnetutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libnetutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libneuralnetworks.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libneuralnetworks.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libneuralnetworks.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libnl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libnl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libnl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libopenjdk.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libopenjdk.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libopenjdk.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkd.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkd.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libopenjdkd.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkjvm.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkjvm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libopenjdkjvm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkjvmd.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkjvmd.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libopenjdkjvmd.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkjvmti.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkjvmti.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libopenjdkjvmti.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkjvmtid.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libopenjdkjvmtid.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libopenjdkjvmtid.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libopus.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libopus.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libopus.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libpac.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libpac.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libpac.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libpackagelistparser.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libpackagelistparser.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libpackagelistparser.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libpcre2.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libpcre2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libpcre2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libpdfium.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libpdfium.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libpdfium.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libpiex.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libpiex.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libpiex.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libpixelflinger.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libpixelflinger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libpixelflinger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libpng.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libpng.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libpng.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libpower.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libpower.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libpower.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libpowermanager.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libpowermanager.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libpowermanager.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libprocessgroup.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libprocessgroup.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libprocessgroup.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libprocinfo.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libprocinfo.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libprocinfo.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libprotobuf-cpp-full.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libprotobuf-cpp-full.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libprotobuf-cpp-full.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libprotobuf-cpp-lite.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libprotobuf-cpp-lite.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libprotobuf-cpp-lite.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libradio_metadata.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libradio_metadata.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libradio_metadata.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libresourcemanagerservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libresourcemanagerservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libresourcemanagerservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/librs_jni.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/librs_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_librs_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/librtp_jni.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/librtp_jni.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_librtp_jni.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libschedulerservicehidl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libschedulerservicehidl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libschedulerservicehidl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libselinux.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libselinux.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libselinux.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsensor.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsensor.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsensor.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsensorservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsensorservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsensorservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsensorservicehidl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsensorservicehidl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsensorservicehidl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libserviceutility.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libserviceutility.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libserviceutility.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsigchain.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsigchain.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsigchain.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libskia.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libskia.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libskia.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsoftkeymaster.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsoftkeymaster.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsoftkeymaster.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsoftkeymasterdevice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsoftkeymasterdevice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsoftkeymasterdevice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsonic.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsonic.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsonic.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsonivox.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsonivox.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsonivox.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsoundpool.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsoundpool.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsoundpool.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsoundtrigger.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsoundtrigger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsoundtrigger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsoundtriggerservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsoundtriggerservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsoundtriggerservice.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libspeexresampler.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libspeexresampler.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libspeexresampler.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsqlite.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsqlite.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsqlite.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libssl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libssl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libssl.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_amrnb_common.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_amrnb_common.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_amrnb_common.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_enc_common.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_enc_common.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_enc_common.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_flacdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_flacdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_flacdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_foundation.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_foundation.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_foundation.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_http_support.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_http_support.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_http_support.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_httplive.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_httplive.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_httplive.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_omx.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_omx.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_omx.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_omx_utils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_omx_utils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_omx_utils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_aacdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_aacdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_aacdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_aacenc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_aacenc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_aacenc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_amrdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_amrdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_amrdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_amrnbenc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_amrnbenc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_amrnbenc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_amrwbenc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_amrwbenc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_amrwbenc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_avcdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_avcdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_avcdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_avcenc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_avcenc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_avcenc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_flacdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_flacdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_flacdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_flacenc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_flacenc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_flacenc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_g711dec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_g711dec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_g711dec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_gsmdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_gsmdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_gsmdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_hevcdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_hevcdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_hevcdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_mp3dec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_mp3dec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_mp3dec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_mpeg2dec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_mpeg2dec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_mpeg2dec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_mpeg4dec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_mpeg4dec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_mpeg4dec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_mpeg4enc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_mpeg4enc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_mpeg4enc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_opusdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_opusdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_opusdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_rawdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_rawdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_rawdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_vorbisdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_vorbisdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_vorbisdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_vpxdec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_vpxdec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_vpxdec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_vpxenc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_soft_vpxenc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_soft_vpxenc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_wfd.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_wfd.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_wfd.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_xmlparser.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstagefright_xmlparser.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstagefright_xmlparser.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libstdc++.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libstdc++.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libstdc++.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsurfaceflinger.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsurfaceflinger.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsurfaceflinger.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsurfaceflinger_ddmconnection.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsurfaceflinger_ddmconnection.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsurfaceflinger_ddmconnection.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsuspend.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsuspend.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsuspend.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsync.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsync.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsync.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libsysutils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libsysutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libsysutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libteec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libteec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libteec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libtextclassifier.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libtextclassifier.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libtextclassifier.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libtextclassifier_hash.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libtextclassifier_hash.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libtextclassifier_hash.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libtinyalsa.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libtinyalsa.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libtinyalsa.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libtinyxml2.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libtinyxml2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libtinyxml2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libtombstoned_client.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libtombstoned_client.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libtombstoned_client.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libttscompat.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libttscompat.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libttscompat.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libttspico.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libttspico.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libttspico.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libui.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libui.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libui.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libunwind.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libunwind.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libunwind.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libunwindstack.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libunwindstack.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libunwindstack.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libusbhost.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libusbhost.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libusbhost.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libutils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libvintf.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libvintf.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libvintf.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libvixl-arm.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libvixl-arm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libvixl-arm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libvixl-arm64.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libvixl-arm64.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libvixl-arm64.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libvixld-arm.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libvixld-arm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libvixld-arm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libvixld-arm64.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libvixld-arm64.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libvixld-arm64.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libvndksupport.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libvndksupport.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libvndksupport.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libvorbisidec.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libvorbisidec.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libvorbisidec.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libvulkan.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libvulkan.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libvulkan.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libwebviewchromium_loader.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libwebviewchromium_loader.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libwebviewchromium_loader.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libwebviewchromium_plat_support.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libwebviewchromium_plat_support.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libwebviewchromium_plat_support.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libwifi-service.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libwifi-service.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libwifi-service.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libwilhelm.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libwilhelm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libwilhelm.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libwnndict.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libwnndict.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libwnndict.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libz.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libz.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libz.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/libziparchive.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/libziparchive.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_libziparchive.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/android.hardware.graphics.allocator@2.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/android.hardware.graphics.allocator@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_android.hardware.graphics.allocator@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/android.hardware.graphics.common@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/android.hardware.graphics.common@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_android.hardware.graphics.common@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/android.hardware.graphics.mapper@2.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/android.hardware.graphics.mapper@2.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_android.hardware.graphics.mapper@2.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/android.hardware.renderscript@1.0.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/android.hardware.renderscript@1.0.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_android.hardware.renderscript@1.0.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libLLVM.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libLLVM.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libLLVM.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libRSCpuRef.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libRSCpuRef.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libRSCpuRef.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libRSDriver.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libRSDriver.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libRSDriver.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libRS_internal.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libRS_internal.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libRS_internal.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libbacktrace.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libbacktrace.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libbacktrace.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libbase.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libbase.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libbase.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libbcc.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libbcc.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libbcc.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libbcinfo.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libbcinfo.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libbcinfo.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libblas.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libblas.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libblas.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libc++.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libc++.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libc++.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libcompiler_rt.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libcompiler_rt.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libcompiler_rt.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libcutils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libcutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libcutils.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libft2.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libft2.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libft2.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libhardware.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libhardware.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libhardware.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libhidlbase.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libhidlbase.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libhidlbase.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libhidltransport.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libhidltransport.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libhidltransport.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libhwbinder.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libhwbinder.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libhwbinder.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libion.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libion.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libion.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/liblzma.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/liblzma.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_liblzma.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libpng.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libpng.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libpng.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libunwind.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libunwind.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libunwind.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libunwindstack.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libunwindstack.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libunwindstack.txt
echo /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libutils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/system/lib/vndk-sp/libutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/system_lib_vndk-sp_libutils.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/egl/libGLES_mali.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/egl/libGLES_mali.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_egl_libGLES_mali.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.audio.effect@2.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.audio.effect@2.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.audio.effect@2.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.audio@2.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.audio@2.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.audio@2.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.broadcastradio@1.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.broadcastradio@1.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.broadcastradio@1.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.drm@1.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.drm@1.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.drm@1.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.gnss@1.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.gnss@1.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.gnss@1.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.graphics.allocator@2.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.graphics.allocator@2.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.graphics.allocator@2.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.graphics.mapper@2.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.graphics.mapper@2.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.graphics.mapper@2.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.keymaster@3.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.keymaster@3.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.keymaster@3.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.memtrack@1.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.memtrack@1.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.memtrack@1.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.soundtrigger@2.0-impl.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/android.hardware.soundtrigger@2.0-impl.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_android.hardware.txtundtrigger@2.0-impl.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/audio.primary.default.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/audio.primary.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_audio.primary.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/gralloc.default.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/gralloc.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_gralloc.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/gralloc.juno.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/gralloc.juno.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_gralloc.juno.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/local_time.default.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/local_time.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_local_time.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/memtrack.default.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/memtrack.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_memtrack.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/power.default.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/power.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_power.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/hw/vibrator.default.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/hw/vibrator.default.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_hw_vibrator.default.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libOpenCL.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libOpenCL.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libOpenCL.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libRSDriverArm.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libRSDriverArm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libRSDriverArm.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libavservices_minijail_vendor.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libavservices_minijail_vendor.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libavservices_minijail_vendor.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libbccArm.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libbccArm.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libbccArm.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libeffects.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libeffects.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libeffects.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libmediacodecservice.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libmediacodecservice.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libmediacodecservice.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libminijail_vendor.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libminijail_vendor.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libminijail_vendor.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libreference-ril.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libreference-ril.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libreference-ril.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libril.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libril.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libril.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/librilutils.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/librilutils.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_librilutils.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/libwebrtc_audio_preprocessing.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/libwebrtc_audio_preprocessing.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_libwebrtc_audio_preprocessing.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/mediacas/libclearkeycasplugin.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/mediacas/libclearkeycasplugin.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_mediacas_libclearkeycasplugin.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/mediadrm/libdrmclearkeyplugin.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/mediadrm/libdrmclearkeyplugin.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_mediadrm_libdrmclearkeyplugin.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libaudiopreprocessing.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libaudiopreprocessing.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_soundfx_libaudiopreprocessing.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libbundlewrapper.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libbundlewrapper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_soundfx_libbundlewrapper.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libdownmix.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libdownmix.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_soundfx_libdownmix.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libeffectproxy.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libeffectproxy.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_soundfx_libeffectproxy.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libldnhncr.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libldnhncr.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_soundfx_libldnhncr.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libreverbwrapper.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libreverbwrapper.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_soundfx_libreverbwrapper.txt
echo /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libvisualizer.so
$OBJDUMP -h /media/zhouhao/D313-DBB3/android/vendor/lib/soundfx/libvisualizer.so > /home/zhouhao/juno_backup/DS5_workspace/DTSLDecode/Arm/system_libHeader/vendor_lib_soundfx_libvisualizer.txt
