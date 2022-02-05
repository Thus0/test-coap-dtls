#!/bin/sh
# description: build and install anjay with :
#   - mbedtls
#   - openssl
#   - tinydtls
#
#        author: Thus0
# last modified: 2022-02-05 22:30

# Exit on undefined variable and first error
set -u
set -e 

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone libcoap repository
cd /app || exit 1
git clone --depth 1 \
    https://github.com/AVSystem/Anjay.git anjay || exit 2

# Git pull tinydtls
cd /app/anjay || exit 1
git submodule update --init

# Build anjay with mbedtls
mkdir /app/build-mbedtls
cd /app/build-mbedtls || exit 1
cmake -DDTLS_BACKEND="mbedtls" /app/anjay
make -j

# Build anjay with tinydtls
#mkdir /app/build-tinydtls
#cd /app/build-tinydtls || exit 1
#cmake -DDTLS_BACKEND="tinydtls" /app/anjay
#make -j

# Build anjay with openssl
#mkdir /app/build-openssl
#cd /app/build-openssl || exit 1
#cmake -DDTLS_BACKEND="openssl" /app/anjay
#make -j

# vim: set sw=4 ts=4 et:
