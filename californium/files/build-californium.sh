#!/bin/sh
#   description: build and install californium framework
#
#        author: Thus0
# Modified: 2022-01-29 23:12

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
    https://github.com/eclipse/californium.git || exit 2

# Copy local files
cp -r /app/demo-apps /app/californium/
rm -rf /app/demo-apps

# Build californium
cd /app/californium || exit 1
mvn clean install -DskipTests

# vim: set sw=4 ts=4 et:
