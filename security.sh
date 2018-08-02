#!/usr/bin/env bash
#Generate self-signed certificate
keytool -genkey -alias tomcat -storetype PKCS12 -keyalg RSA -keysize 2048 -keystore keystore.p12 -validity 3650

#Convert pem to PKCS12 for Tomcat Server
make stop_server_nhsrc stop_metabase
./letsencrypt-auto certonly --standalone -d gunak.nhsrcindia.org --debug
ls -lt /etc/letsencrypt/live/gunak.nhsrcindia.org
cd /etc/letsencrypt/live/gunak.nhsrcindia.org
openssl pkcs12 -export -in fullchain.pem \
                -inkey privkey.pem \
                 -out /home/nhsrc1/facilities-assessment-host/app-servers/keystore.p12 \
                 -name tomcat \
                 -CAfile chain.pem \
                 -caname root

# Generate certificate for letsencrypt
git clone https://github.com/letsencrypt/letsencrypt
service apache2 stop
./letsencrypt-auto certonly --standalone -d ijme.in -d www.ijme.in -d issuesinmedicalethics.org -d www.issuesinmedicalethics.org --debug

# add to apache
SSLCertificateFile /etc/letsencrypt/live/dev.bahmnidev.org/cert.pem
SSLCertificateKeyFile /etc/letsencrypt/live/dev.bahmnidev.org/privkey.pem
SSLCertificateChainFile /etc/letsencrypt/live/dev.bahmnidev.org/chain.pem

# Local Certificate
openssl req -x509 -out localhost.crt -keyout localhost.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <(
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
keytool -import -alias tomcat -file myCertificate.crt -keystore keystore.p12 -storepass password
#JKS
keytool -importkeystore -srckeystore keystore.p12 -srcstoretype pkcs12 -srcalias tomcat -destkeystore keystore.jks -deststoretype jks -deststorepass -destalias tomcat
keytool -importkeystore -srckeystore keystore.p12 -srcstoretype pkcs12 -srcalias tomcat -destkeystore keystore.jks -deststoretype jks -deststorepass password -destalias tomcat