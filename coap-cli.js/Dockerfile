FROM alpine:latest
LABEL maintainer="Thus0"

RUN apk update && apk upgrade && \
    apk add vim tcpdump tshark openssl openssl-dev mbedtls mbedtls-utils mbedtls-dev gnutls gnutls-utils gnutls-dev && \
    apk add autoconf automake make gcc libc-dev libtool git asciidoc

RUN apk add npm

COPY files /app

# npm COAP implementation
WORKDIR /app
RUN npm install

# default command
CMD ["/app/entrypoint.sh"]
