#!/bin/sh
# description: build and install mbedtls library
#
#        author: Thus0
# last modified: 2022-01-30 14:23

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone mbedtls repository
cd /app || exit 1
git clone --depth 1 https://github.com/wolfSSL/wolfssl.git

# Build and install wolfssl library and demos
cd /app/wolfssl || exit 1
./autogen.sh
./configure
make
make install

