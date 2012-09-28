$(call inherit-product, device/fuhu/mt799/full_mt799.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_tablet_wifionly.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME    := ev_mt799
PRODUCT_BRAND   := fuhu
PRODUCT_DEVICE  := mt799
PRODUCT_MODEL   := Nabi 2
PRODUCT_MANUFACTURER := fuhu
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nabi2 BUILD_FINGERPRINT=nabi/nabi2/mt799:4.0.4/IMM76L/USA:user/release-keys PRIVATE_BUILD_DESC="nabi2-user 4.0.4 IMM76L USA release-keys"

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := Mirus
PRODUCT_VERSION_DEVICE_SPECIFIC := b1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Fuhu Nabi 2\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @jmz_software for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

# Copy compatible bootanimation
# XXX: looks ok but is a teeny bit too small.
PRODUCT_COPY_FILES += \
    vendor/ev/prebuilt/xga/media/bootanimation.zip:system/media/bootanimation.zip

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += vendor/ev/overlay/hot_reboot
