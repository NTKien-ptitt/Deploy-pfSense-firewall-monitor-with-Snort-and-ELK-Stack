#!/bin/bash

# Script cài đặt pfSense trên máy chủ

# Download and install pfSense
echo "Downloading pfSense..."
wget -O /tmp/pfsense.iso https://example.com/pfsense-download

# Tải xuống và cài đặt pfSense
echo "Installing pfSense..."
dd if=/tmp/pfsense.iso of=/dev/sda bs=4M
sync

# Khởi động lại hệ thống
reboot

