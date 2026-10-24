%package -n patterns-sailfish-device-configuration-merlinx
Summary: Sailfish OS Configuration for Xiaomi Redmi Note 9 (merlinx)
Group: System/Configuration
Requires: patterns-sailfish-device-adaptation-merlinx
Requires: patterns-sailfish-device-configuration-common-merlinx
Requires: patterns-sailfish-core
Requires: patterns-sailfish-ui
Requires: sailfish-version
Requires: patterns-sailfish-consumer-generic
Requires: patterns-sailfish-cellular-apps
Requires: patterns-sailfish-applications
Requires: patterns-sailfish-store-applications
Requires: patterns-sailfish-device-tools

# First-Party Jolla Applications
Requires: sailfish-audiorecorder
Requires: jolla-calculator
Requires: jolla-calendar
Requires: jolla-camera
Requires: jolla-clock
Requires: jolla-email
Requires: jolla-gallery
Requires: jolla-mediaplayer
Requires: jolla-notes
Requires: sailfish-browser
Requires: sailfish-office
Requires: sailfish-weather

# Hardware & Settings Integration
Requires: jolla-settings-accounts-extensions-3rd-party-all
Requires: jolla-settings-networking-multisim
Requires: jolla-settings-system-flashlight
Requires: geoclue-provider-mlsdb

# Visual Theme & Scale Assets
Requires: sailfish-content-graphics-z%{icon_res}

# Devices with 2G or more memory should also include this booster
# to improve camera startup times and the like
Requires: mapplauncherd-booster-silica-qt5-media

%description -n patterns-sailfish-device-configuration-merlinx
Pattern for Sailfish OS device configuration on Xiaomi Redmi Note 9 (merlinx).

%files -n patterns-sailfish-device-configuration-merlinx
