#!/bin/sh
# description: COAPS server with californium framework
# environment variables:
#   - DTLS_SERVER (default: 192.168.11.105)
#   - DTLS_PORT   (default: 5684)
#
#        author: Thus0
# last modified: 2022-01-31 16:56

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.105
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
CALIFORNIUM_DIR="/app/californium"
COAPS_SERVER_DIR="${CALIFORNIUM_DIR}/demo-apps/cf-secure/target"
COAPS_SERVER_JAR="cf-secure-3.3.0-SNAPSHOT.jar"

# Server arguments

java -jar ${COAPS_SERVER_DIR}/${COAPS_SERVER_JAR} SecureServer RPK

