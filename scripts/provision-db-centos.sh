#!/bin/bash

set -e

sudo dnf install -y mariadb-server

sudo systemctl enable --now mariadb

MYSQL_ROOT_PASSWORD="root"

sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF


sudo mysql -u root -p$MYSQL_ROOT_PASSWORD <<EOF
CREATE DATABASE IF NOT EXISTS demo_db;
EOF

sudo mysql -u root -p$MYSQL_ROOT_PASSWORD demo_db < /vagrant/database/create-table.sql


sudo mysql -u root -p$MYSQL_ROOT_PASSWORD demo_db < /vagrant/database/insert-demo-data.sql


