#!/bin/bash

# Script để cấu hình cài đặt tường lửa pfSense tự động

# Set firewall rules
echo "Setting up firewall rules..."
pfctl -f /path/to/firewall-rules.conf

# Thiết lập cấu hình NAT
echo "Setting up NAT..."
pfctl -N /path/to/nat-config.conf

# Áp dụng các thay đổi
echo "Reloading pfSense firewall..."
pfctl -e

echo "pfSense configuration completed."
