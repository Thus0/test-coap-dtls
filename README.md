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

* [axTLS](http://axtls.sourceforge.net/)
* [BearSSL](https://github.com/nogoegst/bearssl)
  * _BearSSL is for now considered alpha-level software. This means that it probably still has some bugs, possibly very serious ones [...]_
* [CycloneSSL](https://oryx-embedded.com/doc/files.html)
* [Google BoringSSL](https://github.com/google/boringssl) (go)
  * [bssl client](https://github.com/google/boringssl/blob/master/tool/client.cc)
  * [bssl server](https://github.com/google/boringssl/blob/master/tool/server.cc)
* [Eclise Scandium](https://github.com/eclipse/californium/tree/master/scandium-core) (java) - DTLS 1.2
  * _It implements DTLS 1.2 to secure your application through **ECC** with **pre-shared keys**, **certificates**, or **raw public keys**._ 
  * ticket [Connection ID](https://github.com/eclipse/californium/issues/961)
  * patch demo [sc-dtls-example-client](https://github.com/Thus0/test-coap-dtls/blob/main/californium/files/demo-apps/sc-dtls-example-client/src/main/java/org/eclipse/californium/scandium/examples/ExampleDTLSClient.java) 
  * patch demo [sc-dtls-example-server](https://github.com/Thus0/test-coap-dtls/blob/main/californium/files/demo-apps/sc-dtls-example-server/src/main/java/org/eclipse/californium/scandium/examples/ExampleDTLSServer.java) 
* [GnuTLS](https://www.gnutls.org/) (C) - DTLS 1.2
  * _"Support for public key methods, including RSA and Elliptic curves, as well as password and key authentication methods such as **SRP** and **PSK** protocols"_ 
    * [PSK](https://www.gnutls.org/manual/gnutls.html#PSK-credentials) 
    * [RPK](https://www.gnutls.org/manual/gnutls.html#Raw-public_002dkey-credentials)
    * [Certificates](https://www.gnutls.org/manual/gnutls.html#Certificate-credentials)
  * [gnutls-cli](https://gnutls.org/manual/html_node/gnutls_002dcli-Invocation.html)
  * [gnutls-serv](https://gnutls.org/manual/html_node/gnutls_002dserv-Invocation.html)
* [MatrixSSL](https://github.com/matrixssl/matrixssl) - TLS1.3
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
  * branche [tinydtls - Connection ID](https://github.com/eclipse/tinydtls/tree/feature/connection_id)
  * [dtls-client](https://github.com/eclipse/tinydtls/blob/develop/tests/dtls-client.c)
    * TODO: patch demo  
  * [dtls-server](https://github.com/eclipse/tinydtls/blob/develop/tests/dtls-server.c)
    * TODO: patch demo 
* [wolfSSL](https://wolfssl.com) (C) - DTLS 1.2 - TLS 1.3
  * _The wolfSSL embedded TLS library is a lightweight, portable, C-language-based SSL/TLS library targeted at IoT, embedded, and RTOS environments primarily because of its size, speed, and feature set. It works seamlessly in desktop, enterprise, and cloud environments as well. wolfSSL supports industry standards up to the current **TLS 1.3** and **DTLS 1.2**_
  * [client](https://github.com/wolfSSL/wolfssl/blob/master/examples/client/client.c)
  * [server](https://github.com/wolfSSL/wolfssl/blob/master/examples/server/server.c)

# COAPS frameworks

* [aiocoap](https://github.com/chrysn/aiocoap) (python)
  * _[RFC7252](https://tools.ietf.org/html/rfc7252) (CoAP): Supported for clients and servers. Multicast is supported on the server side, and partially for clients. DTLS is supported but experimental, and lacking some security properties. No caching is done inside the library._
  * _RFC7641 (Observe): Basic support for clients and servers. Reordering, re-registration, and active cancellation are missing._
  * _RFC7959 (Blockwise): Supported both for atomic and random access._
  * _RFC7967 (No-Response): Supported._
  * _RFC8132 (PATCH/FETCH): Types and codes known, FETCH observation supported._
  * _[RFC8323](https://tools.ietf.org/html/rfc8323) (TCP, WebSockets): Supports CoAP over TCP, TLS, and WebSockets (both over HTTP and HTTPS). The TLS parts are server-certificate only; preshared, raw public keys and client certificates are not supported yet._ 
  * _[RFC8613](https://tools.ietf.org/html/rfc8613) (OSCORE): Full support client-side; protected servers can be implemented based on it but are not automatic yet._
  * _draft-ietf-core-resource-directory: A standalone resource directory server is provided along with a library function to register at one. They lack support for groups and security considerations, and are generally rather simplistic._
  * _[draft-ietf-core-oscore-groupcomm-11](https://tools.ietf.org/html/draft-ietf-core-oscore-groupcomm-11) (Group OSCORE): Supported for both group and pairwise mode in groups that are fully known. (The lack of an implemented joining or persistence mechanism makes this impractical for anything but experimentation.)_
* [Eclipse Californium](https://www.eclipse.org/californium/) (java)
  * demo [cf-secure](https://github.com/eclipse/californium/tree/master/demo-apps/cf-secure) 
* [coap-cli.js](https://github.com/avency/coap-cli) (javascript)
* [libcoap](https://libcoap.net/) (C)
  * _[RFC7252](https://tools.ietf.org/html/rfc7252): The Constrained Application Protocol (CoAP)_ 
  * _RFC7641: Observing Resources in the Constrained Application Protocol (CoAP)_
  * _RFC7959: Block-Wise Transfers in the Constrained Application Protocol (CoAP)_
  * _RFC7967: Constrained Application Protocol (CoAP) Option for No Server Response_
  * _RFC8132: PATCH and FETCH Methods for the Constrained Application Protocol (CoAP)_
  * _[RFC8323](https://tools.ietf.org/html/rfc8323): CoAP (Constrained Application Protocol) over TCP, TLS, and WebSockets [No WebSockets support]_ 
  * _RFC8768: Constrained Application Protocol (CoAP) Hop-Limit Option_
  * _The library is designed to support transport layer security utilizing frameworks such as **GnuTLS**, **OpenSSL**, **Mbed TLS**, or **tinydtls**._ 
    * **OpenSSL** (Minimum version 1.1.0) : **DTLS-CERT**, **DTLS-PSK** and PKCS11
    * **GnuTLS** (Minimum version 3.3.0) : **DTLS-CERT**, **DTLS-PSK**, **DTLS-RPK** (3.6.6+) and PKCS11
    * **Mbed TLS** (Minimum version 2.7.10) : **DTLS-CERT** and **DTLS-PSK**
    * **TinyDTLS** : **DTLS-PSK** and **DTLS-RPK** (DTLS Only)

# COAPS proxies and gateways

* [emqx-coap](https://github.com/emqx/emqx-coap) (Erlang)
* [FreeCoAP](https://github.com/keith-cullen/FreeCoAP) (C)
  * _HTTP/CoAP proxy with DTLS support_
  * _**DTLS-CERT** for CoAP implemented using **GnuTLS** with X.509 certificates (RFC 7252)_
  * _**DTLS-RPK** for CoAP implemented using **tinydtls** with raw public key (RFC 7252)_

# LWM2M frameworks
* [AVSystem Anjay](https://github.com/AVSystem/Anjay) (C)
  * _LwM2M Security modes_:
    * **DTLS-CERT** (if supported by backend TLS library)
    * **DTLS-PSK** (if supported by backend TLS library)
    * **NoSec mode**
  * _Supported TLS backends_:
    * **OpenSSL** (Minimum 1.1.+)
    * **Mbed TLS** (Minimum 2.0+)
    * **tinydtls** (Minimum 0.9+)
* [Eclipse Wakaama](https://github.com/eclipse/wakaama/) (C)
  * [lwm2mclient_tinydtls](https://github.com/eclipse/wakaama/tree/master/examples/client)
    * **DTLS-PSK** implemented using **tinydtls**

# Serveur LwM2M

* [Eclipse leshan](https://www.eclipse.org/leshan/) 
  * demo/test [leshan](https://leshan.eclipseprojects.io/)

# Serveur/Broker COAP

* [Thingsboard](https://thingsboard.io/)
  * [CoAP over DTLS](https://thingsboard.io/docs/user-guide/coap-over-dtls/)
