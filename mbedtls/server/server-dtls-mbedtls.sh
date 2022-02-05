#!/bin/sh
# description: DTLS server with mbedtls library
# environment variables:
#   - DTLS_PORT (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-05 17:22

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# DTLS server
mbedtls_dtls_server

# vim: set sw=4 ts=4 et:
