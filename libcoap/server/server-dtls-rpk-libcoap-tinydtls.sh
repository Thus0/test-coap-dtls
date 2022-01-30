#!/bin/sh
# description: COAPS server in command line
#
#        author: Thus0
# last modified: 2022-01-30 23:26

# Exit on first error
set -e

# Configuration variables
COAPS_BIN=coap-server-tinydtls
COAPS_HOST=192.168.11.104
COAP_PORT=5683
COAPS_PORT=5684
COAPS_RPK="ssl/server.key"

# COAPS server
"${COAPS_BIN}" -v 6 \
    -p "${COAP_PORT}" \
    -M "${COAPS_RPK}" -n 
