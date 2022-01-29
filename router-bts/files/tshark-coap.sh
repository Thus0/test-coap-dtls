#!/bin/sh
# https://www.wireshark.org/docs/dfref/c/coap.html

COAP_HOST=192.168.11.101
COAP_PORT=5683

#tshark -f "udp and port 5683 and dst host 192.168.11.101" -V
#tshark -f "udp and port ${COAP_PORT} and dst host ${COAP_HOST}"
#tshark -f "udp and port 5683 and dst host 192.168.11.101" -T fields -e data -e coap.
tshark -f "udp and port ${COAP_PORT}" -F pcapng -w dumps/coap.pcapng
