yum install httpd
systemctl enable httpd.service
systemctl restart httpd.service
systemctl restart firewalld
firewall-cmd --add-service=http --permanent && sudo firewall-cmd --add-service=https --permanent
systemctl restart firewalld

# SSL
yum install mod_ssl openssl
# from appropriate dir
openssl genrsa -out ca.key 2048
openssl req -new -key ca.key -out ca.csr
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt

cp ca.crt /etc/pki/tls/certs
cp ca.key /etc/pki/tls/private/ca.key
cp ca.csr /etc/pki/tls/private/ca.csr

vi +/SSLCertificateFile /etc/httpd/conf.d/ssl.conf
#Change
SSLCertificateFile /etc/pki/tls/certs/ca.crt
SSLCertificateKeyFile /etc/pki/tls/private/ca.key
service httpd restart

firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload


#UBUNTU
# https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04
apt-get install apache2
apache2ctl configtest
service apache2 restart
ufw app list
ufw app info "Apache Full"
ufw allow in "Apache Full"
chown -R demo:www-data *
chown -R :www-data /var/www/html/wp-content/uploads

# Virtual Host
# https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-16-04
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/ijme.in.conf
a2ensite ijme.in.conf
a2dissite 000-default.conf
service apache2 restart

# SSL
# https://www.digitalocean.com/community/tutorials/how-to-create-a-ssl-certificate-on-apache-for-ubuntu-14-04
sudo a2enmod ssl
sudo service apache2 restart
sudo mkdir /etc/apache2/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
sudo vi /etc/apache2/sites-available/default-ssl.conf
## Enable configuration
sudo a2ensite default-ssl.conf
sudo service apache2 restart

# CACHE
#https://www.digitalocean.com/community/tutorials/how-to-configure-apache-content-caching-on-ubuntu-14-04
