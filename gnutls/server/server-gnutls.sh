#!/bin/sh
# description: DTLS server with gnutls library
# environment variables:
#   - DTLS_PORT (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 13:04

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# DTLS server
gnutls-serv \
    --debug=8 \
    --echo \
    --udp \
    --port=${DTLS_PORT} \
    --rawpkkeyfile=ssl/server.key \
    --rawpkfile=ssl/server.pub \
    --priority=NONE:+VERS-DTLS1.2:+ECDHE-AES-128-CCM-8:+MAC-ALL:+SIGN-ECDSA-SHA256:+GROUP-SECP256R1:+CTYPE-RAWPK \

# vim: set sw=4 expandtab:
