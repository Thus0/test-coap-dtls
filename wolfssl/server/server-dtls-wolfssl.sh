#!/bin/sh
# description: DTLS server with wolfssl library
# environment variables:
#   - DTLS_PORT (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-05 16:47

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
SERVER_BIN=/app/wolfssl/examples/server/server

# DTLS 1.2 server
"${SERVER_BIN}" \
    -b -p ${DTLS_PORT} \
    -u -v 3 \
    -k /app/server/ssl/server.key \
    -c /app/server/ssl/server.pem \
    -A /app/server/ssl/cachain.pem \
    -d -V \
    -l ECHDE-ECDSA-AES128-CCM-8

# vim: set sw=4 ts=4 et:
