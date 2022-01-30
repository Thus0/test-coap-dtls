#!/bin/sh
# description: DTLS server with mbedtls library
# environment variables:
#   - DTLS_PORT (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 14:42

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
COAPS_BIN="/app/wolfssl/examples/server"

# TLS 1.3 server
"${COAPS_BIN}" -v 4 -b -p 5684 -d -e

# vim: set sw=4 expandtab:
