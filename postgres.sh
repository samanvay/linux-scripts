#!/usr/bin/env bash
sudo yum install postgresql-server postgresql-contrib
sudo postgresql-setup initdb
#host    all             all             127.0.0.1/32            md5
#host    all             all             ::1/128                 md5
sudo vi /var/lib/pgsql/data/pg_hba.conf

sudo systemctl start postgresql
sudo systemctl enable postgresql

sudo -i -u postgres
psql

# openchs
CREATE USER openchs WITH PASSWORD 'password';
CREATE DATABASE facilities_assessment_nhsrc;
GRANT ALL PRIVILEGES ON DATABASE openchs TO openchs;

# nhsrc
CREATE USER nhsrc WITH PASSWORD 'password';
CREATE DATABASE openchs;
GRANT ALL PRIVILEGES ON DATABASE facilities_assessment_nhsrc TO nhsrc;
psql facilities_assessment_nhsrc -c 'create extension if not exists "uuid-ossp"'

#ssh tunnel
ssh -L 3333:serverdb.opench.org:5432 prod-server
psql -h localhost -p 3333 -Uopenchs openchs

#change role
set role role_name

#backup

#login as a user without trust
psql --host=localhost --dbname=facilities_assessment_nhsrc --username=nhsrc

\copy (SELECT * FROM pg_stat_activity) To '/tmp/connections-when-unable-retrieve.csv' With CSV