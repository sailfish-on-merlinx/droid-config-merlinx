#!/bin/bash
# Sailfish OS Flashing script for Xiaomi Redmi Note 9 (merlinx)
# Device must be in fastboot mode (Volume Down + Power)

if ! command -v fastboot &> /dev/null; then
    echo "fastboot command not found. Please install android platform-tools."
    exit 1
fi

echo "Checking connected device..."
PRODUCT=$(fastboot getvar product 2>&1 | grep "^product:" | awk '{print $2}')
if [ "$PRODUCT" != "merlin" ] && [ "$PRODUCT" != "merlinx" ] && [ "$PRODUCT" != "merlinnfc" ]; then
    echo "Warning: Connected device is '$PRODUCT' (expected merlinx/merlin)."
    read -p "Continue anyway? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo "Flashing hybris bootimage..."
fastboot flash boot boot.img || { echo "Failed to flash boot.img"; exit 2; }

echo "Flashing Sailfish OS rootfs to userdata..."
if [ -f "sailfishos-merlinx.img" ]; then
    fastboot flash userdata sailfishos-merlinx.img || { echo "Failed to flash rootfs"; exit 2; }
fi

echo "Flashing completed successfully."
read -p "Reboot now? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    fastboot reboot
fi
