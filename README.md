# TWRP / OrangeFox Device Tree for FOXXD A67L (SC9863A)

![A67L Logo](https://cdn.softtels.com/products/fZmQCFdns31g7o42hqusM7m6xjfMpDjnRDzOUSb7.png)

| Device       | FOXXD A67L                                                        |
|--------------|-------------------------------------------------------------------|
| Manufacturer | revoview                                                          |
| Codename     | A67L                                                              |
| Model        | A67L_3G                                                           |
| SoC          | Unisoc SC9863A (SharkL3) — 8x Cortex-A55                         |
| GPU          | PowerVR IMG8322 (rogue)                                           |
| RAM          | 3GB / 4GB                                                         |
| Storage      | 32GB / 64GB eMMC                                                  |
| Display      | 720x1280 (HD+), 320 dpi                                           |
| Android      | 14 (API 34), GKI                                                  |
| Kernel       | 5.15 (android14-5.15)                                             |
| Build ID     | U01005 (A67L_3G-user)                                             |
| Build Date   | 2024-10-25                                                        |

## Partition Layout

### Dynamic (logical, within super)
| Partition   | FS   | Size      |
|-------------|------|-----------|
| system      | EROFS | ~2.0 GB  |
| vendor      | EROFS | ~1.2 GB  |
| product     | EROFS | ~220 MB  |
| system_ext  | EROFS | ~240 MB  |
| odm         | EROFS | ~12 MB   |

### Physical (by-name)
| Partition   | FS   | Size      |
|-------------|------|-----------|
| boot        | raw  | 64 MB     |
| vendor_boot | raw  | 100 MB    |
| userdata    | F2FS | ~22.5 GB  |
| cache       | F2FS | ~500 MB   |
| metadata    | F2FS | ~16 MB    |
| misc        | raw  | ~1 MB     |
| persist     | raw  | ~2 MB     |
| prodnv      | ext4 | ~4 MB     |
| blackbox    | ext4 | ~8 MB     |

### Super (dynamic partitions container)
- 1x `super` at 5.6 GB
- Group: `foxxd_dynamic_partitions` containing `system`, `system_ext`, `product`, `vendor`
- Slot: A/B (boot_a, boot_b, system_a, system_b, etc.)
- Virtual A/B enabled

## Boot Image Layout

### boot_a.bin (v4 header)
| Section        | Offset    | Size         |
|----------------|-----------|--------------|
| Header (v4)    | 0x0000    | 1584 bytes   |
| Padding        | 0x0630    | 2512 bytes   |
| Kernel (Image) | 0x1000    | 49789440 B   |
| Padding        | 0x2F7BA00 | to part size |

### vendor_boot_a.bin (v4 header)
| Section        | Offset      | Size          |
|----------------|-------------|---------------|
| Vendor Header  | 0x0000      | 24+ bytes     |
| Cmdline        | 0x0018      | ~64 bytes     |
| Vendor Ramdisk | 0x1000      | ~24.8 MB      |
| DTB            | 0x18CE040   | 88147 bytes   |

Cmdline: `console=ttyS1,115200n8 bootconfig bootconfig`

## Board Config Values

| Parameter              | Value                    | Source                   |
|------------------------|--------------------------|--------------------------|
| Kernel load address    | 0x00008000               | boot header              |
| Ramdisk address        | 0x05400000               | boot header              |
| Tags offset            | 0x00000100               | boot header              |
| Page size              | 4096                     | boot header (kernel @4096)  |
| Kernel image           | Image.gz-dtb (48 MB)     | extracted from boot_a    |
| Kernel type            | ARM64 PE32+ (EFI stub)   | file / header            |
| DTB model              | Spreadtrum SP9863A-1H10  | vendor DTB               |
| DTB compatible         | sprd,sp9863a-1h10 / sprd,sc9863a | DTB |

## Build Prerequisites

- Ubuntu 20.04+ (or Debian-based)
- ~200 GB free disk
- 16 GB+ RAM (or swap)
- OmniROM source tree (android-14 branch)

### Setup

#### TWRP (OmniROM)

```bash
# Initialize OmniROM repo
repo init -u https://github.com/omnirom/android.git -b android-14
repo sync -j$(nproc)

# Clone this device tree
git clone <this-repo> device/revoview/A67L

# Clone vendor blobs
git clone <vendor-repo> vendor/revoview/A67L

# Build
source build/envsetup.sh
lunch omni_A67L-userdebug
make recoveryimage
```

#### OrangeFox

```bash
# Initialize OrangeFox repo
repo init -u https://gitlab.com/OrangeFox/Manifest.git -b fox_12.1
repo sync -j$(nproc)

# Clone this device tree
git clone <this-repo> device/revoview/A67L

# Clone vendor blobs
git clone <vendor-repo> vendor/revoview/A67L

# Build
source build/envsetup.sh
lunch fox_A67L-userdebug
mka recoveryimage
```

### Using Prebuilt Kernel

The kernel is included as `device/revoview/A67L/Image.gz-dtb` (extracted from stock boot_a.bin). SHA256:
```
f511d822172d166be9da5eecfab0767c007f15ae10c16e008dea3a26d705b0da
```

To build from source instead, uncomment in BoardConfig.mk:
```
# TARGET_KERNEL_SOURCE := kernel/revoview/A67L
# TARGET_KERNEL_CONFIG := A67L_defconfig
```

Kernel source would need to be placed at `kernel/revoview/A67L/` (SC9863A android14-5.15 GKI).

## Building OrangeFox

```bash
# Initialize OrangeFox repo
repo init -u https://gitlab.com/OrangeFox/Manifest.git -b fox_12.1
repo sync -j$(nproc)

# Clone this device tree
git clone <this-repo> device/revoview/A67L

# Clone vendor blobs
git clone <vendor-repo> vendor/revoview/A67L

# Build
source build/envsetup.sh
lunch fox_A67L-userdebug
mka recoveryimage
```

## Stock Firmware References

The device tree was built from stock firmware `FOXXD_A67L_V1.0` (build date 2024-10-25). Key filesystem characteristics:
- Read-only partitions: EROFS
- Userdata: F2FS with inline encryption
- Cache/Metadata: F2FS (ext4 fallback)
- AVB: vbmeta_system, vbmeta_vendor chains
- Bootconfig: cmdline indicates bootconfig, no footer found in images (likely bootloader-supplied)

### Block Device Paths
- Physical: `/dev/block/by-name/<partition>` with `slotselect` for A/B
- Dynamic: `/dev/block/mapper/<partition>`

### Firmware Source Partitions
| Image           | Size        | Location               |
|-----------------|-------------|------------------------|
| boot_a.bin      | 64 MB       | stock_fw/              |
| vendor_boot_a   | 100 MB      | stock_fw/              |
| super.bin       | 5.6 GB      | stock_fw/              |
| userdata        | 22.5 GB     | stock_fw/              |

Super logical partitions extracted via `lpunpack`:
```
stock_fw/super_out/
├── system_a.img, vendor_a.img, product_a.img
├── system_ext_a.img, odm_a.img
├── system_dlkm_a.img, vendor_dlkm_a.img
└── extracted/{system,vendor,product,system_ext,odm,vendor_dlkm,system_dlkm}/
```

## Recovery-Specific Parameters

This device tree supports both TWRP (`TW_*`) and OrangeFox (`OF_*` / `FOX_*`) variables.

### Untested (need physical device verification)
- `TW_BRIGHTNESS_PATH` / brightness sysfs — guessed as `/sys/class/backlight/panel0-backlight/brightness`
- `TW_MAX_BRIGHTNESS` / `TW_DEFAULT_BRIGHTNESS` — guessed 2047/1200
- `TW_INPUT_BLACKLIST` — set to accelerometer only
- `TW_SCREEN_BLANK_ON_BOOT` / `TW_NO_SCREEN_BLANK` — guessed
- Touchscreen IDC/keylayout files — included from vendor (`usr/idc/`, `usr/keylayout/`)

### Touch Controllers (from vendor firmware)
- focaltech_ts, focaltech_ats, focaltech_spi_ts
- msg2138_ts
- synaptics_dsx, synaptics_dsx_i2c
- adaptive_ts

## File Structure

```
device/revoview/A67L/
├── Android.mk              # Device tree makefile
├── BoardConfig.mk           # Board configuration (TWRP + OFRP)
├── device.mk                # Product makefile (TWRP + OFRP)
├── Image.gz-dtb             # Prebuilt kernel (48 MB)
├── proprietary-files.txt    # Vendor blob manifest (727 entries)
├── recovery.fstab           # Recovery mount table
├── setup-makefiles.sh       # Blob extraction helper
├── vendorsetup.sh           # Lunch combo (omni + fox)
└── README.md                # This file

vendor/revoview/A67L/
├── Android.mk               # Vendor module makefile
├── device-vendor.mk          # PRODUCT_COPY_FILES for blobs (2536 entries)
└── proprietary/              # Vendor blob files (908 MB, 2536 files)
```

## Flashing

WARNING: Flashing a custom recovery requires an unlocked bootloader. FOXXD may require SP Flash Tool or similar Unisoc flashing methods.

```bash
# After building
fastboot flash recovery out/target/product/A67L/recovery.img
fastboot reboot
```

For initial boot, use:
```bash
fastboot boot out/target/product/A67L/recovery.img
```

## Known Issues

1. Display brightness values are untested — may need adjustment
2. FBE decryption may need keymaster lib tweaks
3. Some touch drivers may not respond in recovery
4. MTP may need additional kernel modules
5. No kernel source available — using prebuilt kernel (standard for recovery builds)
6. OrangeFox A/B support (`OF_AB_DEVICE`) is set but untested
