FROM alpine:latest as base
LABEL maintainer="Thus0"

# STAGE1 : build base image
RUN apk update && apk upgrade && \
    apk add vim openssl openssl-dev && \
    apk add gnutls gnutls-utils gnutls-dev && \
    apk add autoconf automake make && \
    apk add gcc libc-dev libtool git

# Change working directory
WORKDIR /app

# Copy files
COPY files /app

# STAGE2 : build client image
FROM base as client
COPY client /app/client/
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server
COPY server /app/server/
CMD ["/app/server/entrypoint.sh"]
