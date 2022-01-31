# test COAPS / COAP-DTLS

* author: Thus0
* last modified: 2022-01-30 21:16

# architecture

```
 COAPS sensor  --- [operator_net] ------- router-coap (NAT) ------- [inter_net] ------- COAPS server
                    192.168.12.x        .254             .254        192.168.11.x 
```

# DTLS libraries

* [Google BoringSSL](https://github.com/google/boringssl) (go)
* [Eclipse Californium](https://www.eclipse.org/californium/) (java)
* [GnuTLS](https://www.gnutls.org/) (C)
* [Mbed TLS](https://tls.mbed.org/) (C)
* [OpenSSL](https://www.openssl.org/) (C)
* [Pion DTLS](https://github.com/pion/dtls) (go)
* [tinydtls](https://projects.eclipse.org/projects/iot.tinydtls) (C)
* [wolfSSL](https://wolfssl.com) (C)

# COAPS frameworks

* [aiocoap](https://github.com/chrysn/aiocoap) (python)
* [coap-cli.js](https://github.com/avency/coap-cli) (javascript)
* [libcoap](https://libcoap.net/) (C)

# COAPS proxies and gateways

* [emqx-coap](https://github.com/emqx/emqx-coap) (Erlang)
* [FreeCoAP](https://github.com/keith-cullen/FreeCoAP) (C)
  * HTTP/CoAP proxy with DTLS support
  * DTLS-cert for CoAP implemented using GnuTLS with X.509 certificates (RFC 7252)
  * DTLS-rpk for CoAP implemented using tinydtls with raw public key(RFC 7252)

