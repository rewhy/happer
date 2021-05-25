#!/system/bin/sh

if [ ! -d "/sdcard/sdcard/oatdump/" ]; then
	mkdir /sdcard/sdcard/oatdump/
fi
if [ ! -d "/sdcard/sdcard/oatdump/arm/" ]; then
	mkdir /sdcard/sdcard/oatdump/arm/
fi

OATDUMP=oatdump

echo /sdcard/sdcard/android/system/framework/arm/boot-android.hidl.base-V1.0-java.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-android.hidl.base-V1.0-java.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-android.hidl.base-V1.0-java.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-android.hidl.manager-V1.0-java.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-android.hidl.manager-V1.0-java.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-android.hidl.manager-V1.0-java.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-apache-xml.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-apache-xml.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-apache-xml.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-bouncycastle.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-bouncycastle.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-bouncycastle.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-conscrypt.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-conscrypt.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-conscrypt.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-core-libart.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-core-libart.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-core-libart.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-ext.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-ext.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-ext.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-framework.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-framework.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-framework.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-ims-common.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-ims-common.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-ims-common.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-legacy-test.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-legacy-test.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-legacy-test.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-okhttp.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-okhttp.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-okhttp.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-org.apache.http.legacy.boot.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-org.apache.http.legacy.boot.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-org.apache.http.legacy.boot.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-telephony-common.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-telephony-common.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-telephony-common.txt
echo /sdcard/sdcard/android/system/framework/arm/boot-voip-common.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot-voip-common.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot-voip-common.txt
echo /sdcard/sdcard/android/system/framework/arm/boot.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm/boot.oat --output=/sdcard/sdcard/oatdump/arm/system_framework_arm_boot.txt
