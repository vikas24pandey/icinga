#!/bin/bash
echo ############################install RPM pkgs##########################
rpm --import http://packages.icinga.org/icinga.key
yum makecache
rpm -i https://packages.icinga.org/epel/7/release/noarch/icinga-rpm-release-7-1.el7.centos.noarch.rpm
rpm -i https://packages.icinga.org/epel/icinga-rpm-release-7-latest.noarch.rpm
yum -y install wget
wget --no-check-certificate https://packages.icinga.org/epel/7/release/noarch/icinga-rpm-release-7-1.el7.centos.noarch.rpm
rpm -ivh icinga-rpm-release-7-1.el7.centos.noarch.rpm
echo #############script end , now run with puppet install#################
