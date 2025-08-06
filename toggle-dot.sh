#!/bin/bash

CONFIG_FILE="/etc/systemd/resolved.conf"

if grep -q "^DNSOverTLS=yes" "$CONFIG_FILE"; then
    echo "Disabling DNS over TLS..."
    sudo sed -i 's/^DNSOverTLS=yes/DNSOverTLS=no/' "$CONFIG_FILE"
else
    echo "Enabling DNS over TLS with Cloudflare + Quad9..."
    sudo sed -i 's/^DNSOverTLS=no/DNSOverTLS=yes/' "$CONFIG_FILE"
    sudo sed -i 's/^DNS=.*/DNS=1.1.1.1 9.9.9.9/' "$CONFIG_FILE"
fi

echo "Restarting systemd-resolved..."
sudo systemctl restart systemd-resolved

echo "Current DNSOverTLS setting and DNS servers:"
grep "^DNSOverTLS\|^DNS" "$CONFIG_FILE"
