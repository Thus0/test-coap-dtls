#!/bin/sh
# description: build and install BoringSSL library
#
#        author: Thus0
# last modified: 2022-02-05 09:13

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone BoringSSL repository
cd /app || exit 1
git clone --depth 1 \
	https://github.com/google/boringssl.git || exit 2

# Build and install BoringSSL library
cd /app/boringssl || exit 1
mkdir build
cd build
# to build release : add -DCMAKE_BUILD_TYPE=Release
cmake -GNinja ..
ninja

# vim: set sw=4 ts=4 et:
