FROM alpine:latest as base
LABEL maintainer="Thus0"

# STAGE1 : build base image
RUN apk update && apk upgrade && \
    apk add vim openssl openssl-dev && \
    apk add gnutls gnutls-utils && \
    apk add autoconf automake make && \
    apk add gcc libc-dev libtool git 

# Change working directory
WORKDIR /app

# Copy files
COPY files /app


# STAGE2 : build client image
FROM base as client-develop
# Build and install tinydtls library
RUN ./build-tinydtls-develop.sh
COPY client /app/client
# PATCH dtls_client
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build client image
FROM base as client-connection_id
# Build and install tinydtls library
RUN ./build-tinydtls-connection_id.sh
COPY client /app/client
# PATCH dtls_client
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server-develop
# Build and install tinydtls library
RUN ./build-tinydtls-develop.sh
COPY server /app/server/
CMD ["/app/server/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server-connection_id
# Build and install tinydtls library
RUN ./build-tinydtls-connection_id.sh
COPY server /app/server/
CMD ["/app/server/entrypoint.sh"]

# vim: set sw=4 ts=4 et:
