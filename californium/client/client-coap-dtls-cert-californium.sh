#!/bin/sh
# description: COAPS client with californium framework
# environment variables:
#   - COAPS_HOST  (default: 192.168.11.105)
#   - COAPS_PORT  (default: 5684)
#
#        author: Thus0
# last modified: 2022-02-06 00:23

# Exit on first error
set -e

# Default environment variables
[ -z ${COAPS_HOST} ] && COAPS_HOST=192.168.11.105
[ -z ${COAPS_PORT} ] && COAPS_PORT=5684

# Configuration
CALIFORNIUM_DIR="/app/californium"
COAPS_CLIENT_DIR="${CALIFORNIUM_DIR}/demo-apps/cf-secure/target"
COAPS_CLIENT_JAR="cf-secure-3.3.0-SNAPSHOT.jar"

# Client arguments

# COAP client (DTLS-CERT)
java -jar ${COAPS_CLIENT_DIR}/${COAPS_CLIENT_JAR} \
    SecureClient X509

# vim: set sw=4 ts=4 et:
