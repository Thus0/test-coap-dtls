#!/bin/sh
# description: COAPS server in command line
#
#        author: Thus0
# last modified: 2022-02-05 23:56

# Exit on first error
set -e

# Default environment variables
COAPS_HOST=192.168.11.104
COAPS_PORT=5684
RAW_PRIVATE_KEY="ssl/server-key.pem"

# Configuration variables
COAPS_BIN=coap-server-tinydtls

# COAPS server (DTLS-RPK)
"${COAPS_BIN}" \
    -v 6 \
    -p "${COAPS_PORT}" \
    -M "${RAW_PRIVATE_KEY}" \
    -n 

# vim: set sw=4 ts=4 et:
