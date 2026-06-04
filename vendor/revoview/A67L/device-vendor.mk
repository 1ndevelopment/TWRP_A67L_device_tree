# Vendor properties for FOXXD A67L (SC9863A)
# Extracted from stock vendor build.prop (Android 14 / API 34)

PRODUCT_VENDOR_PROPERTIES := \
    ro.vendor.build.fingerprint=FOXXD/A67L_3G/A67L:14/U01005/1760949761:user/release-keys \
    ro.vendor.build.id=U01005 \
    ro.vendor.build.version.incremental=1760949761 \
    ro.vendor.build.version.sdk=34 \
    ro.vendor.build.version.release=14 \
    ro.vendor.build.security_patch=2025-04-05 \
    ro.board.platform=sp9863a \
    ro.soc.model=SC9863A \
    ro.soc.manufacturer=Spreadtrum \
    ro.vendor.product.cpu.abilist=arm64-v8a,armeabi-v7a,armeabi \
    ro.vendor.product.cpu.abilist32=armeabi-v7a,armeabi \
    ro.vendor.product.cpu.abilist64=arm64-v8a \
    ro.hardware.camera=unisoc \
    ro.hardware.enhance=unisoc \
    ro.hardware.dpu=unisoc \
    ro.hardware.gsp=unisoc \
    ro.hardware.hwcomposer=unisoc \
    ro.hardware.sensors=unisoc \
    ro.hardware.audio.primary=normal \
    ro.vendor.fps.support=true \
    ro.vendor.tui.chip=sharkl3 \
    ro.zygote=zygote64_32 \
    ro.build.ab_update=true \
    ro.boot.dynamic_partitions=true \
    ro.product.first_api_level=33 \
    ro.vndk.version=34 \
    ro.vendor.build.date=Mon Oct 20 21:44:47 CST 2025 \
    persist.sys.usb.config=mtp,adb

# Vendor firmware files
PRODUCT_PACKAGES := \
    libbootctrl \
    bootctrl.default \
    unisoc.bootctrl
