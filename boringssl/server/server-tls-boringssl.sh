#!/bin/sh
# description: TLS server with BoringSSL library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.111)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-05 16:55

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.111

# Configuration
CLIENT_BIN=/app/boringssl/build/tool/bssl

# TLS 1.3 server
${CLIENT_BIN} server \
    -accept ${DTLS_PORT} \
    -key /app/server/ssl/server.key \
    -cert /app/server/ssl/server.pem

# vim: set sw=4 ts=4 et:
