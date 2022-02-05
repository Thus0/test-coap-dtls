#!/bin/sh
# description: COAPS client with anjay library
# environment variables:
#   - CLIENT_CERT         (default: /app/client/ssl/client-cert.der)
#   - CLIENT_PRIVATE_KEY  (default: /app/client/ssl/client-key.der)
#   - ENDPOINT_NAME       (default: Anjay_Client)
#   - DTLS_PORT           (default: 5684)
#   - DTLS_SERVER         (default: 1192.168.11.116)
#
#        author: Thus0
# last modified: 2022-02-05 22:13

# Exit on first error
set -e

# Default environment variables
[ -z ${CLIENT_CERT} ] && CLIENT_CERT=/app/client/ssl/client-cert.der
[ -z ${CLIENT_PRIVATE_KEY} ] && CLIENT_PRIVATE_KEY=/app/client/ssl/client-key.der
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.116

# Configuration
CLIENT_BIN=/app/build-mbedtls/output/bin/demo

# Client arguments
SECURITY_MODE=cert

# DTLS client (DTLS-CERT)
${CLIENT_BIN} \
    --endpoint-name "${ENDPOINT_NAME}" \
    --server-uri "coaps://${DTLS_SERVER}:${DTLS_PORT}" \
    --security-mode "${SECURITY_MODE}" \
    --client-cert-file "${CLIENT_CERT}" \
    --key-file "${CLIENT_PRIVATE_KEY}"

# vim: set sw=4 tb=4 et:
