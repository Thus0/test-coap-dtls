#!/bin/sh
# description: COAPS client with anjay library
# environment variables:
#   - DTLS_PORT           (default: 5684)
#   - DTLS_SERVER         (default: 1192.168.11.116)
#   - ENDPOINT_NAME       (default: Anjay_Client)
#   - PSK_CLIENT_IDENTITY (default: Client_Identity)
#   - PSK_KEY             (default: 123456789)
#
#        author: Thus0
# last modified: 2022-02-05 22:29

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.116
[ -z ${PSK_CLIENT_IDENTITY} ] && PSK_CLIENT_IDENTITY="Client_Identity"
[ -z ${PSK_KEY} ] && PSK_KEY=123456789

# Configuration
CLIENT_BIN=/app/build-mbedtls/output/bin/demo

# Client arguments
SECURITY_MODE=psk

# DTLS client (DTLS-PSK)
${CLIENT_BIN} \
    --endpoint-name "${ENDPOINT_NAME}" \
    --server-uri "coaps://${DTLS_SERVER}:${DTLS_PORT}" \
    --security-mode "${SECURITY_MODE}" \
    --identity-as-string "${PSK_CLIENT_IDENTITY}" \
    --key-as-string "${PSK_KEY}"

# vim: set sw=4 tb=4 et:
