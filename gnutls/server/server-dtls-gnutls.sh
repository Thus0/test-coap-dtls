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
    --disable-client-cert \
    --rawpkkeyfile=ssl/server.key \
    --rawpkfile=ssl/server.pub \
    --priority=SECURE256:+VERS-DTLS1.2:+AES-128-CCM-8:+MAC-ALL:+SIGN-ECDSA-SHA256:+CTYPE-RAWPK \
    --port=${DTLS_PORT}

# vim: set sw=4 expandtab:
