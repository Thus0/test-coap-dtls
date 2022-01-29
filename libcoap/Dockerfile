FROM alpine:latest as base
LABEL maintainer="Thus0"

# STAGE1 : build libcoap
RUN apk update && apk upgrade && \
    apk add vim tcpdump tshark && \
    apk add openssl openssl-dev && \
    apk add mbedtls mbedtls-utils mbedtls-dev && \
    apk add gnutls gnutls-utils gnutls-dev && \
    apk add autoconf automake make gcc libc-dev libtool && \
    apk add git asciidoc

# build libcoap
COPY files/build-libcoap.sh /app/build-libcoap.sh
WORKDIR /app
RUN ./build-libcoap.sh

# STAGE2 : build client image
FROM base as client
COPY client /app/client/
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server
COPY server /app/server/
CMD ["/app/server/entrypoint.sh"]
