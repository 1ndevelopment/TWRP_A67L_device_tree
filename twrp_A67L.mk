$(call inherit-product, device/revoview/A67L/device.mk)

# Vendor PRODUCT_COPY_FILES conflict with the build system — not needed for recovery
PRODUCT_COPY_FILES :=

PRODUCT_NAME := twrp_A67L
PRODUCT_DEVICE := A67L
PRODUCT_BRAND := FOXXD
PRODUCT_MODEL := A67L
PRODUCT_MANUFACTURER := revoview
