#!/bin/sh
# description: build and install tinydtls (develop branch) library
#
#        author: Thus0
# last modified: 2022-02-05 19:53

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone tinydtls repository
cd /app || exit 1
git clone -b develop --single-branch --depth 1 \
	https://github.com/eclipse/tinydtls.git tinydtls-develop || exit 2

# Build and install tinydtls library and demos
cd /app/tinydtls-develop || exit 1
./autogen.sh
./configure
make
make install

# Patch tinydtls path
sed -i -e 's|#include "tinydtls.h"|#include "tinydtls/tinydtls.h"|' /usr/local/include/tinydtls/sha2/sha2.h

# vim: set sw=4 ts=4 et:
