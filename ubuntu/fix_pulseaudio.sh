#!/bin/sh
sudo sed -i -e "s/load-module module-droid-discover voice_virtual_stream=true/load-module module-droid-card-24/" /etc/pulse/touch.pa
reboot
