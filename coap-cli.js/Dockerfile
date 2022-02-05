FROM alpine:latest
LABEL maintainer="Thus0"

# STAGE1 : build base image
RUN apk update && apk upgrade && \
    apk add vim openssl openssl-dev && \
    apk add mbedtls mbedtls-utils mbedtls-dev && \
    apk add gnutls gnutls-utils gnutls-dev && \
    apk add autoconf automake make asciidoc && \
    apk add gcc libc-dev libtool git && \
    apk add npm

# Change working dirctory
WORKDIR /app

# Copy files
COPY files /app

# Build coap-cli.js 
RUN npm install

# default command
CMD ["/app/entrypoint.sh"]

# vim: set sw=4 ts=4 et:
