#!/bin/sh
# description: DTLS-CERT client with wolfssl library
# environment variables:
#   - CLIENT_CACHAIN      (default: ssl/cachain.pem)
#   - CLIENT_CERT         (default: ssl/client-cert.pem)
#   - CLIENT_PRIVATE_KEY  (default: ssl/client-key.pem)
#   - COAPS_HOST          (default: 192.168.11.108)
#   - COAPS_PORT          (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-06 00:02

# Exit on first error
set -e

# Default environment variables
[ -z ${CLIENT_CACHAIN} ] && CLIENT_CACHAIN=ssl/cachain.pem
[ -z ${CLIENT_CERT} ] && CLIENT_CERT=ssl/client-cert.pem
[ -z ${CLIENT_PRIVATE_KEY} ] && CLIENT_PRIVATE_KEY=ssl/client-key.pem
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.108
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
CLIENT_BIN=/app/wolfssl/examples/client/client

# DTLS 1.2 client (DTLS-CERT)
${CLIENT_BIN} \
    -h ${COAPS_HOST} \
    -p ${COAPS_PORT} \
    -u \
    -v 3 \
    -k ${CLIENT_PRIVATE_KEY} \
    -c ${CLIENT_CERT} \
    -A ${CLIENT_CACHAIN} \
    -C -Y \
    -l ECDHE-ECDSA-AES128-CCM-8

# vim: set sw=4 ts=4 et:
