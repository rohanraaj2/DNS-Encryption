#!/bin/bash

current_mode=$(adb shell settings get global private_dns_mode | tr -d '\r')

if [ "$current_mode" = "off" ]; then
    echo "Enabling Private DNS (DoT)..."
    adb shell settings put global private_dns_mode hostname
    adb shell settings put global private_dns_specifier dns.google
else
    echo "Disabling Private DNS..."
    adb shell settings put global private_dns_mode off
fi

echo "New Private DNS mode:"
adb shell settings get global private_dns_mode
