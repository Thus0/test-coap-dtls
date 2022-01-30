#!/bin/sh
# description: build and install BoringSSL library
#
#        author: Thus0
# last modified: 2022-01-30 20:13

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone BoringSSL repository
cd /app || exit 1
git clone --depth 1 https://github.com/google/boringssl.git

# Build and install BoringSSL library
cd /app/boringssl || exit 1
mkdir build
cd build
cmake -GNinja ..
ninja
