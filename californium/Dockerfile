FROM alpine:latest as base
LABEL maintainer="Thus0"

# STAGE1 : build californium
RUN apk update && apk upgrade && \
    apk add vim tcpdump tshark && \
    apk add openssl openssl-dev && \
    apk add mbedtls mbedtls-utils mbedtls-dev && \
    apk add gnutls gnutls-utils gnutls-dev && \
    apk add autoconf automake make asciidoc && \
    apk add gcc libc-dev libtool git && \
    apk add maven

# Change working directory
WORKDIR /app

# Build californium
COPY files/build-californium.sh /app/build-californium.sh
RUN ./build-californium.sh

# STAGE2 : build client image
FROM base as client
COPY client /app/client/
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server
COPY server /app/server/
CMD ["/app/server/entrypoint.sh"]

