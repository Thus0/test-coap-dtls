#!/bin/sh
# vim: set sw=4 expandtab:
#        author: Thus0
# last modified: 2022-01-29 17:06
#
# Copyright 2022 All rights reserved

DTLS_SERVER=192.168.11.104
DTLS_PORT=5684
# https://gnutls.org/manual/html_node/Encryption-algorithms-used-in-the-record-layer.html#tab_003aciphers
CIPHERS="+AES-128-CCM-8:+AES-256-CCM-8"
MAC="+MAC-SHA256:+MAC-SHA384"
KEY_EXCHANGE="+ECDHE-ECDSA"
COMPRESSION="+COMP-NULL:+COMP-DEFLATE"
TLS_VERSION="+VERS-DTLS1.2"
SIGNATURE_ALGO="+SIGN-ECDSA-SHA256:+SIGN-ECDSA-SHA384"
GROUPS="+GROUP-SECP256R1:+GROUP-SEC384R1:+GROUP-SECP521R1"
CERTIFICATE_TYPES="+CTYPE-RAWPK:+CTYPE-CLI-RAWPK"

gnutls-cli \
    --debug=8 \
    --tofu \
    --udp \
    --rawpkkeyfile=ssl/client2.key \
    --rawpkfile=ssl/client2.pub \
    --priority=SECURE256:+VERS-DTLS1.2:+AES-128-CCM:+MAC-SHA256:+SIGN-ECDSA-SHA256:+ECDHE-ECDSA:+CTYPE-RAWPK \
    --port=${DTLS_PORT} ${DTLS_SERVER}
