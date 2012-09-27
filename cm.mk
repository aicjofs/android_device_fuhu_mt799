## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := mt799

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/fuhu/mt799/device_mt799.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mt799
PRODUCT_NAME := cm_mt799
PRODUCT_BRAND := fuhu
PRODUCT_MODEL := mt799
PRODUCT_MANUFACTURER := fuhu
