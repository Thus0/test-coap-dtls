#!/bin/sh
#        author: Thus0
# last modified: 2022-02-05 08:39

# Change default gateway
ip route del default
ip route add default via ${GATEWAY}

# loop
echo "Entering loop"
tail -f /dev/null

# vim: set sw=4 ts=4 et:
