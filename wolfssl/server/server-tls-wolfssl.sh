#!/bin/sh
# description: TLS server with wolfssl library
# environment variables:
#   - DTLS_PORT (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-05 16:47

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
SERVER_BIN="/app/wolfssl/examples/server"

# TLS 1.3 server echo
"${SERVER_BIN}" -v 4 -b -p ${DTLS_PROT} -d -e

# vim: set sw=4 ts=4 et:
