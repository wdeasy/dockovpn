#!/bin/sh

cd /usr/share/easy-rsa

./easyrsa init-pki
./easyrsa build-ca << EOF
12345
12345

EOF
# CA creation complete and you may now import and sign cert requests.
# Your new CA certificate file for publishing is at:
# /usr/share/easy-rsa/pki/ca.crt

./easyrsa gen-req MyReq << EOF2
12345
12345

EOF2
# Keypair and certificate request completed. Your files are:
# req: /usr/share/easy-rsa/pki/reqs/MyReq.req
# key: /usr/share/easy-rsa/pki/private/MyReq.key

./easyrsa sign-req client MyReq << EOF3
yes
12345
EOF3
# Certificate created at: /usr/share/easy-rsa/pki/issued/MyReq.crt

./easyrsa gen-dh

# DH parameters of size 2048 created at /usr/share/easy-rsa/pki/dh.pem