# icinga
Icinga/icingaweb2 module installation on centos through puppet



# icingaPostgres

#### Table of Contents
1.  Description
2.  Setup - The basics of getting started with icinga
3.  Setup requirements
4.  Beginning with icinga
5.  Troubleshooting


## Description

This module  will help to install icinga on Main server where backend will be Postgres DB using Puppet modules.
Here puppet master machine will push configruation on puppet agent and configure it with icinga which will act as ICINGA main server.


## Setup
Setup Requirements
Minimum two machine installed and configured with puppet


### Beginning with icinga


*  After configuration on puppte master & agent .

*  do puppet agent -t on agent machine (This will fetch configuration from master and do the installation ).

*  now access your local ip or localhost https::///icingaweb2.

*  login through admin/icingaweb2 (This credential is stored in pgsql icingaweb2 database).

### Troubleshooting


*  in case gui is not accessible. check httpd service

*  delete file  rm -rf /etc/httpd/conf.d/Nginxicingaweb2.conf

*  do httpd -t (to check any further syntax error in httpd conf).

*  now restart httpd "systemctl restart httpd.service"

## if gui is not able to login :


1.  check psql -U icingaweb2 -h localhost -d icingaweb2 -W
2.  enter password "icingaweb2"
3.  if its not able to login then check /var/lib/pgsql/data/pg_hba.conf
4.  make sure icinga user is added with md5
5.  now restart pgsql (  systemctl restart postgresql.service).
6.  again  try "psql -U icingaweb2 -h localhost -d icingaweb2 -W" (Now you must be able to login in DB).


## if stil there is error in login then
1.  openssl passwd -1 icingaweb2 (Note down hash key)
2.  go into database icingaweb2 => table (icingaweb_user)
3.  and update admin password with above generated key.

## Compatiblity 
OS => Centos (tested)
