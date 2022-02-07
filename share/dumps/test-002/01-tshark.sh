#!/bin/sh
# description:
#
#        author: Thus0
# last modified: 2022-02-07 22:02

TEST=${PWD##*/}
DATETIME=$(date +"%Y-%m-%d-%Hh%M")

SECURITY=dtls-psk
LIBRARY=californium

tshark --color \
    -f "udp and port 5684" \
    -F pcapng \
    -w /app/dumps/${TEST}/${TEST}-tshark-coap-${SECURITY}-${LIBRARY}-${DATETIME}.pcapng

# vim: set sw=4 ts=4 et:
