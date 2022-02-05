#!/bin/sh
# description: build and install wakaama client or server demo
#
#        author: Thus0
# last modified: 2022-02-05 09:19

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone tinydtls repository
cd /app || exit 1
git clone --depth 1 --recurse-submodules \
	https://github.com/eclipse/wakaama.git || exit 2

# Build and install wakaama client demo
if [ -d /app/client ]; then
    mkdir -p /app/client/build
    cd /app/client/build || exit 1
    cmake /app/wakaama/examples/client
    make
fi

# Build and install wakaama server demo
if [ -d /app/server ]; then
    mkdir -p /app/server/build
    cd /app/server/build || exit 1
    cmake /app/wakaama/examples/server
    make
fi

# vim: set sw=4 ts=4 et:
