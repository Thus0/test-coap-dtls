#!/bin/sh
# description: build and install libcoap with :
#   - tinydtls
#   - gnutls
#   - openssl support
#
#        author: Thus0
# last modified: 2022-02-06 00:40

# Exit on undefined variable and first error
set -u
#set -e 

# Configuration
PREFIX=/usr/local

# Create PREFIX directory
mkdir -p "${PREFIX}"

# Clone libcoap repository
cd /app || exit 1
git clone --depth 1 \
    https://github.com/obgm/libcoap.git || exit 2

# Git pull tinydtls
cd /app/libcoap || exit 1
git submodule init
git submodule update

# Run autogen
./autogen.sh

# Build tinydtls
cd /app/libcoap/ext/tinydtls || exit 1
./configure --prefix="${PREFIX}"
make
make install

# Build libcoap with tinydtls
cd /app/libcoap || exit 1
./configure --enable-examples --enable-dtls --with-tinydtls --enable-shared --disable-manpages --disable-doxygen --prefix="${PREFIX}"
make
make install

# Build libcoap with gnutls
./configure --enable-examples --enable-dtls --with-gnutls --enable-shared --disable-manpages --disable-doxygen --prefix="${PREFIX}"
make
make install

# Build libcoap with openssl
./configure --enable-examples --enable-dtls --with-openssl --enable-shared --disable-manpages --disable-doxygen --prefix="${PREFIX}"
make
make install

# vim: set sw=4 ts=4 et:
