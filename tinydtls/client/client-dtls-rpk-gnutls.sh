#!/bin/sh
# description: DTLS-RPK client with gnutls library
# environment variables:
#   - COAPS_HOST       (default: 192.168.11.107)
#   - COAPS_PORT       (default: 5684)
#   - RAW_PRIVATE_KEY  (default: ssl/client-key.pem)
#   - RAW_PUBLIC_KEY   (default: ssl/client-pub.pem)
#
#        author: Thus0
# last modified: 2022-02-06 00:06

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.110
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684
[ -z ${RAW_PRIVATE_KEY} ] && RAW_PRIVATE_KEY=ssl/client-key.pem
[ -z ${RAW_PUBLIC_KEY} ] && RAW_PUBLIC_KEY=ssl/client-pub.pem

# https://gnutls.org/manual/html_node/Encryption-algorithms-used-in-the-record-layer.html#tab_003aciphers
CIPHERS="+AES-128-CCM-8:+AES-256-CCM-8"
MAC="+MAC-SHA256:+MAC-SHA384"
KEY_EXCHANGE="+ECDHE-ECDSA"
COMPRESSION="+COMP-NULL:+COMP-DEFLATE"
TLS_VERSION="+VERS-DTLS1.2"
SIGNATURE_ALGO="+SIGN-ECDSA-SHA256:+SIGN-ECDSA-SHA384"
GROUPS="+GROUP-SECP256R1:+GROUP-SEC384R1:+GROUP-SECP521R1"
CERTIFICATE_TYPES="+CTYPE-RAWPK:+CTYPE-CLI-RAWPK"

# DTLS 1.2 client (DTLS-RPK)
gnutls-cli \
    --debug=8 \
    --no-tofu --no-strict-tofu \
    --no-dane --no-local-dns \
    --no-ca-verification --no-ocsp \
    --udp \
    --rawpkkeyfile=${RAW_PRIVATE_KEY} \
    --rawpkfile=${RAW_PUBLIC_KEY} \
    --priority=SECURE256:+VERS-DTLS1.2:+AES-128-CCM:+MAC-SHA256:+SIGN-ECDSA-SHA256:+ECDHE-ECDSA:+CTYPE-RAWPK \
    --port=${COAPS_PORT} \
    --disable-sni \
    ${COAPS_HOST}

# vim: set sw=4 ts=4 et:
