#!/bin/sh
# description: DTLS server with Pion DTLS library
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.113)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-06 00:07

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.113
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
SERVER_GO=/app/piondtls/examples/listen/selfsign/main.go

# DTLS 1.2 server
go run ${SERVER_GO} 

# vim: set sw=4 ts=4 et:
