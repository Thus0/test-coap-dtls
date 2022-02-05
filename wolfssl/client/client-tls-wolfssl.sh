#!/bin/sh
# description: TLS client with wolfssl library
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.108)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-06 00:00

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.108
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
SERVER_BIN=/app/wolfssl/examples/client/client

# TLS 1.3 client
${SERVER_BIN} \
    -h ${COAPS_HOST} \
    -p ${COAPS_PORT} \
    -v 4

# vim: set sw=4 ts=4 et:
