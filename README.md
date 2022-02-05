# test LwM2M / COAP / DTLS / UDP / IP

* author: Thus0
* last modified: 2022-01-30 21:16

# architecture

```
COAPS sensor  --- [operator_net] --- router-coap (NAT) --- [inter_net] --- COAPS server
                  192.168.12.x     .254             .254   192.168.11.x 
```

# DTLS libraries

* https://en.wikipedia.org/wiki/Datagram_Transport_Layer_Security

* [Google BoringSSL](https://github.com/google/boringssl) (go)
  * [bssl client](https://github.com/google/boringssl/blob/master/tool/client.cc)
  * [bssl server](https://github.com/google/boringssl/blob/master/tool/server.cc)
* [Eclise Scandium](https://github.com/eclipse/californium/tree/master/scandium-core) (java) - DTLS 1.2
  * _It implements DTLS 1.2 to secure your application through **ECC** with **pre-shared keys**, **certificates**, or **raw public keys**._ 
  * patch demo [sc-dtls-example-client](https://github.com/Thus0/test-coap-dtls/blob/main/californium/files/demo-apps/sc-dtls-example-client/src/main/java/org/eclipse/californium/scandium/examples/ExampleDTLSClient.java) 
  * patch demo [sc-dtls-example-server](https://github.com/Thus0/test-coap-dtls/blob/main/californium/files/demo-apps/sc-dtls-example-server/src/main/java/org/eclipse/californium/scandium/examples/ExampleDTLSServer.java) 
* [GnuTLS](https://www.gnutls.org/) (C) - DTLS 1.2
  * _"Support for public key methods, including RSA and Elliptic curves, as well as password and key authentication methods such as **SRP** and **PSK** protocols"_ 
    * [PSK](https://www.gnutls.org/manual/gnutls.html#PSK-credentials) 
    * [RPK](https://www.gnutls.org/manual/gnutls.html#Raw-public_002dkey-credentials)
    * [Certificates](https://www.gnutls.org/manual/gnutls.html#Certificate-credentials)
  * [gnutls-cli](https://gnutls.org/manual/html_node/gnutls_002dcli-Invocation.html)
  * [gnutls-serv](https://gnutls.org/manual/html_node/gnutls_002dserv-Invocation.html)
* [Mbed TLS](https://tls.mbed.org/) (C) - DLTS 1.2
  * _Mbed TLS is a C library that implements cryptographic primitives, X.509 certificate manipulation and the SSL/TLS and DTLS protocols. Its small code footprint makes it suitable for embedded systems._  
  * ticket [Connection ID](https://github.com/ARMmbed/mbedtls/pull/5061) 
  * [mbedtls_dtls_client](https://github.com/ARMmbed/mbedtls/blob/development/programs/ssl/dtls_client.c) 
  * [mbedtls_dtls_server](https://github.com/ARMmbed/mbedtls/blob/development/programs/ssl/dtls_server.c)
* [OpenSSL](https://www.openssl.org/) (C)
  * [openssl s_client -dtls1_2](https://www.openssl.org/docs/man1.1.1/man1/s_client.html)
  * [openssl s_server -dtls1_2](https://www.openssl.org/docs/man1.1.1/man1/s_server.html)
* [Pion DTLS](https://github.com/pion/dtls) (go) - DTLS 1.2
  * ticket [Connection ID](https://github.com/pion/dtls/issues/256)
  * patch demo [client/main.go](https://github.com/Thus0/test-coap-dtls/blob/main/piondtls/client/examples/dial/client/main.go)
  * patch demo [server/main.go](https://github.com/Thus0/test-coap-dtls/blob/main/piondtls/server/examples/listen/server/main.go) 
* [tinydtls](https://projects.eclipse.org/projects/iot.tinydtls) (C) - DTLS 1.2
  * _basic support for **DTLS-PSK** and **DTLS-RPK** mode with ECC_
  * [dtls-client](https://github.com/eclipse/tinydtls/blob/develop/tests/dtls-client.c)
    * TODO: patch demo  
  * [dtls-server](https://github.com/eclipse/tinydtls/blob/develop/tests/dtls-server.c)
    * TODO: patch demo 
* [wolfSSL](https://wolfssl.com) (C) - DTLS 1.2
  * [client](https://github.com/wolfSSL/wolfssl/blob/master/examples/client/client.c)
  * [server](https://github.com/wolfSSL/wolfssl/blob/master/examples/server/server.c)

# COAPS frameworks

* [aiocoap](https://github.com/chrysn/aiocoap) (python)
  * _[RFC7252](https://tools.ietf.org/html/rfc7252) (CoAP): Supported for clients and servers. Multicast is supported on the server side, and partially for clients. DTLS is supported but experimental, and lacking some security properties. No caching is done inside the library._
  * _[RFC8323](https://tools.ietf.org/html/rfc8323) (TCP, WebSockets): Supports CoAP over TCP, TLS, and WebSockets (both over HTTP and HTTPS). The TLS parts are server-certificate only; preshared, raw public keys and client certificates are not supported yet._ 
  * _[RFC8613](https://tools.ietf.org/html/rfc8613) (OSCORE): Full support client-side; protected servers can be implemented based on it but are not automatic yet._
  * _[draft-ietf-core-oscore-groupcomm-11](https://tools.ietf.org/html/draft-ietf-core-oscore-groupcomm-11) (Group OSCORE): Supported for both group and pairwise mode in groups that are fully known. (The lack of an implemented joining or persistence mechanism makes this impractical for anything but experimentation.)_
* [Eclipse Californium](https://www.eclipse.org/californium/) (java)
  * demo [cf-secure](https://github.com/eclipse/californium/tree/master/demo-apps/cf-secure) 
* [coap-cli.js](https://github.com/avency/coap-cli) (javascript)
* [libcoap](https://libcoap.net/) (C)
  * _The library is designed to support transport layer security utilizing frameworks such as **GnuTLS**, **OpenSSL**, **Mbed TLS**, or **tinydtls**._ 

# COAPS proxies and gateways

* [emqx-coap](https://github.com/emqx/emqx-coap) (Erlang)
* [FreeCoAP](https://github.com/keith-cullen/FreeCoAP) (C)
  * _HTTP/CoAP proxy with DTLS support_
  * _**DTLS-CERT** for CoAP implemented using **GnuTLS** with X.509 certificates (RFC 7252)_
  * _**DTLS-RPK** for CoAP implemented using **tinydtls** with raw public key (RFC 7252)_

# LWm2M frameworks

* [Eclipse Wakaama](https://github.com/eclipse/wakaama/) (C)
  * [lwm2mclient_tinydtls](https://github.com/eclipse/wakaama/tree/master/examples/client)
    * **DTLS-PSK** implemented using **tinydtls**

# Serveur LwM2M

* [Eclipse leshan](https://www.eclipse.org/leshan/) 
  * demo/test [leshan](https://leshan.eclipseprojects.io/)

# Serveur/Broker COAP

* [Thingsboard](https://thingsboard.io/)
  * [CoAP over DTLS](https://thingsboard.io/docs/user-guide/coap-over-dtls/)
