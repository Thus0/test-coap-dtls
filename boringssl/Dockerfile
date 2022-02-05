FROM alpine:latest as base
LABEL maintainer="Thus0"

# STAGE1 : build base image
RUN apk update && apk upgrade && \
    apk add vim openssl openssl-dev && \
    apk add gnutls gnutls-utils && \
    apk add autoconf automake make cmake ninja && \
    apk add gcc libc-dev libtool git && \
    apk add perl samurai go g++ linux-headers

# Change working directory
WORKDIR /app

# Copy files
COPY files /app

# Build and install BoringSSL library
RUN ./build-boringssl.sh

# STAGE2 : build client image
FROM base as client
COPY client /app/client
# PATCH dtls_client
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server
COPY server /app/server/
CMD ["/app/server/entrypoint.sh"]

# vim: set ts=4 ts=4 et:
