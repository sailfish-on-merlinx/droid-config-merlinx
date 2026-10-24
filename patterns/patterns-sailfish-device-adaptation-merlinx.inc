%package -n patterns-sailfish-device-adaptation-merlinx
Summary: Jolla HW Adaptation merlinx
Requires: droid-hal-merlinx
Requires: droid-hal-merlinx-img-boot
Requires: droid-hal-merlinx-kernel-modules
Requires: droid-config-merlinx-sailfish
Requires: droid-config-merlinx-pulseaudio-settings
Requires: droid-config-merlinx-policy-settings
Requires: droid-config-merlinx-preinit-plugin
Requires: droid-config-merlinx-flashing
Requires: droid-config-merlinx-bluez5
Requires: droid-hal-version-merlinx

# Hybris packages
Requires: libhybris-libEGL
Requires: libhybris-libGLESv2
Requires: libhybris-libwayland-egl

# Sensors
Requires: hybris-libsensorfw-qt5

# Vibra
Requires: ngfd-plugin-native-vibrator
Requires: libngf-qt5-qtfeedback

# Needed for /dev/touchscreen symlink
Requires: qt5-plugin-generic-evdev

Requires: pulseaudio-modules-droid
Requires: pulseaudio-modules-droid-hidl

# Used by the MT6768 Volla 22 port for voice call audio
Requires: audiosystem-passthrough-dummy-af

# for audio recording to work:
Requires: qt5-qtmultimedia-plugin-mediaservice-gstmediacapture

# These need to be per-device due to differing backends (fbdev, eglfs, hwc, ..?)
Requires: qt5-qtwayland-wayland_egl
Requires: qt5-qpa-hwcomposer-plugin
Requires: qtscenegraph-adaptation

# For hybris devices with droidmedia, see HADK pdf for more information
Requires: gstreamer1.0-droid
Obsoletes: gmp-droid

# This is needed for notification LEDs
Requires: mce-plugin-libhybris

# USB mode controller
Requires: usb-moded

Requires: rfkill

# enable device lock and allow to select untrusted software
Requires: jolla-devicelock-daemon-encsfa

# For GPS
Requires: geoclue-provider-hybris

# Bluetooth: binderized Bluetooth HAL bridged to BlueZ (CONFIG_BT_HCIVHCI)
Requires: bluebinder

# Telephony: binder RIL + MediaTek IMtkRadioEx@3.0 extension
Requires: ofono-binder-plugin
Requires: ofono-binder-plugin-ext-mtk
Requires: dummy_netd

# Dynamic partitions in super (dmsetup.service)
Requires: parse-android-dynparts
# Keeps prebuilt Mali from overwriting glibc TLS (preloaded via /etc/ld.so.preload)
Requires: libtls-padding
Requires: device-mapper

# binder-list etc. for debugging HAL services
Requires: libgbinder-tools

%description -n patterns-sailfish-device-adaptation-merlinx
Pattern with packages for merlinx HW Adaptation

%files -n patterns-sailfish-device-adaptation-merlinx
