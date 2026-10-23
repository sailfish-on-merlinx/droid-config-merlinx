%package -n patterns-sailfish-device-adaptation-merlinx
Summary: Sailfish OS Adaptation for Xiaomi Redmi Note 9 (merlinx)
Group: System/Configuration
Requires: droid-hal-merlinx
Requires: droid-hal-version-merlinx
Requires: droid-config-merlinx
Requires: droid-config-merlinx-policy
Requires: droid-config-merlinx-preinit-plugin
Requires: droid-config-merlinx-bluez5

# Hybris Graphics & Wayland Compositor (Lipstick)
Requires: libhybris >= 0.0.5.48
Requires: libhybris-libEGL
Requires: libhybris-libGLESv2
Requires: libhybris-libwayland-egl
Requires: libhybris-libsync
Requires: qt5-qtwayland-wayland_egl
Requires: qt5-qpa-hwcomposer-plugin
Requires: qtscenegraph-adaptation
Requires: qt5-plugin-generic-evdev

# MediaTek MT6768 / Bionic Quirks
Requires: libtls-padding
Requires: parse-android-dynparts

# Audio & Voice Call Routing
Requires: pulseaudio-modules-droid
Requires: pulseaudio-modules-droid-hidl
Requires: audiosystem-passthrough-dummy-af

# Camera & Multimedia Hardware Acceleration
Requires: gstreamer1.0
Requires: gstreamer1.0-plugins-good
Requires: gstreamer1.0-plugins-base
Requires: gstreamer1.0-plugins-bad
Requires: gstreamer1.0-droid
Requires: gmp-droid
Requires: nemo-gstreamer1.0-interfaces
Requires: qt5-qtmultimedia-plugin-mediaservice-gstmediacapture

# Telephony, Dual-SIM & VoLTE
Requires: ofono-binder-plugin
Requires: ofono-binder-plugin-ext-mtk
Requires: dummy_netd

# Bluetooth & BlueZ 5
Requires: bluez5-tools
Requires: bluebinder
Requires: rfkill

# GNSS / GPS Positioning
Requires: geoclue-provider-hybris

# Sensors & Feedback
Requires: hybris-libsensorfw-qt5
Requires: ngfd-plugin-native-vibrator
Requires: libngf-qt5-qtfeedback

# System, Battery & USB
Requires: mce-plugin-libhybris
Requires: usb-moded

%description -n patterns-sailfish-device-adaptation-merlinx
Pattern for Sailfish OS device adaptation on Xiaomi Redmi Note 9 (merlinx).

%files -n patterns-sailfish-device-adaptation-merlinx
