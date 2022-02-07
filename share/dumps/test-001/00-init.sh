#!/bin/sh

docker compose up -d router-coap
docker compose up -d server-californium
docker compose up -d client-californium

# vim: set sw=4 ts=4 et:
