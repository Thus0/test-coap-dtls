#!/bin/sh
# description: DTLS server with Pion DTLS library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.113)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-05 17:27

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.113
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
SERVER_GO=/app/piondtls/examples/listen/selfsign/main.go

# DTLS 1.2 server
go run ${SERVER_GO} 

# vim: set sw=4 ts=4 et:
