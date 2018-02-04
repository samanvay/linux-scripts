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