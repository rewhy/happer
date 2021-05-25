#!/system/bin/sh

if [ ! -d "/sdcard/sdcard/oatdump/" ]; then
	mkdir /sdcard/sdcard/oatdump/
fi
if [ ! -d "/sdcard/sdcard/oatdump/arm64/" ]; then
	mkdir /sdcard/sdcard/oatdump/arm64/
fi

OATDUMP=oatdump

echo /sdcard/sdcard/android/system/framework/arm64/boot-android.hidl.base-V1.0-java.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-android.hidl.base-V1.0-java.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-android.hidl.base-V1.0-java.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-android.hidl.manager-V1.0-java.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-android.hidl.manager-V1.0-java.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-android.hidl.manager-V1.0-java.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-apache-xml.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-apache-xml.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-apache-xml.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-bouncycastle.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-bouncycastle.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-bouncycastle.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-conscrypt.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-conscrypt.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-conscrypt.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-core-libart.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-core-libart.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-core-libart.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-ext.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-ext.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-ext.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-framework.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-framework.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-framework.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-ims-common.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-ims-common.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-ims-common.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-legacy-test.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-legacy-test.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-legacy-test.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-okhttp.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-okhttp.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-okhttp.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-org.apache.http.legacy.boot.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-org.apache.http.legacy.boot.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-org.apache.http.legacy.boot.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-telephony-common.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-telephony-common.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-telephony-common.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot-voip-common.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot-voip-common.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot-voip-common.txt
echo /sdcard/sdcard/android/system/framework/arm64/boot.oat
$OATDUMP --oat-file=/sdcard/sdcard/android/system/framework/arm64/boot.oat --output=/sdcard/sdcard/oatdump/arm64/system_framework_arm64_boot.txt
