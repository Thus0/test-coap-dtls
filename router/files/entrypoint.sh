#!/bin/sh
# description: container entrypoint
#
#        author: Thus0
# last modified: 2022-02-05 17:29

# NAT
echo "Setting firewall"
iptables -A FORWARD -i eth1 -j ACCEPT
iptables -A FORWARD -o eth1 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Enter loop
echo "Entering loop"
tail -f /dev/null

# vim: set sw=4 ts=4 et:
