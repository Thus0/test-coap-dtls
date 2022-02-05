FROM alpine:latest as base
LABEL maintainer="Thus0"

# STAGE1 : build base image
RUN apk update && apk upgrade && \
    apk add vim openssl openssl-dev && \
    apk add autoconf automake make asciidoc && \
    apk add gcc libc-dev libtool git && \
    apk add libcoap && \
    apk add python3 python3-dev py3-pip py3-psutil 

# Change working directory
WORKDIR /app

# Copy files
COPY files /app

# Build and install aiocoap
RUN pip install -r requirements.txt

# STAGE2 : build client image
FROM base as client
COPY client /app/client/
CMD ["/app/client/entrypoint.sh"]

# STAGE2 : build server image
FROM base as server
COPY server /app/server/
CMD ["/app/server/entrypoint.sh"]

# vim: set sw=4 ts=4 et:
