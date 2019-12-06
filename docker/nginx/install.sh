#!/bin/bash

# Update package lists
apt-get update

# Install nginx
apt-get install -y nginx

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Stop nginx daemonisation
echo "daemon off;" >> /etc/nginx/nginx.conf