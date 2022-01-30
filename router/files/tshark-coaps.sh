#!/bin/sh
# https://www.wireshark.org/docs/dfref/c/coap.html

COAPS_HOST=192.168.11.101
COAPS_PORT=5684

#tshark -V -f "udp and port ${COAPS_PORT}  and dst host ${COAPS_HOST}"
#tshark -f "udp and port ${COAPS_PORT} and dst host ${COAPS_HOST}"
#tshark -f "udp and port ${COAPS_PORT} and dst host ${COAPS_HOST}" -T fields -e data -e coap.
# tshark -T json -j "coaps udp ip" -x 

tshark --color -f "udp and port ${COAPS_PORT}" -F pcapng -w dumps/coaps.pcapng
