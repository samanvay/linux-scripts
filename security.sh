#!/usr/bin/env bash
#Generate self-signed certificate
keytool -genkey -alias tomcat -storetype PKCS12 -keyalg RSA -keysize 2048 -keystore keystore.p12 -validity 3650

#Convert pem to PKCS12
cd /etc/letsencrypt/live/gunak.nhsrcindia.org
openssl pkcs12 -export -in fullchain.pem \
                -inkey privkey.pem \
                 -out /home/nhsrc1/facilities-assessment-host/app-servers/keystore.p12 \
                 -name tomcat \
                 -CAfile chain.pem \
                 -caname root


# Local Certificate
openssl req -x509 -out localhost.crt -keyout localhost.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <(
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
keytool -import -alias tomcat -file myCertificate.crt -keystore keystore.p12 -storepass password