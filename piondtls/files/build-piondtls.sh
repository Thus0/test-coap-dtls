#!/bin/sh
# description: build and install Pion DTLS library
#
#        author: Thus0
# last modified: 2022-01-30 22:56

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone Pion DTLS repository
cd /app || exit 1
git clone --depth 1 https://github.com/pion/dtls.git piondtls

