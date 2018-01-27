yum install httpd
systemctl enable httpd.service
systemctl restart httpd.service
systemctl restart firewalld
firewall-cmd --add-service=http --permanent && sudo firewall-cmd --add-service=https --permanent
systemctl restart firewalld