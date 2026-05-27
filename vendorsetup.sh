# Add lunch combo for OrangeFox/TWRP
add_lunch_combo ofrp_A67L-ap2a-eng
add_lunch_combo ofrp_A67L-ap2a-userdebug

# OrangeFox-specific variables (MUST be exported, NOT set in BoardConfig.mk)
export FOX_AB_DEVICE=1
export FOX_VARIANT=A67L
export FOX_VENDOR_BOOT_RECOVERY=1
export OF_FORCE_PREBUILT_KERNEL=1
