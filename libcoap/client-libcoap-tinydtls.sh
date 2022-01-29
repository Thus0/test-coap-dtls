#!/bin/sh
# description: COAP publish in command line
# author: Thus0
# last modified: 2022-01-29 21:03

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

# Publish data with COAP plain
"${COAPS_BIN}" -v 6 -m POST \
    -M "${COAPS_RPK}" -n \
    -e "${PAYLOAD}" \
    "coaps://${COAPS_HOST}:${COAPS_PORT}${COAPS_REST}"
