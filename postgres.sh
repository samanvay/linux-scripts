#!/usr/bin/env bash
sudo yum install postgresql-server postgresql-contrib
sudo postgresql-setup initdb
#host    all             all             127.0.0.1/32            md5
#host    all             all             ::1/128                 md5
sudo vi /var/lib/pgsql/data/pg_hba.conf

sudo systemctl start postgresql
sudo systemctl enable postgresql

sudo -i -u postgres


CREATE USER openchs WITH PASSWORD 'password';
CREATE DATABASE openchs;
GRANT ALL PRIVILEGES ON DATABASE openchs TO openchs;

