#!/bin/sh
# description: DTLS server with OpenSSL library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.114)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 23:11

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.114
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# DTLS 1.2 server
openssl s_server -dtls1_2 \
    -accept ${DTLS_PORT} \
    -key /app/server/ssl/server.key \
    -cert /app/server/ssl/server.pem

# vim: set sw=4 expandtab:
