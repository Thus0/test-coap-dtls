#!/bin/sh
# description: DTLS client with Pion DTLS library
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.113)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-06 00:08

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.113
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
CLIENT_GO=/app/piondtls/examples/dial/selfsign/main.go

# DTLS 1.2 client
go run ${CLIENT_GO}

# vim: set sw=4 ts=4 et:
