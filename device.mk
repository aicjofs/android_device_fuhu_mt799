
$(call inherit-product-if-exists, vendor/fuhu/mt799/mt799-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/fuhu/mt799/overlay

TARGET_SCREEN_HEIGHT := 600
TARGET_SCREEN_WIDTH := 1024

LOCAL_PATH := device/fuhu/mt799
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

