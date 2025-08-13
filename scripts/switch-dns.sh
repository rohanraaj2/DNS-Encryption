#!/bin/bash

CONFIG_FILE="/etc/systemd/resolved.conf"

echo "Select DNS provider to enable DNS-over-TLS:"
echo "1) Cloudflare (1.1.1.1)"
echo "2) Quad9 (9.9.9.9)"
echo "3) Google (8.8.8.8)"
echo "4) Disable DNS-over-TLS"
read -p "Enter choice [1-4]: " choice

case $choice in
  1)
    DNS_SERVERS="1.1.1.1"
    DNS_OVER_TLS="yes"
    PROVIDER="Cloudflare"
    ;;
  2)
    DNS_SERVERS="9.9.9.9"
    DNS_OVER_TLS="yes"
    PROVIDER="Quad9"
    ;;
  3)
    DNS_SERVERS="8.8.8.8"
    DNS_OVER_TLS="yes"
    PROVIDER="Google"
    ;;
  4)
    DNS_OVER_TLS="no"
    PROVIDER="DNS-over-TLS Disabled"
    ;;
  *)
    echo "Invalid choice."
    exit 1
    ;;
esac

echo "Setting DNS provider to $PROVIDER..."

if [ "$DNS_OVER_TLS" = "yes" ]; then
  sudo sed -i "s/^DNS=.*/DNS=$DNS_SERVERS/" $CONFIG_FILE
fi
sudo sed -i "s/^DNSOverTLS=.*/DNSOverTLS=$DNS_OVER_TLS/" $CONFIG_FILE

echo "Restarting systemd-resolved..."
sudo systemctl restart systemd-resolved

echo "Current settings:"
grep "^DNS\|^DNSOverTLS" $CONFIG_FILE
