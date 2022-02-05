#!/bin/sh
# description: build and install mbedtls library
#
#        author: Thus0
# last modified: 2022-02-05 22:30

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone mbedtls repository
cd /app || exit 1
git clone --depth 1 \
	https://github.com/ARMmbed/mbedtls.git || exit 2

# Patch files (IP address and DTLS port)
cp /app/dtls_client.c /app/mbedtls/programs/ssl/dtls_client.c
cp /app/dtls_server.c /app/mbedtls/programs/ssl/dtls_server.c

# Build and install mbedtls library and demos
cd /app/mbedtls || exit 1
make
make install

# vim: set sw=4 ts=4 et:
