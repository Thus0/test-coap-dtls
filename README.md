# test COAPS / COAP-DTLS

* author: Thus0
* last modified: 2022-01-30 01:38

# architecture

```
 COAPS sensor  --- [operator_net] ------- router-coap (NAT) ------- [inter_net] ------- COAPS server
                    192.168.12.x        .254             .254        192.168.11.x 
```

