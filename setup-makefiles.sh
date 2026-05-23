#!/bin/bash

VENDOR=revoview
DEVICE=A67L

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

if [ ! -f "proprietary-files.txt" ]; then
    echo "proprietary-files.txt not found! Please create it with a list of proprietary files to extract."
    exit 1
fi

STOCK_VENDOR="../../../stock_fw/super_out/extracted/vendor"
if [ -d "$STOCK_VENDOR" ]; then
    echo "Found extracted vendor partition at $STOCK_VENDOR"
    mkdir -p $BASE
    cp -a "$STOCK_VENDOR"/* $BASE/
    echo "Done copying vendor files."
else
    echo "Extracted vendor partition not found at $STOCK_VENDOR"
    echo "Please run lpunpack first or update the STOCK_VENDOR path."
    exit 1
fi

echo ""
echo "Proprietary files are in $BASE"
echo "Remember to:"
echo "  1. Update proprietary-files.txt with actual device files"
echo "  2. Review the blobs in vendor/$VENDOR/$DEVICE/proprietary/"
echo "  3. Add PRODUCT_COPY_FILES entries to device-vendor.mk"
