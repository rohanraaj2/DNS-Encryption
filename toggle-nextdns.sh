#!/bin/bash

CONFIG_FILE="/etc/systemd/resolved.conf"
NEXTDNS_IPS="45.90.28.0 45.90.30.0"

if grep -q "$NEXTDNS_IPS" "$CONFIG_FILE"; then
    echo "Switching back to Cloudflare + Quad9 DNS..."
    sudo sed -i "s/^DNS=.*/DNS=1.1.1.1 9.9.9.9/" "$CONFIG_FILE"
    sudo sed -i "s/^DNSOverTLS=.*/DNSOverTLS=yes/" "$CONFIG_FILE"
else
    echo "Switching to NextDNS..."
    sudo sed -i "s/^DNS=.*/DNS=$NEXTDNS_IPS/" "$CONFIG_FILE"
    sudo sed -i "s/^DNSOverTLS=.*/DNSOverTLS=yes/" "$CONFIG_FILE"
fi

echo "Restarting systemd-resolved..."
sudo systemctl restart systemd-resolved

echo "Current DNS servers:"
grep "^DNS=" "$CONFIG_FILE"
