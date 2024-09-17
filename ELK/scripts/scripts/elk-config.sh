#!/bin/bash

# Script to configure ELK Stack

echo "Configuring Elasticsearch..."
cp /path/to/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

echo "Configuring Logstash..."
cp /path/to/logstash.conf /etc/logstash/conf.d/logstash.conf

echo "Configuring Kibana..."
cp /path/to/kibana.yml /etc/kibana/kibana.yml

# Restart services
echo "Restarting services..."
systemctl restart elasticsearch
systemctl restart logstash
systemctl restart kibana

echo "ELK Stack configuration completed."

