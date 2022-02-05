#!/bin/sh
# description: DTLS-PSK client with tinydls library
# environment variables:
#   - COAPS_HOST           (default: 192.168.11.110)
#   - COAPS_PORT           (default: 5684)
#   - PSK_CLIENT_IDENTITY  (default: Client_Identity) 
#   - PSK_KEY              (default: 123456789) 
#
#        author: Thus0
# last modified: 2022-02-05 23:56

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.110
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684
[ -z ${PSK_CLIENT_IDENTITY} ] && PSK_CLIENT_IDENTITY=Client_Identity
[ -z ${PSK_KEY} ] && PSK_KEY=123456789

# Configuration
CLIENT_BIN=/app/tinydtls-develop/tests/dtls-client

# DTLS 1.2 client (DTLS-PSK)
${CLIENT_BIN} \
    -i ${PSK_CLIENT_IDENTITY} \
    -k ${PSK_KEY} \
    -v 3 \
    ${COAPS_HOST} ${COAPS_PORT} \

# vim: set sw=4 ts=4 et:
