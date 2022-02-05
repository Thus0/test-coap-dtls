#!/bin/sh
# description: build and install tinydtls (develop branch) library
#
#        author: Thus0
# last modified: 2022-02-05 09:14

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

# vim: set sw=4 ts=4 et:
