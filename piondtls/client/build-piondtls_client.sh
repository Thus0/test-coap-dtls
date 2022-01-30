#!/bin/sh
# description: build and install Pion DTLS client
#
#        author: Thus0
# last modified: 2022-01-30 22:47

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Test if piondtls exist
cd /app/piondtls || exit 1

# Copy local source files
cp -r /app/client/examples/ /app/piondtls/
rm -rf /app/client/examples

# Build and install Pion DTLS client
go build -o /usr/local/bin/piondtls_client /app/piondtls/examples/dial/client/main.go

