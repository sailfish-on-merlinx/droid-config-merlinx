# Kickstart for Xiaomi Redmi Note 9 (merlinx)
# Architecture: @ARCH@
# Release: @RELEASE@

timezone --utc UTC

part / --fstype="ext4" --size=8000 --label=root

repo --name=adaptation-common-@RELEASE@ --baseurl=https://releases.jolla.com/releases/@RELEASE@/jolla-hw/adaptation-common/@ARCH@/
repo --name=apps-@RELEASE@ --baseurl=https://releases.jolla.com/jolla-apps/@RELEASE@/@ARCH@/
repo --name=hotfixes-@RELEASE@ --baseurl=https://releases.jolla.com/releases/@RELEASE@/hotfixes/@ARCH@/
repo --name=jolla-@RELEASE@ --baseurl=https://releases.jolla.com/releases/@RELEASE@/jolla/@ARCH@/
repo --name=sailfishos-chum-@RELEASE@ --baseurl=http://repo.sailfishos.org/obs/sailfishos:/chum/@RELEASEMAJMIN@_@ARCH@/

%packages
patterns-sailfish-device-configuration-merlinx
%end

%attachment
/boot/boot.img
/etc/hw-release
%end

%pre
export SSU_RELEASE_TYPE=release
touch $INSTALL_ROOT/.bootstrap
%end

%post
export SSU_RELEASE_TYPE=release

if [ "@ARCH@" == armv7hl ] || [ "@ARCH@" == armv7tnhl ]; then
    echo -n "@ARCH@-meego-linux" > /etc/rpm/platform
    echo "arch = @ARCH@" >> /etc/zypp/zypp.conf
fi

echo -n "Rebuilding RPM database..."
rm -f /var/lib/rpm/__db*
rpm --rebuilddb
echo "done"

rm -f /.bootstrap

export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export GSETTINGS_BACKEND=gconf

UID_MIN=$(grep "^UID_MIN" /etc/login.defs | tr -s " " | cut -d " " -f2)
DEVICEUSER=`getent passwd $UID_MIN | sed 's/:.*//'`

if [ -x /usr/bin/oneshot ]; then
   /usr/bin/oneshot --mic
   su -c "/usr/bin/oneshot --mic" $DEVICEUSER
fi

if [ "$SSU_RELEASE_TYPE" = "rnd" ]; then
    [ -n "@RNDRELEASE@" ] && ssu release -r @RNDRELEASE@
    [ -n "@RNDFLAVOUR@" ] && ssu flavour @RNDFLAVOUR@
    [ -n "@RELEASE@" ] && ssu set update-version @RELEASE@
    ssu mode 2
else
    [ -n "@RELEASE@" ] && ssu release @RELEASE@
    ssu mode 4
fi

export SSU_DOMAIN=@RNDFLAVOUR@
if [ "$SSU_RELEASE_TYPE" = "release" ] && [[ "$SSU_DOMAIN" = "public-sdk" ]]; then
    ssu domain sailfish
fi
%end
