#!/bin/sh
# description: build and install FreeCoAP
#
#        author: Thus0
# last modified: 2022-02-05 19:52

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

# Build and install FreeCoAP
cd /app/freecoap-tinydtls || exit 1
sed -i -e 's|#include "tinydtls.h"|#include "tinydtls/tinydtls.h"|' lib/include/coap_client.h
sed -i -e 's|#include "tinydtls.h"|#include "tinydtls/tinydtls.h"|' lib/include/coap_server.h
sed -i -e 's|#include "dtls.h"|#include "tinydtls/dtls.h"|' lib/include/coap_client.h
sed -i -e 's|#include "dtls.h"|#include "tinydtls/dtls.h"|' lib/include/coap_server.h
sed -i -e 's|#include "dtls_debug.h"|#include "tinydtls/dtls_debug.h"|' lib/src/coap_client.c
sed -i -e 's|#include "dtls_debug.h"|#include "tinydtls/dtls_debug.h"|' lib/src/coap_server.c
autoreconf --install
./configure
make
make install

# vim: set sw=4 ts=4 et:
