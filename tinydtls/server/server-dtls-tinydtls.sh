#!/bin/sh
# description: DTLS server with tinydtls library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.110)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 16:22

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.110
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
SERVER_BIN="/app/tinydtls-develop/tests/dtls-server"

# DTLS 1.2 server
"${SERVER_BIN}" -A ${DTLS_SERVER} -p ${DTLS_PORT} -v 3

# vim: set sw=4 expandtab:
