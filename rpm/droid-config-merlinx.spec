%define device merlinx
%define vendor xiaomi

%define vendor_pretty Xiaomi
%define device_pretty Redmi Note 9

%define droid_target_aarch64 1
%define community_adaptation 1
%define android_version_major 16

Provides: ofono-configs
Provides: ofono-configs-binder
Obsoletes: ofono-configs-mer
Obsoletes: ofono-configs-binder

# 1080 x 2340 resolution (~395 ppi) -> pixel ratio 1.5 - 1.75
%define pixel_ratio 1.5

%include droid-configs-device/droid-configs.inc
%include patterns/patterns-sailfish-device-adaptation-merlinx.inc
%include patterns/patterns-sailfish-device-configuration-merlinx.inc
