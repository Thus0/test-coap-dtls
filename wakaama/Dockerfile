FROM alpine:latest as base
LABEL maintainer="Thus0"

# STAGE1 : build base image
RUN apk update && apk upgrade && \
    apk add vim openssl openssl-dev && \
    apk add gnutls gnutls-utils && \
    apk add autoconf automake make && \
    apk add cmake samurai && \
    apk add gcc libc-dev libtool git 

# Change working directory
WORKDIR /app

# Copy files
COPY files /app

# Patch source
FROM base as client
RUN ./build-wakaama.sh
COPY client /app/client
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server
RUN ./build-wakaama.sh
COPY server /app/server/
CMD ["/app/server/entrypoint.sh"]

# vim: set sw=4 ts=4 et:
