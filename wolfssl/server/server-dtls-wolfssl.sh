#!/bin/sh
# description: DTLS server with wolfssl library
# environment variables:
#   - COAPS_PORT           (default: 5684)
#   - SERVER_CACHAIN      (default: ssl/cachain.pem)
#   - SERVER_CERT         (default: ssl/server-cert.pem)
#   - SERVER_PRIVATE_KEY  (default: ssl/server-key.pem)
#   
#        author: Thus0
# last modified: 2022-02-05 23:59

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
SERVER_BIN=/app/wolfssl/examples/server/server

# DTLS 1.2 server
"${SERVER_BIN}" \
    -b -p ${COAPS_PORT} \
    -u -v 3 \
    -k ${SERVER_PRIVATE_KEY} \
    -c ${SERVER_CERT} \
    -A ${SERVER_CACHAIN} \
    -d -V \
    -l ECHDE-ECDSA-AES128-CCM-8

# vim: set sw=4 ts=4 et:
