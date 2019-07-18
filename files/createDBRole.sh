#!/bin/bash
cd /var
#sudo -u postgres psql -c "CREATE ROLE icinga WITH LOGIN PASSWORD 'icinga'"
#sudo -u postgres createdb -O icinga -E UTF8 icinga

sudo -u postgres psql -c 'create database icinga';
sudo -u postgres psql -c "create user icinga with password 'icinga'";
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE icinga TO icinga";
sudo -u postgres psql  -d icinga < /usr/share/icinga2-ido-pgsql/schema/pgsql.sql

