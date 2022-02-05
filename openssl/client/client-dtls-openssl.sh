#!/bin/sh
# description: DTLS client with OpenSSL library
# environment variables:
#   - CLIENT_CERT         (default: ssl/client-cert.pem)
#   - CLIENT_PRIVATE_KEY  (default: ssl/client-key.pem)
#   - COAPS_PORT          (default: 5684)
#   - COAPS_HOST          (default: 192.168.11.114)
#
#        author: Thus0
# last modified: 2022-02-06 00:13

# Exit on first error
set -e

# Default environment variables
[ -z ${CLIENT_CERT} ] && CLIENT_CERT=ssl/client-cert.pem
[ -z ${CLIENT_PRIVATE_KEY} ] && CLIENT_PRIVATE_KEY=ssl/client-key.pem
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.114
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# DTLS 1.2 client
openssl s_client -dtls1_2 \
    -debug \
    -connect ${COAPS_HOST}:${COAPS_PORT} \
    -key ${CLIENT_PRIVATE_KEY} \
    -cert ${CLIENT_CERT}

# vim: set sw=4 ts=4 et:
