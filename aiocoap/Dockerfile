FROM alpine:latest
LABEL maintainer="Thus0"

RUN apk update && apk upgrade && \
    apk add vim tcpdump tshark openssl openssl-dev mbedtls mbedtls-utils mbedtls-dev gnutls gnutls-utils gnutls-dev && \
    apk add autoconf automake make gcc libc-dev libtool git asciidoc

RUN apk add libcoap && \
    apk add python3 python3-dev py3-pip py3-psutil 

COPY files /app
WORKDIR /app

# python COAP implementation (requirements.txt)
RUN pip install -r requirements.txt

# default command
CMD ["/app/entrypoint.sh"]
