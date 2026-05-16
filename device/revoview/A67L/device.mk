$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Vendor proprietary files
$(call inherit-product-if-exists, vendor/revoview/A67L/device-vendor.mk)

# OFRP (OrangeFox)
$(call inherit-product-if-exists, vendor/recovery/OrangeFox/OrangeFox.mk)

# Device identifiers
PRODUCT_BRAND := FOXXD
PRODUCT_DEVICE := A67L
PRODUCT_MANUFACTURER := revoview
PRODUCT_MODEL := A67L
PRODUCT_NAME := A67L_3G

PRODUCT_GMS_CLIENTID_BASE := android-foxxd

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="A67L" \
    PRODUCT_NAME="A67L_3G" \
    PRIVATE_BUILD_DESC="ussi_arm64_full-user 14 U01005 1760949761 release-keys"

BUILD_FINGERPRINT := "FOXXD/A67L_3G/A67L:14/U01005/1760949761:user/release-keys"

# Screen
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.sys.usb.config=mtp,adb

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
BOARD_SUPER_PARTITION_GROUPS := foxxd_dynamic_partitions
BOARD_FOXXD_DYNAMIC_PARTITIONS_SIZE := 5872025600
BOARD_FOXXD_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor

# Partition copy targets
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor

# A/B updater (required for both TWRP and OFRP)
AB_OTA_UPDATER := true
