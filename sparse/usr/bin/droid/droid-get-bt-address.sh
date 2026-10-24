#!/bin/sh
# Read this unit's Bluetooth address from MTK nvdata (written at the factory)
# into /var/lib/bluetooth/board-address for bluebinder. Nothing is written if
# the address can't be read, so bluebinder_post.sh falls back to its other
# sources instead of using an empty address.

FILE=/mnt/vendor/nvdata/APCFG/APRDEB/BT_Addr

# Wait up to 60 s for the MTK nvram daemon.
n=0
while [ "$(/usr/bin/getprop vendor.service.nvram_init)" != "Ready" ] && [ $n -lt 60 ]; do
    sleep 1
    n=$((n+1))
done

[ -f "$FILE" ] || exit 0
ADDR=$(hexdump -s 0 -n 6 -ve '/1 "%02X:"' "$FILE" | sed "s/:$//")

case "$ADDR" in
    ??:??:??:??:??:??) ;;
    *) exit 0 ;;
esac
[ "$ADDR" = "00:00:00:00:00:00" ] && exit 0

mkdir -p /var/lib/bluetooth
echo "$ADDR" > /var/lib/bluetooth/board-address
