#!/bin/sh
# description: DTLS client with Pion DTLS library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.113)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 21:41

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.113
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
CLIENT_GO=/app/piondtls/examples/dial/selfsign/main.go

# DTLS 1.2 client
go run ${CLIENT_GO}

# vim: set sw=4 expandtab:
