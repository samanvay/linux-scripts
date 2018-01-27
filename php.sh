#!/usr/bin/env bash
sudo yum install epel

# for php
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7*.rpm
# https://www.digitalocean.com/community/questions/how-to-install-php-5-6-on-centos-7-0-x64
vi /etc/yum.repos.d
yum install php php-gd php-mysql php-mcrypt