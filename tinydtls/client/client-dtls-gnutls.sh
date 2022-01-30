#!/bin/sh
# description: DTLS client with gnutls library
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.107)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-30 13:05

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.110
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# https://gnutls.org/manual/html_node/Encryption-algorithms-used-in-the-record-layer.html#tab_003aciphers
CIPHERS="+AES-128-CCM-8:+AES-256-CCM-8"
MAC="+MAC-SHA256:+MAC-SHA384"
KEY_EXCHANGE="+ECDHE-ECDSA"
COMPRESSION="+COMP-NULL:+COMP-DEFLATE"
TLS_VERSION="+VERS-DTLS1.2"
SIGNATURE_ALGO="+SIGN-ECDSA-SHA256:+SIGN-ECDSA-SHA384"
GROUPS="+GROUP-SECP256R1:+GROUP-SEC384R1:+GROUP-SECP521R1"
CERTIFICATE_TYPES="+CTYPE-RAWPK:+CTYPE-CLI-RAWPK"

# DTLS client
gnutls-cli \
    --debug=8 \
    --no-tofu --no-strict-tofu \
    --no-dane --no-local-dns \
    --no-ca-verification --no-ocsp \
    --udp \
    --rawpkkeyfile=ssl/client.key \
    --rawpkfile=ssl/client.pub \
    --priority=SECURE256:+VERS-DTLS1.2:+AES-128-CCM:+MAC-SHA256:+SIGN-ECDSA-SHA256:+ECDHE-ECDSA:+CTYPE-RAWPK \
    --port=${DTLS_PORT} \
    --disable-sni \
    --logfile=/app/dumps/client-dtls-gnutls.log \
    ${DTLS_SERVER}

# vim: set sw=4 expandtab:
