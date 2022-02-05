FROM alpine:latest as base
LABEL maintainer="Thus0"

# STAGE1 : build base image
RUN apk update && apk upgrade && \
    apk add vim openssl openssl-dev && \
    apk add gnutls gnutls-utils gnutls-dev && \
    apk add autoconf automake make && \
    apk add cmake samurai && \
    apk add gcc g++ libc-dev libtool git && \
    apk add zlib zlib-dev && \
    apk add python3 python3-dev py3-pip py3-jinja2 && \
    apk add mbedtls-dev mbedtls

# Change working directory
WORKDIR /app

# Copy files
COPY files /app

# Build Anjay with DTLS libraries
#RUN ./build-mbedtls.sh
#RUN ./build-tinydtls.sh
RUN ./build-anjay.sh

# STAGE2 : build client image
FROM base as client
COPY client /app/client/
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server
COPY server /app/server/
CMD ["/app/server/entrypoint.sh"]

# vim: set sw=4 ts=4 et:
