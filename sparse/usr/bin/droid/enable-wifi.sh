#!/bin/sh
# MT6768 Wi-Fi bring-up. The WMT/WLAN drivers are built into the kernel
# (no loadable modules on this device); wmt_loader/wmt_launcher are started
# by droid-hal-init from the vendor init scripts.

# Wait for the property system to be up.
while [ ! -e /dev/socket/property_service ]; do sleep 0.1; done

# Wait for nvram to be loaded (MAC address/calibration).
while [ "$(getprop vendor.service.nvram_init 2>/dev/null)" != "Ready" ]; do sleep 0.2; done
while [ "$(getprop vendor.mtk.nvram.ready 2>/dev/null)" != "1" ]; do sleep 0.2; done

# Enable the Wi-Fi adapter in client mode.
while [ ! -e /dev/wmtWifi ]; do sleep 0.2; done
echo S > /dev/wmtWifi || { echo "enable-wifi: writing S to /dev/wmtWifi failed" >&2; exit 1; }

# libhybris aborts setprop at exit after the property is set; ignore that.
setprop wifi.interface wlan0 2>/dev/null || true
