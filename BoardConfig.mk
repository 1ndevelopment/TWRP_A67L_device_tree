# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_SUPPORTS_64_BIT_APPS := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := A67L

# Platform
TARGET_BOARD_PLATFORM := sc9863a

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_ATAGS_SUPPORT := false
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 bootconfig bootconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_PREBUILT_KERNEL := device/revoview/A67L/Image.gz-dtb
# To build from source, uncomment and provide kernel source:
# TARGET_KERNEL_SOURCE := kernel/revoview/A67L
# TARGET_KERNEL_CONFIG := A67L_defconfig

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 24147728384
BOARD_SUPER_PARTITION_SIZE := 5872025600

# Boot header v4 with vendor_boot. OrangeFox handles vendor_boot-as-recovery
# via FOX_VENDOR_BOOT_RECOVERY=1 using magiskboot (not AOSP mkbootimg).
# All three flags below are required for AOSP mkbootimg.py to generate a
# vendor_boot with the recovery ramdisk as a VENDOR_RAMDISK_TYPE_RECOVERY
# fragment.  Without BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT the
# build system omits the recovery ramdisk, resulting in a ~200 KB image
# that the bootloader will reject on the device.
BOARD_BOOT_HEADER_VERSION := 4
BOARD_HAS_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := device/revoview/A67L

# DTBO partition
BOARD_DTBOIMG_PARTITION_SIZE := 16777216
BOARD_DTBOIMG_PARTITION_NUMBER := 1

# VBMeta partitions
BOARD_VBMETAIMAGE_PARTITION_SIZE := 4194304
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_VENDOR := vendor

BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_PRODUCT_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS := product vendor system system_ext
BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true

# Dynamic partition filesystem types
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/revoview/A67L/recovery.fstab

# TWRP Specifics
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_TWRPAPP := true
TW_INPUT_BLACKLIST := "accelerometer"
TW_SCREEN_BLANK_ON_BOOT := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_NO_SCREEN_BLANK := true
TW_EXTRA_LANGUAGES := true
TW_OVERRIDE_VERSION_CHECK := true
TW_HAS_MTP := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_BASH := true
TW_INCLUDE_NTFS_3G := true
TW_FLASH_AFTER_OTA_DATA_CLEAR := true

# AOSP mkbootimg.py needs explicit --header_version 4 for vendor_boot,
# otherwise it defaults to v2 which rejects --vendor_boot.
BOARD_MKBOOTIMG_ARGS += --header_version 4

# OFRP (OrangeFox) Specifics — OF_* vars are OK in .mk files
OF_THEME := portrait_hdpi
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_USE_MAGISKBOOT := 1
OF_USE_MAGISKBOOT_FOR_ALL_PATCHES := 1
OF_DONT_PATCH_ENCRYPTED_DEVICE := 1
OF_QUICK_BACKUP_LIST := /data;/system;/vendor;/product;/system_ext;/boot;

# Verified Boot — disabled to avoid test key rejection
BOARD_AVB_ENABLE := false
