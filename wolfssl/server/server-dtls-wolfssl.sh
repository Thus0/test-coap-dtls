#!/bin/sh
# description: DTLS server with wolfssl library
# environment variables:
#   - DTLS_PORT (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 16:03

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
SERVER_BIN="/app/wolfssl/examples/server"

# DTLS 1.2 server echo
"${SERVER_BIN}" -u -v 3 -b -p ${DTLS_PORT} -d -e

# vim: set sw=4 expandtab:
