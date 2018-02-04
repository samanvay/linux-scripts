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

# for database dump
mysql> use mydb;
mysql> source db_backup.dump;