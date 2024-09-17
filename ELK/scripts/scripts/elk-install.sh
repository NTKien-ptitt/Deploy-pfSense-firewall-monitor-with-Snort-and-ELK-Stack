#!/bin/bash

# Script to install ELK Stack (Elasticsearch, Logstash, Kibana)

echo "Installing Elasticsearch..."
apt-get update
apt-get install -y elasticsearch

echo "Installing Logstash..."
apt-get install -y logstash

echo "Installing Kibana..."
apt-get install -y kibana

# Start services
echo "Starting services..."
systemctl start elasticsearch
systemctl start logstash
systemctl start kibana

echo "ELK Stack installation completed."

