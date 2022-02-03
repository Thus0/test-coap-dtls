# test LwM2M / COAP / DTLS / UDP / IP

* author: Thus0
* last modified: 2022-01-30 21:16

# architecture

```
COAPS sensor  --- [operator_net] --- router-coap (NAT) --- [inter_net] --- COAPS server
                  192.168.12.x     .254             .254   192.168.11.x 
```

# DTLS libraries

* [Google BoringSSL](https://github.com/google/boringssl) (go)
  * [bssl client](https://github.com/google/boringssl/blob/master/tool/client.cc)
  * [bssl server](https://github.com/google/boringssl/blob/master/tool/server.cc)
* [Eclipse Californium](https://www.eclipse.org/californium/) (java)
  * patch demo [sc-dtls-example-client](https://github.com/Thus0/test-coap-dtls/blob/main/californium/files/demo-apps/sc-dtls-example-client/src/main/java/org/eclipse/californium/scandium/examples/ExampleDTLSClient.java) 
  * patch demo [sc-dtls-example-server](https://github.com/Thus0/test-coap-dtls/blob/main/californium/files/demo-apps/sc-dtls-example-server/src/main/java/org/eclipse/californium/scandium/examples/ExampleDTLSServer.java) 
* [GnuTLS](https://www.gnutls.org/) (C)
  * [gnutls-cli](https://gnutls.org/manual/html_node/gnutls_002dcli-Invocation.html)
  * [gnutls-serv](https://gnutls.org/manual/html_node/gnutls_002dserv-Invocation.html)
* [Mbed TLS](https://tls.mbed.org/) (C)
  * [mbedtls_dtls_client](https://github.com/ARMmbed/mbedtls/blob/development/programs/ssl/dtls_client.c) 
  * [mbedtls_dtls_server](https://github.com/ARMmbed/mbedtls/blob/development/programs/ssl/dtls_server.c)
* [OpenSSL](https://www.openssl.org/) (C)
  * [openssl s_client -dtls1_2](https://www.openssl.org/docs/man1.1.1/man1/s_client.html)
  * [openssl s_server -dtls1_2](https://www.openssl.org/docs/man1.1.1/man1/s_server.html)
* [Pion DTLS](https://github.com/pion/dtls) (go)
  * patch demo [client/main.go](https://github.com/Thus0/test-coap-dtls/blob/main/piondtls/client/examples/dial/client/main.go)
  * patch demo [server/main.go](https://github.com/Thus0/test-coap-dtls/blob/main/piondtls/server/examples/listen/server/main.go) 
* [tinydtls](https://projects.eclipse.org/projects/iot.tinydtls) (C)
  * TODO: patch demo [dtls-client](https://github.com/eclipse/tinydtls/blob/develop/tests/dtls-client.c)
  * TODO: patch demo [dtls-server](https://github.com/eclipse/tinydtls/blob/develop/tests/dtls-server.c)
* [wolfSSL](https://wolfssl.com) (C)
  * [client](https://github.com/wolfSSL/wolfssl/blob/master/examples/client/client.c)
  * [server](https://github.com/wolfSSL/wolfssl/blob/master/examples/server/server.c)

# COAPS frameworks

* [aiocoap](https://github.com/chrysn/aiocoap) (python)
* [Eclipse Californium](https://www.eclipse.org/californium/) (java)
  * demo [cf-secure](https://github.com/eclipse/californium/tree/master/demo-apps/cf-secure) 
* [coap-cli.js](https://github.com/avency/coap-cli) (javascript)
* [libcoap](https://libcoap.net/) (C)

# COAPS proxies and gateways

* [emqx-coap](https://github.com/emqx/emqx-coap) (Erlang)
* [FreeCoAP](https://github.com/keith-cullen/FreeCoAP) (C)
  * HTTP/CoAP proxy with DTLS support
  * DTLS-cert for CoAP implemented using GnuTLS with X.509 certificates (RFC 7252)
  * DTLS-rpk for CoAP implemented using tinydtls with raw public key(RFC 7252)

# LWm2M frameworks

* [Eclipse Wakaama](http://www.eclipse.org/wakaama/)

# Serveur LwM2M

* [Eclipse leshan](https://www.eclipse.org/leshan/) 
  * demo/test [leshan](https://leshan.eclipseprojects.io/)

# Serveur/Broker COAP

* [Thingsboard](https://thingsboard.io/)
  * [CoAP over DTLS](https://thingsboard.io/docs/user-guide/coap-over-dtls/)
