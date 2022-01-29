#!/bin/sh
# vim: set sw=4 expandtab:
#   description:
#        author: Thus0
# last modified: 2022-01-29 23:12
#
# Copyright 2022 All rights reserved

PREFIX=/usr/local

# Clone libcoap repository
cd /app
git clone https://github.com/eclipse/californium.git

# Create PREFIX directory
mkdir ${PREFIX}

# Build californium
cd californium
mvn clean install -DskipTests
