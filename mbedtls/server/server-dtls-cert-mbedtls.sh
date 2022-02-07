#!/bin/sh
# description: DTLS server with mbedtls library
# environment variables:
#   - COAPS_PORT (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-05 23:54

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# DTLS server
mbedtls_dtls_server

# vim: set sw=4 ts=4 et:
