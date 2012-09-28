#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

DEVICE_PACKAGE_OVERLAYS := \
    device/fuhu/mt799/overlay

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    tf.enable=y \
    net.hostname=evmt799 \
    drm.service.enabled=true \
    ro.carrier=wifi-only

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    device/fuhu/mt799/init.mt799.rc:root/init.mt799.rc \
    device/fuhu/mt799/fstab.mt799:root/fstab.mt799 \
    device/fuhu/mt799/ueventd.mt799.rc:root/ueventd.mt799.rc \
    device/fuhu/mt799/init.nv_dev_board.usb.rc:root/init.nv_dev_board.usb.rc \
    device/fuhu/mt799/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# for PDK build, include only when the dir exists
# too early to use $(TARGET_BUILD_PDK)
ifneq ($(wildcard packages/wallpapers/LivePicker),)
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
endif

PRODUCT_COPY_FILES += \
    device/fuhu/mt799/vold.fstab:system/etc/vold.fstab \
    device/fuhu/mt799/idc/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
    device/fuhu/mt799/idc/nt1103-ts.idc:system/usr/idc/nt1103-ts.idc \
    device/fuhu/mt799/idc/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
    device/fuhu/mt799/idc/sis_touch.idc:system/usr/idc/sis_touch.idc \
    device/fuhu/mt799/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/fuhu/mt799/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl

PRODUCT_PACKAGES := \
    lights.mt799 \
    audio.primary.mt799 \
    power.mt799 \
    audio.a2dp.default \
    audio.usb.default \
    librs_jni \
    make_ext4fs \
    setup_fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory \
    whisperd

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
    system/extras/bugmailer/send_bug:system/bin/send_bug

# NFC packages
PRODUCT_PACKAGES += \
    nfc.mt799 \
    libnfc \
    libnfc_jni \
    Tag \
    com.android.nfc_extras

PRODUCT_CHARACTERISTICS := tablet,nosdcard

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    device/fuhu/mt799/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    device/fuhu/mt799/media_codecs.xml:system/etc/media_codecs.xml

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \

# audio mixer paths
PRODUCT_COPY_FILES += \
    device/fuhu/mt799/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    device/fuhu/mt799/audio_policy.conf:system/etc/audio_policy.conf

# inherit from the non-open-source side, if present
$(call inherit-product-if-exists, vendor/fuhu/mt799/device-vendor.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

WIFI_BAND := 802_11_BG
 $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

