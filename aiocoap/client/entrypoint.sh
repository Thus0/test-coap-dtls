#!/bin/sh
# vim: set sw=4 expandtab:
#        author: Thus0
# last modified: 2022-01-29 22:56
#
# Copyright 2022 All rights reserved

# Change default gateway
ip route del default
ip route add default via ${GATEWAY}

# loop
tail -f /dev/null
