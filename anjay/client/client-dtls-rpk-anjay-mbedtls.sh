#!/bin/sh
# description: COAPS client with anjay library
# environment variables:
#   - COAPS_HOST     (default: 1192.168.11.116)
#   - COAPS_PORT     (default: 5684)
#   - ENDPOINT_NAME  (default: Anjay_Client)
#
#        author: Thus0
# last modified: 2022-02-06 00:22

# Exit on first error
set -e

# Default environment variables
[ -z ${CLIENT_CERT} ] && CLIENT_CERT=ssl/client-cert.der
[ -z ${CLIENT_PRIVATE_KEY} ] && CLIENT_PRIVATE_KEY=ssl/client-key.der
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.116
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
CLIENT_BIN=/app/build-mbedtls/output/bin/demo

# Client arguments
SECURITY_MODE=rpk

# DTLS client (DTLS-RPK)
${CLIENT_BIN} \
    --endpoint-name ${ENDPOINT_NAME} \
    --server-uri "coaps://${COAPS_HOST}:${COAPS_PORT}" \
    --security-mode "${SECURITY_MODE}" \
    --client-cert-file "${CLIENT_CERT}" \
    --key-file "${CLIENT_PRIVATE_KEY}"

# vim: set sw=4 tb=4 et:
