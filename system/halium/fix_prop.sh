#!/bin/sh

# Enable fixups
chmod 4777 /usr/lib/dbus-1.0/dbus-daemon-launch-helper
chown root:messagebus /usr/lib/dbus-1.0/dbus-daemon-launch-helper
chmod u+s /usr/lib/dbus-1.0/dbus-daemon-launch-helper

mkdir /dev/cpuset && mount -t cpuset cpuset /dev/cpuset

# Enable fixups
chmod 666 /dev/kgsl-3d0

# Enable vibration
chmod 0666 /sys/class/timed_output/vibrator/enable
chown system.system /sys/class/timed_output/vibrator/enable

# Enable GPS
setprop custom.location.testing true

sudo sed -i -e "s/load-module module-droid-discover voice_virtual_stream=true/load-module module-droid-card-24/" /etc/pulse/touch.pa

echo "### Automatically load the Pulseaudio Droid" >> /etc/pulse/touch.pa
echo ".ifexists module-droid-card-24.so" >> /etc/pulse/touch.pa
echo "load-module module-droid-card-24 rate=48000 quirks=+unload_call_exit" >> /etc/pulse/touch.pa
echo ".endif" >> /etc/pulse/touch.pa
echo "" >> /etc/pulse/touch.pa
echo "### Automatically load the audioflinger glue" >> /etc/pulse/touch.pa
echo ".ifexists module-droid-glue-24.so" >> /etc/pulse/touch.pa
echo "load-module module-droid-glue-24" >> /etc/pulse/touch.pa
echo ".endif" >> /etc/pulse/touch.pa

