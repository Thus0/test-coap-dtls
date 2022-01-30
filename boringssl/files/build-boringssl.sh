#!/bin/sh
# description: build and install boringssl library
#
#        author: Thus0
# last modified: 2022-01-30 17:14

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone boringssl repository
cd /app || exit 1
git clone --depth 1 https://github.com/google/boringssl.git

# Build and install boringssl library and demos
cd /app/boringssl || exit 1
mkdir build
cd build
cmake -GNinja ..
ninja
