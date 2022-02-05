#!/bin/sh
# description: DTLS client with californium framework
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.105)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-06 00:26

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.105
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
CALIFORNIUM_DIR="/app/californium"
DTLS_CLIENT_DIR="${CALIFORNIUM_DIR}/demo-apps/sc-dtls-example-client/target"
DTLS_CLIENT_JAR="sc-dtls-example-client-3.3.0-SNAPSHOT.jar"

# Client arguments
CLIENTS=1
MESSAGES=1
LENGTH=1

# COAP client (DTLS-RPK)
java -jar "${DTLS_CLIENT_DIR}/${DTLS_CLIENT_JAR}" \
   ${CLIENTS} ${MESSAGES} ${LENGTH}
   ${COAPS_HOST} ${COAPS_PORT}

# vim: set sw=4 ts=4 et:
