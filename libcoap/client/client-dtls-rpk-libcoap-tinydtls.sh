#!/bin/sh
# description: COAPS client in command line
#
#        author: Thus0
# last modified: 2022-02-05 17:17

# Exit on firt error
set -e

# Configuration variables
COAPS_BIN=coap-client-tinydtls
COAPS_HOST=192.168.11.104
COAPS_PORT=5684
COAPS_REST="/"
COAPS_LIB="libcoap"
COAPS_RPK="ssl/client.key"

# Get sensors
memory_used=$(free -k | grep Mem: | awk '{print $3}')

# Payload
PAYLOAD="{'memory_used':${memory_used}, 'lib':'${COAPS_LIB}', 'proto':'coaps', 'auth':'token'}"

# COAP client (DTLS-RPK)
"${COAPS_BIN}" -v 6 -m POST \
    -M "${COAPS_RPK}" -n \
    -e "${PAYLOAD}" \
    "coaps://${COAPS_HOST}:${COAPS_PORT}${COAPS_REST}"

# vim: set sw=4 ts=4 et: 
