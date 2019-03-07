#!/usr/bin/env bash
# We use python, pip, certbot and aws
yum install epel-release
sudo yum install python-pip
pip install awscli --upgrade --user
sudo yum install certbot

# Generate certificate for letsencrypt
sudo certbot certonly
openssl pkcs12 -export -out ${APP_DIR}/${P12_NAME}.p12 \
    -passin pass:${PASSWORD} -passout pass:${PASSWORD} \
    -in /etc/letsencrypt/live/${FQDN}/fullchain.pem \
    -inkey /etc/letsencrypt/live/${FQDN}/privkey.pem \
    -name tomcat

keytool -importkeystore -deststorepass ${PASSWORD} -destkeypass ${PASSWORD} \
    -destkeystore ${METABASE_DIR}/${JKS_NAME}.jks \
    -srckeystore ${APP_DIR}/${P12_NAME}.p12 \
    -srcstoretype PKCS12 \
    -srcstorepass ${PASSWORD} -alias tomcat

chown ${USER}:${USER} ${APP_DIR}/${P12_NAME}.p12
chown ${USER}:${USER} ${METABASE_DIR}/${JKS_NAME}.jks