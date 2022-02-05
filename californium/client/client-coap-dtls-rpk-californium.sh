#!/bin/sh
# description: COAPS client with californium framework
# environment variables:
#   - DTLS_PORT   (default: 5684)
#   - DTLS_SERVER (default: 192.168.11.105)
#
#        author: Thus0
# last modified: 2022-02-05 17:05

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.105

# Configuration
CALIFORNIUM_DIR="/app/californium"
COAPS_CLIENT_DIR="${CALIFORNIUM_DIR}/demo-apps/cf-secure/target"
COAPS_CLIENT_JAR="cf-secure-3.3.0-SNAPSHOT.jar"

# COAP client (DTLS-RPK)
java -jar ${COAPS_CLIENT_DIR}/${COAPS_CLIENT_JAR} \
    SecureClient RPK

# vim: set sw=4 ts=4 et:
