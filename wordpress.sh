#!/usr/bin/env bash
mysql -u root -p
CREATE DATABASE wordpressdb;
CREATE USER wordpressuser@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpressdb.* TO wordpressuser@localhost;
FLUSH PRIVILEGES;
service httpd restart

firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload

yum install unzip net-tools

wget https://wordpress.org/wordpress-4.6.10.zip
yum install php-gd

unzip -q wordpress-4.6.10.zip -d /var/www/html/

chown -R apache:apache /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress
chown -R :apache /var/www/html/wordpress/wp-content/uploads