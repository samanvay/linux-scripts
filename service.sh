# CentOS 7
# http://www.techken.in/linux/how-to-create-custom-systemd-service-in-centos-7-linux/
chmod 755 myservice-start.sh myservice-stop.sh
cp testservice.service /etc/systemd/system/multi-user.target.wants/testservice.service
systemctl enable testservice.service