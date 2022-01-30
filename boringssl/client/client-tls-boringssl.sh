#!/bin/sh
# description: TLS client with BoringSSL library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.111)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 20:50

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.111
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
CLIENT_BIN=/app/boringssl/build/tool/bssl

# TLS 1.3 client
${CLIENT_BIN} client \
    -connect ${DTLS_SERVER}:${DTLS_PORT} \
    -key /app/client/ssl/client.key \
    -cert /app/client/ssl/client.pem

# vim: set sw=4 expandtab:
