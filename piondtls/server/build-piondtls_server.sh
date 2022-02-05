#!/bin/sh
# description: build and install Pion DTLS server
#
#        author: Thus0
# last modified: 2022-02-05 17:27

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Test if piondtls exist
cd /app/piondtls || exit 1

# Copy local source files
cp -r /app/server/examples/ /app/piondtls/
rm -rf /app/server/examples

# Build and install Pion DTLS server
go build -o /usr/local/bin/piondtls_server /app/piondtls/examples/listen/server/main.go

# vim: set sw=4 ts=4 et:
