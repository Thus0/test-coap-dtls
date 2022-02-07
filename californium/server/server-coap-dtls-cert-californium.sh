#!/bin/sh
# description: COAPS server with californium framework (DTLS-CERT)
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.105)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-07 19:49

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.106
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
CALIFORNIUM_DIR="/app/californium"
COAPS_SERVER_DIR="${CALIFORNIUM_DIR}/demo-apps/cf-secure/target"
COAPS_SERVER_JAR="cf-secure-3.3.0-SNAPSHOT.jar"

# COAP server (DTLS-CERT)
java -jar ${COAPS_SERVER_DIR}/${COAPS_SERVER_JAR} \
    SecureServer X509

# vim: set sw=4 ts=4 et:
