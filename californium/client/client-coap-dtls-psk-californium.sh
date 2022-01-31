#!/bin/sh
# description: COAPS client with californium framework
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.105)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-31 17:38

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.105
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
CALIFORNIUM_DIR="/app/californium"
COAPS_CLIENT_DIR="${CALIFORNIUM_DIR}/demo-apps/cf-secure/target"
COAPS_CLIENT_JAR="cf-secure-3.3.0-SNAPSHOT.jar"

# Client arguments

java -jar ${COAPS_CLIENT_DIR}/${COAPS_CLIENT_JAR} SecureClient ECDHE_PSK

