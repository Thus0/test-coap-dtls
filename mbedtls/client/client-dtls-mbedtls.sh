#!/bin/sh
# description: DTLS client with mbedls library
# environment variables:
#   - DTLS_PORT   (default: 5684)
#   - DTLS_SERVER (default: 192.168.11.108)
#
#        author: Thus0
# last modified: 2022-02-05 17:20

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.108

# DTLS client
mbedtls_dtls_client

# vim: set sw=4 ts=4 et:
