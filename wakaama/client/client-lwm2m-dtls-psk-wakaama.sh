#!/bin/sh
# description: LWM2M client with wakaama library
# environment variables:
#   - CLIENT_LIFETIME      (default: 300)
#   - COAPS_HOST           (default: 192.168.11.115)
#   - COAPS_PORT           (default: 5684)
#   - ENDPOINT_NAME        (default: Wakaama_Client)
#   - PSK_CLIENT_IDENTITY  (default: Client_Identity) 
#   - PSK_KEY              (default: 123456789) 
#
#        author: Thus0
# last modified: 2022-02-06 00:03

# Exit on first error
set -e

# Default environment variables
[ -z ${CLIENT_LIFETIME} ] && CLIENT_LIFETIME=300
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.115
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684
[ -z ${ENDPOINT_NAME} ] && ENDPOINT_NAME=wakaama_client
[ -z ${PSK_CLIENT_IDENTITY} ] && PSK_CLIENT_IDENTITY=Client_Identity
[ -z ${PSK_KEY} ] && PSK_KEY=123456789

# Configuration
CLIENT_BIN=/app/client/build/lwm2mclient_tinydtls

# LWM2M client using tinydtls (psk)
${CLIENT_BIN} \
    -n ${ENDPOINT_NAME} \
    -4 \
    -t ${LIFETIME}  \
    -i ${PSK_IDENTITY} \
    -k ${PSK_KEY} \
    -h ${COAPS_HOST} \
    -p ${COAPS_PORT}

# vim: set sw=4 ts=4 et:
