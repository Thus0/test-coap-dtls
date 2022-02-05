#!/bin/sh
# description: COAPS server with californium framework
# environment variables:
#   - DTLS_PORT   (default: 5684)
#   - DTLS_SERVER (default: 192.168.11.105)
#
#        author: Thus0
# last modified: 2022-02-05 17:08

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.105

# Configuration
CALIFORNIUM_DIR="/app/californium"
COAPS_SERVER_DIR="${CALIFORNIUM_DIR}/demo-apps/cf-secure/target"
COAPS_SERVER_JAR="cf-secure-3.3.0-SNAPSHOT.jar"

# COAP server (DTLS-RPK)
java -jar ${COAPS_SERVER_DIR}/${COAPS_SERVER_JAR} \
    SecureServer RPK

# vim: set sw=4 ts=4 et:
