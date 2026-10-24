#!/bin/sh
# Map the logical partitions in super (system, system_ext, vendor, product)
# to /dev/mapper/dynpart-*. Mappings are forced read-only: Sailfish never
# writes to the LineageOS super partition.
SUPER=/dev/mmcblk0p44

TABLE="$(/usr/bin/parse-android-dynparts $SUPER)" || exit 1
dmsetup create --concise "$(echo "$TABLE" | sed 's/,,,rw,/,,,ro,/g')"
