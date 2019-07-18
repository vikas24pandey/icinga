#!/bin/bash
echo "Running script using puppet "
password="icingaweb2";
db_password=$(openssl passwd -1 $password );
database="icingaweb2";
table="icingaweb_user";
sudo -u postgres psql -c 'create database icingaweb2';
sudo -u postgres psql -c "create user icingaweb2 with password 'icingaweb2'";
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE icingaweb2 TO icingaweb2";
sudo -u postgres psql  -d icingaweb2 < /usr/share/doc/icingaweb2/schema/pgsql.schema.sql;
#sudo -u postgres psql -c '\c icingaweb2';

count=$(sudo -u postgres psql  -d icingaweb2 -At -c "select count(*) from icingaweb_user");
echo "checking db count" $count
b=0
if [[ "$count" -gt "$b" ]]
then
echo "value exist"
exit -1;
else
sudo -u postgres psql -d icingaweb2 -c "INSERT INTO icingaweb_user (name, active, password_hash) VALUES ('admin','1','$db_password')";
sudo -u postgres psql -d icingaweb2 -c "GRANT ALL PRIVILEGES ON table icingaweb_user TO icingaweb2";
fi
echo "complete with the cript"
