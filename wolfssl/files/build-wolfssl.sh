#!/bin/sh
# description: build and install wolfSSL library
#
#        author: Thus0
# last modified: 2022-02-05 09:18

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone wolfSSL repository
cd /app || exit 1
git clone --depth 1 \
	https://github.com/wolfSSL/wolfssl.git || exit 2

# Build and install wolfSSL library
cd /app/wolfssl || exit 1
./autogen.sh
./configure --enable-all
make
make install

# Clone wolfSSL examples repository
cd /app || exit 1
git clone --depth 1 \
	https://github.com/wolfSSL/wolfssl-examples.git || exit 2

# vim: sw=4 ts=4 et:
