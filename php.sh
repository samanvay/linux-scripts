#!/usr/bin/env bash
sudo yum install epel

# for php
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7*.rpm
# https://www.digitalocean.com/community/questions/how-to-install-php-5-6-on-centos-7-0-x64
vi /etc/yum.repos.d
yum install php php-gd php-mysql php-mcrypt php-xml

#UBUNTU
# https://www.howtoforge.com/ubuntu-lamp-server-with-apache2-php5-mysql-on-14.04-lts
apt-get install python-software-properties
add-apt-repository ppa:ondrej/php
apt-get update
apt-get install php5 libapache2-mod-php5
apt-get install php5-mysql