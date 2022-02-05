#!/bin/sh
# description: DTLS server with gnutls library
# environment variables:
#   - COAPS_PORT        (default: 5684)
#   - RAW_PRIVATE_KEY  (default: ssl/server-key.pem)
#   - RAW_PUBLIC_KEY   (default: ssl/server-pub.pem)
#
#        author: Thus0
# last modified: 2022-02-05 23:52

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684
[ -z ${RAW_PRIVATE_KEY} ] && RAW_PRIVATE_KEY=ssl/server-key.pem
[ -z ${RAW_PUBLIC_KEY} ] && RAW_PUBLIC_KEY=ssl/server-pub.pem

# DTLS server (DTLS-RPK)
gnutls-serv \
    --debug=8 \
    --echo \
    --udp \
    --disable-client-cert \
    --rawpkkeyfile=${(RAW_PRIVATE_KEY} \
    --rawpkfile=${RAW_PUBLIC_KEY} \
    --priority=SECURE256:+VERS-DTLS1.2:+AES-128-CCM-8:+MAC-ALL:+SIGN-ECDSA-SHA256:+CTYPE-RAWPK \
    --port=${COAPS_PORT}

# vim: set sw=4 ts=4 et:
