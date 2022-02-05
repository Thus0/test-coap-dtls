#!/bin/sh
# description: build and install FreeCoAP
#
#        author: Thus0
# last modified: 2022-02-05 09:15

# Exit on undefined variable and first error
set -u
set -e

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone FreeCoAP (tinydtls branch) repository
cd /app || exit 1
git clone -b tinydtls --single-branch --depth 1 \
	https://github.com/keith-cullen/FreeCoAP.git freecoap-tinydtls || exit 2

# Patch files
cp /app/configure.ac /app/freecoap-tinydtls/configure.ac
cp /app/Makefile.am /app/freecoap-tinydtls/Makefile.am
cp /app/lib/Makefile.am /app/freecoap-tinydtls/lib/Makefile.am

# FIXME: Dirty hack so tinydtls headers are found
mv /usr/local/include/tinydtls/* /usr/local/include

# Build and install FreeCoAP
cd /app/freecoap-tinydtls || exit 1
autoreconf --install
./configure
make
make install

# vim: set sw=4 ts=4 et:
