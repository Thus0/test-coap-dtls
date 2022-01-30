FROM alpine:latest as base
LABEL maintainer="Thus0"

# STAGE1 : build base image
RUN apk update && apk upgrade && \
    apk add vim openssl openssl-dev && \
    apk add gnutls gnutls-utils && \
    apk add autoconf automake make cmake ninja && \
    apk add gcc libc-dev libtool git && \
    apk add go

# Change working directory
WORKDIR /app

# Copy files
COPY files /app

# Build and install Pion DTLS library
RUN ./build-piondtls.sh

# STAGE2 : build client image
FROM base as client
COPY client /app/client
RUN /app/client/build-piondtls_client.sh
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server
COPY server /app/server
RUN /app/server/build-piondtls_server.sh
CMD ["/app/server/entrypoint.sh"]

