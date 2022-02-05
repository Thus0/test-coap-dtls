#!/bin/sh
# description: DTLS Intercept Tool
# 
#        author: Thus0
# last modified: 2022-02-05 17:30

# DIT
cd /app/dit || exit 1
./dit.py -o /app/dumps/ecc.log -ibl start

# vim: set sw=4 ts=4 et:
