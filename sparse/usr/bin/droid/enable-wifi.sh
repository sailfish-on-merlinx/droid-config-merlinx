#!/bin/bash
modprobe wlan_drv_gen4m

# Wait for property service
while [ ! -e /dev/socket/property_service ]; do sleep 0.1; done

# Wait for MediaTek NVRAM initialization
while [ "$(getprop vendor.service.nvram_init)" != "Ready" ]; do sleep 0.2; done
while [ "$(getprop vendor.mtk.nvram.ready)" != "1" ]; do sleep 0.2; done

# Trigger WMT Wi-Fi client mode
while [ ! -e /dev/wmtWifi ]; do sleep 0.2; done
echo S > /dev/wmtWifi

setprop wifi.interface wlan0
