#!/bin/sh
# description: DTLS-PSK client with tinydls library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.110)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 16:28

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.110
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${PSK_IDENTITY} ] && PSK_IDENTITY=Client_Identity
[ -z ${PSK_KEY} ] && PSK_KEY=123456789

# Configuration
CLIENT_BIN=/app/tinydtls-develop/tests/dtls-client

# DTLS 1.2 client (psk)
${CLIENT_BIN} \
    -i ${PSK_IDENTITY} -k ${PSK_KEY} \
    -v 3 \
    ${DTLS_SERVER} ${DTLS_PORT} \


# vim: set sw=4 expandtab:
