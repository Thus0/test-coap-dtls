#!/bin/sh
# vim: set sw=4 expandtab:
#        author: Thus0
# last modified: 2022-01-29 18:22
#
# Copyright 2021 All rights reserved

DTLS_SERVER=192.168.11.104
DTLS_PORT=5684

gnutls-serv \
    --debug=8 \
    --echo \
    --udp \
    --port=${DTLS_PORT} \
    --rawpkkeyfile=ssl/server.key \
    --rawpkfile=ssl/server.pub \
    --priority=NONE:+VERS-DTLS1.2:+ECDHE-AES-128-CCM-8:+MAC-ALL:+SIGN-ECDSA-SHA256:+GROUP-SECP256R1:+CTYPE-RAWPK \
