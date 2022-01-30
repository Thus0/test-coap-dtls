#!/bin/sh
# description: DTLS client with OpenSSL library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.114)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 23:10

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.114
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# DTLS 1.2 client
openssl s_client -dtls1_2 \
    -debug \
    -connect ${DTLS_SERVER}:${DTLS_PORT} \
    -key /app/client/ssl/client.key \
    -cert /app/client/ssl/client.pem 

# vim: set sw=4 expandtab:
