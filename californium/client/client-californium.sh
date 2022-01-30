#!/bin/sh
# description: DTLS client with californium framework
# environment variables:
#   - DTLS_SERVER
#   - DTLS_PORT
#
#        author: Thus0
# last modified: 2022-01-30 12:14

# Exit on first error
set -e

# Default environment variables
[ -z ${DTLS_SERVER} ] && DTLS_SERVER=192.168.11.105
[ -z ${DTLS_PORT} ] && DTLS_PORT=5684

# Configuration
CALIFORNIUM_DIR="/app/californium"
DTLS_CLIENT_DIR="${CALIFORNIUM_DIR}/demo-apps/sc-dtls-example-client/target"
DTLS_CLIENT_JAR="sc-dtls-example-client-3.3.0-SNAPSHOT.jar"

# Client arguments
CLIENTS=1
MESSAGES=1
LENGTH=1

java -jar "${DTLS_CLIENT_DIR}/${DTLS_CLIENT_JAR}" ${CLIENTS} ${MESSAGES} ${LENGTH} ${DTLS_SERVER} ${DTLS_PORT}

