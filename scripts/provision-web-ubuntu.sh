#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y nginx git

sudo systemctl enable nginx
sudo systemctl start nginx


sudo ufw allow 'Nginx HTTP' || true
