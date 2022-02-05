#!/bin/sh
# description: DTLS-CERT client with wolfssl library
# environment variables:
#   - DTLS_PORT   (default: 5684)
#   - DTLS_SERVER (default: 192.168.11.108)
#
#        author: Thus0
# last modified: 2022-02-05 16:32

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.108

# Configuration
CLIENT_BIN=/app/wolfssl/examples/client/client

# DTLS 1.2 client (DTLS-CERT)
${CLIENT_BIN} \
    -h ${DTLS_SERVER} -p ${DTLS_PORT} \
    -u -v 3 \
    -k /app/client/ssl/client.key \
    -c /app/client/ssl/client.pem \
    -A /app/client/ssl/cachain.pem \
    -C -Y \
    -l ECDHE-ECDSA-AES128-CCM-8

# vim: set sw=4 ts=4 et:
