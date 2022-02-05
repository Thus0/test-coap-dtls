#!/bin/sh
# description: TLS client with wolfssl library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.108)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-05 16:48

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.108
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
SERVER_BIN=/app/wolfssl/examples/client/client

# TLS 1.3 client
${SERVER_BIN} -h ${DTLS_SERVER} -p ${DTLS_PORT} -v 4

# vim: set sw=4 ts=4 et:
