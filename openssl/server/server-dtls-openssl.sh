#!/bin/sh
# description: DTLS server with OpenSSL library
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.114)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-06 00:11

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.114
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684
[ -z ${SERVER_PRIVATE_KEY} ] && SERVER_PRIVATE_KEY=ssl/server-key.pem
[ -z ${SERVER_CERT} ] && SERVER_CERT=ssl/server-cert.pem

# DTLS 1.2 server
openssl s_server -dtls1_2 \
    -accept ${COAPS_PORT} \
    -key ${SERVER_PRIVATE_KEY} \
    -cert ${SERVER_CERT}

# vim: set sw=4 ts=4 et:
