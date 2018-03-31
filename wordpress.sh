#!/usr/bin/env bash
mysql -u root -p
CREATE DATABASE wordpressdb;
CREATE USER wordpressuser@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpressdb.* TO wordpressuser@localhost;
FLUSH PRIVILEGES;
service httpd restart

yum install unzip net-tools

wget https://wordpress.org/wordpress-4.6.10.zip
yum install php-gd

unzip -q wordpress-4.6.10.zip -d /var/www/html/

chown -R apache:apache /var/www/html/ijmewp
chmod -R 755 /var/www/html/ijmewp
chown -R :apache /var/www/html/ijmewp/wp-content/uploads

# ubuntu
chown -R www-data:www-data /var/www/html/ijmewp
chmod -R 755 /var/www/html/ijmewp
chown -R :www-data /var/www/html/ijmewp/wp-content/uploads
#https://www.digitalocean.com/community/questions/how-can-i-fix-my-wordpress-permalinks