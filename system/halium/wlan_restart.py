#!/usr/bin/python3
import subprocess
import os.path

content_file = '/sys/devices/soc/a000000.qcom,wcnss-wlan/net/wlan0/address'

if os.path.isfile(content_file) :
    print("ok")
else:
    subprocess.Popen("echo sta > /sys/module/wlan/parameters/fwpath", shell=True)
