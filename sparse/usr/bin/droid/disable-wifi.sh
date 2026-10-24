#!/bin/sh
if [ -e /dev/wmtWifi ]; then
    echo 0 > /dev/wmtWifi
fi
