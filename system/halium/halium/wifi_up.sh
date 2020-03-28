#!/bin/sh


MAXTRIES=15

#Wifi enabler
j=1
while [ ! $j -gt $MAXTRIES ]  ; do
    echo 1 > /dev/wcnss_wlan
    echo sta > /sys/module/wlan/parameters/fwpath

    if [ "$?" -ne "0" ]; then
      sleep 1
    fi

    j=$((j + 1))
done
