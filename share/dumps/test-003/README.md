# Library

* client : californium
* server : californium

# Configuration

* modification /app/client/Californium3SecureClient.properties

```
DTLS.PRESELECTED_CIPHER_SUITES=TLS_ECDHE_PSK_WITH_AES_128_GCM_SHA256
DTLS.RECOMMENDED_CIPHER_SUITES_ONLY=true
DTLS.CONNECTION_ID_LENGTH=8
```

* modification /app/server/Californium3SecureServer.properties

```
DTLS.CONNECTION_ID_LENGTH=8
```
