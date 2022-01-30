#!/bin/sh
# description: DTLS client with mbedls library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.108)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 14:08

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.108
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# DTLS client
mbedtls_dtls_client

# vim: set sw=4 expandtab:
