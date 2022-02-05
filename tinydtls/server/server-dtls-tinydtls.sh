#!/bin/sh
# description: DTLS server with tinydtls library
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.110)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-06 00:05

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.110
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
SERVER_BIN="/app/tinydtls-develop/tests/dtls-server"

# DTLS 1.2 server
"${SERVER_BIN}" \
    -A ${COAPS_HOST} \
    -p ${COAPS_PORT} \
    -v 3

# vim: set sw=4 ts=4 et:
