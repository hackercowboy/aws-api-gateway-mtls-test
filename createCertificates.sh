#!/bin/bash

if [ -d mtls ]; then rm -rf mtls; fi

mkdir -p mtls/ca
mkdir -p mtls/client

echo 01 > mtls/serial
touch mtls/index.txt

openssl genrsa -out mtls/ca/key.pem 4096
openssl req -new -x509 -days 3650 -config config/openssl.cnf -key mtls/ca/key.pem -subj "/C=CH/ST=BS/L=Basel/O=test/OU=aws/CN=Cerificate Authority" -out mtls/ca/cert.pem
openssl genrsa -out mtls/client/key.pem 4096
openssl req -new -key mtls/client/key.pem -out mtls/client/request.csr -subj "/C=CH/ST=BS/L=Basel/O=test/OU=aws/CN=Test Client 6547320"
openssl ca -config config/openssl.cnf -days 365 -notext -batch -in mtls/client/request.csr -out mtls/client/cert.pem
