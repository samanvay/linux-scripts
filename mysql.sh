wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
vi /etc/yum.repos.d/mysql-community.repo
#verify
yum repolist enabled | grep mysql
yum install mysql
yum install mysql-server
service mysqld start
mysql_secure_installation
systemctl enable mysqld
# https://support.rackspace.com/how-to/installing-mysql-server-on-centos/


#UBUNTU
# https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-14-04
apt-get update
apt-get install mysql-server-5.5
mysql_secure_installation
mysql --version
# for < 5.7.6
mysql_install_db


# for database dump
mysql> CREATE DATABASE frgmxhwawa;
mysql> use frgmxhwawa;
mysql> source db_backup.dump;

# refer to secure note
FLUSH PRIVILEGES;