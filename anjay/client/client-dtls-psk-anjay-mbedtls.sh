#!/bin/sh
# description: COAPS client with anjay library
# environment variables:
#   - COAPS_HOST           (default: 1192.168.11.116)
#   - COAPS_PORT           (default: 5684)
#   - ENDPOINT_NAME        (default: Anjay_Client)
#   - PSK_CLIENT_IDENTITY  (default: Client_Identity)
#   - PSK_KEY              (default: 123456789)
#
#        author: Thus0
# last modified: 2022-02-06 00:19

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.116
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684
[ -z ${ENDPOINT_NAME} ] && ENDPOINT_NAME="Anjay_Client"
[ -z ${PSK_CLIENT_IDENTITY} ] && PSK_CLIENT_IDENTITY="Client_Identity"
[ -z ${PSK_KEY} ] && PSK_KEY=123456789

# Configuration
CLIENT_BIN=/app/build-mbedtls/output/bin/demo

# Client arguments
SECURITY_MODE=psk

# DTLS client (DTLS-PSK)
${CLIENT_BIN} \
    --endpoint-name "${ENDPOINT_NAME}" \
    --server-uri "coaps://${COAPS_HOST}:${COAPS_PORT}" \
    --security-mode "${SECURITY_MODE}" \
    --identity-as-string "${PSK_CLIENT_IDENTITY}" \
    --key-as-string "${PSK_KEY}"

# vim: set sw=4 tb=4 et:
