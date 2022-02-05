#!/bin/sh
# description: TLS server with BoringSSL library
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.111)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-06 00:14

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.111
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684
[ -z ${SERVER_CERT} ] && SERVER_CERT=ssl/server-cert.pem
[ -z ${SERVER_PRIVATE_KEY} ] && SERVER_CERT=ssl/server-key.pem

# Configuration
CLIENT_BIN=/app/boringssl/build/tool/bssl

# TLS 1.3 server
${CLIENT_BIN} server \
    -accept ${COAPS_PORT} \
    -key ${SERVER_PRIVATE_KEY} \
    -cert ${SERVER_CERT}

# vim: set sw=4 ts=4 et:
