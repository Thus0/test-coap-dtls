#!/bin/sh
# description: LWM2M client with wakaama library
# environment variables:
#   - CLIENT_LIFETIME  (default: 300)
#   - DTLS_PORT        (default: 5684)
#   - DTLS_SERVER      (default: 192.168.11.115)
#   - ENDPOINT_NAME    (default: Wakaama_Client)
#   - PSK_IDENTITY     (default: Client_Identity) 
#   - PSK_KEY          (default: 123456789) 
#
#        author: Thus0
# last modified: 2022-02-05 09:47

# Exit on first error
set -e

# Default environment variables
[ -z ${CLIENT_LIFETIME} ] && CLIENT_LIFETIME=300
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.115
[ -z ${ENDPOINT_NAME} ] && ENDPOINT_NAME=wakaama_client
[ -z ${PSK_IDENTITY} ] && PSK_IDENTITY=Client_Identity
[ -z ${PSK_KEY} ] && PSK_KEY=123456789

# Configuration
CLIENT_BIN=/app/client/build/lwm2mclient_tinydtls

# LWM2M client using tinydtls (psk)
${CLIENT_BIN} \
    -n ${ENDPOINT_NAME} \
    -4 \
    -t ${LIFETIME}  \
    -i ${PSK_IDENTITY} -k ${PSK_KEY} \
    -h ${DTLS_SERVER} -p ${DTLS_PORT}

# vim: set sw=4 ts=4 et:
