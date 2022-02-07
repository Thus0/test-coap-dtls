#!/bin/sh
# description:
#
#        author: Thus0
# last modified: 2022-02-07 21:46

TEST=${PWD##*/}
DATETIME=$(date +"%Y-%m-%d-%Hh%M")

SECURITY=dtls-psk
LIBRARY=californium

/app/client/client-coap-${SECURITY}-${LIBRARY}.sh 2>&1 > \
    /app/dumps/${TEST}/${TEST}-client-coap-${SECURITY}-${LIBRARY}-${DATETIME}.log

# vim: set sw=4 ts=4 et:
