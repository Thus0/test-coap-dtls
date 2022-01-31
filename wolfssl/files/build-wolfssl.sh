#!/bin/sh
# description: build and install wolfSSL library
#
#        author: Thus0
# last modified: 2022-01-31 20:26

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone wolfSSL repository
cd /app || exit 1
git clone --depth 1 https://github.com/wolfSSL/wolfssl.git

# Build and install wolfSSL library
cd /app/wolfssl || exit 1
./autogen.sh
./configure --enable-all
make
make install

# Clone wolfSSL examples repository
cd /app || exit 1
git clone --depth 1 https://github.com/wolfSSL/wolfssl-examples.git


