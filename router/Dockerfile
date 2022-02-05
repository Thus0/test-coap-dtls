FROM alpine:latest
LABEL maintainer="Thus0"

RUN apk update && apk upgrade && \
    apk add vim iproute2 iptables tcpdump tshark && \
    apk add git gcc make libc-dev 

RUN apk add openssl openssl-dev mbedtls-utils mbedtls-dev && \
    apk add python3 python3-dev py3-pip && \
    pip install wheel

# Copy files
COPY files app/

# Install python modules
RUN pip install -r /app/requirements.txt

# Build DIT
# https://github.com/CountablyInfinite/dit
WORKDIR /app
RUN git clone https://github.com/Thus0/dit.git && \
    pip install -r /app/dit/requirements.txt

# Default command
WORKDIR /app
CMD ["/app/entrypoint.sh"]

# vim: set sw=4 ts=4 et:
