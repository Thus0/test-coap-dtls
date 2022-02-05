#!/bin/sh
# description: DTLS client with mbedls library
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.108)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-05 23:53

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.108
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# DTLS client
mbedtls_dtls_client

# vim: set sw=4 ts=4 et:
