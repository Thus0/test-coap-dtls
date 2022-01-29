#!/bin/sh
# vim: set sw=4 expandtab:
#   description:
#        author: Thus0
# last modified: 2022-01-29 16:43
#
# Copyright 2022 All rights reserved

PREFIX=/usr/local

# Clone libcoap repository
cd /app
git clone https://github.com/obgm/libcoap.git

# Create PREFIX directory
mkdir ${PREFIX}

# Update tinydtls
cd /app/libcoap
git submodule init
git submodule update

# Run autogen
./autogen.sh

# Build tinydtls
cd ext/tinydtls
./configure --prefix=${PREFIX}
make
make install

# Build libcoap with tinydtls
cd /app/libcoap
./configure --enable-examples --enable-dtls --with-tinydtls --enable-shared --enable-manpages --disable-doxygen --prefix=${PREFIX}
make
make install

# Build libcoap with gnutls
./configure --enable-examples --enable-dtls --with-gnutls --enable-shared --enable-manpages --disable-doxygen --prefix=${PREFIX}
make
make install

# Build libcoap with openssl
./configure --enable-examples --enable-dtls --with-openssl --enable-shared --enable-manpages --disable-doxygen --prefix=${PREFIX}
make
make install

