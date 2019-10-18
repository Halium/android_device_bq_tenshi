#!/bin/sh
sudo sed -i -e "s/load-module module-droid-discover voice_virtual_stream=true/load-module module-droid-card-24/" /etc/pulse/touch.pa

### Automatically load the Pulseaudio Droid
.ifexists module-droid-card-24.so
load-module module-droid-card-24 rate=48000 quirks=+unload_call_exit
.endif
 
### Automatically load the audioflinger glue
.ifexists module-droid-glue-24.so
load-module module-droid-glue-24
.endif

reboot
