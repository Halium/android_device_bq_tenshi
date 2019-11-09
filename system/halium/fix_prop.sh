#!/bin/sh

# Enable directory for phablet to run mir+unity8
mkdir /run/user/32011
chown phablet /run/user/32011
chmod 0700 /run/user/32011

chmod 666 /dev/kgsl-3d0

chmod 4777 /usr/lib/dbus-1.0/dbus-daemon-launch-helper
chown root:messagebus /usr/lib/dbus-1.0/dbus-daemon-launch-helper
chmod u+s /usr/lib/dbus-1.0/dbus-daemon-launch-helper

mkdir /dev/cpuset && mount -t cpuset cpuset /dev/cpuset

# Enable wifi at startup
echo 1 > /dev/wcnss_wlan
echo sta > /sys/module/wlan/parameters/fwpath

# Enable vibration
chmod 0666 /sys/class/timed_output/vibrator/enable
chown system.system /sys/class/timed_output/vibrator/enable

# Enable GPS
setprop custom.location.testing true
