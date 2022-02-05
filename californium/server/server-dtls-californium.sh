#!/bin/sh
# description: DTLS server with californium framework
#
#        author: Thus0
# last modified: 2022-02-05 17:08

# Exit on first error
set -e

# Configuration
CALIFORNIUM_DIR="/app/californium"
DTLS_SERVER_DIR="${CALIFORNIUM_DIR}/demo-apps/sc-dtls-example-server/target"
DTLS_SERVER_JAR="sc-dtls-example-server-3.3.0-SNAPSHOT.jar"

# DTLS server
java -jar "${DTLS_SERVER_DIR}/${DTLS_SERVER_JAR}"

# vim: set sw=4 ts=4 et:
