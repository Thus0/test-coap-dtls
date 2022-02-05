#!/bin/sh
# description: TLS client with BoringSSL library
# environment variables:
#   - DTLS_PORT   (default: 5684)
#   - DTLS_SERVER (default: 192.168.11.111)
#
#        author: Thus0
# last modified: 2022-02-05 16:53

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.111

# Configuration
CLIENT_BIN=/app/boringssl/build/tool/bssl

# TLS 1.3 client
${CLIENT_BIN} client \
    -connect ${DTLS_SERVER}:${DTLS_PORT} \
    -key /app/client/ssl/client.key \
    -cert /app/client/ssl/client.pem

# vim: set sw=4 ts=4 et:
