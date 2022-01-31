#!/bin/sh
# description: DTLS client with wolfssl library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.108)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-31 20:22

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.108
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
CLIENT_BIN=/app/wolfssl/examples/client/client

# DTLS 1.2 client
${CLIENT_BIN} \
    -h ${DTLS_SERVER} -p ${DTLS_PORT} \
    -u -v 3 \
    -k /app/client/ssl/client.key \
    -c /app/client/ssl/client.pem \
    -A /app/client/ssl/cachain.pem \
    -C -Y \
    -l ECDHE-ECDSA-AES128-CCM-8


# vim: set sw=4 ts=4 expandtab:
