# How to Setup Sentry Node


The sentry node setup is a way to secure your validator node by hiding it behind a set of so-called sentry fullnodes. The validator node is located in a private network and will only have contact with the sentry nodes. This tutorial is a brief description of how to achieve this.

1. Create machines for N sentry nodes and 1 validator node
2. Create private network for senty nodes' machines and validator's machine (e.g. you can use WireGuard and easy-wg-quick to quick setup)
3. Setup firewall on validator node to accept connections only from sentry nodes' machines (e.g. https://aws.amazon.com/network-firewall)
4. Setup sentry node(s):

  - Adapt `docker-compose.yaml`:

```yaml
version: "3"

services:
  sentrynode:
    image: $QCLIENT_IMAGE
    entrypoint: [
       "geth",
       "--datadir=/data",
       "--bootnodes=$BOOTNODE_URI",
       "--port=$EXT_PORT",
       "--syncmode=full",
       "--verbosity=3",
       "--miner.gasprice=50000000000",
       "--txpool.pricelimit=47619047619",  
       "--http.addr=0.0.0.0",
       "--http.corsdomain=*",  
       "--http.api=net,web3,eth,debug,gov"
     ]
     volumes:
       - ./additional:/data/additional
       - sentrynode-data:/data
     ports:
       - $EXT_PORT:$EXT_PORT/tcp
       - $EXT_PORT:$EXT_PORT/udp
     restart: unless-stopped

volumes:
  sentrynode-data:
```
  - Adapt `.env`:

```text
QCLIENT_IMAGE=qblockchain/q-client:1.2.3
BOOTNODE_URI=enode://$BOOTNODE_ENODE_PUBLIC_KEY@$BOOTNODE_IP:30301
EXT_PORT=30303
```

5. Run node
```bash
$ docker-compose up -d
```

6. Get admin.nodeInfo.enode from nodes' JS console and copy enode URI
```bash
$ docker-compose exec sentrynode geth attach data/geth.ipc

$ admin.nodeInfo.enode
```

7. Setup validator node:

  - Adapt `docker-compose.yaml`:

```yaml
version: "3"

services:
  validator-node:
    image: $QCLIENT_IMAGE
    entrypoint: [
      "geth",
      "--datadir=/data",
      "--bootnodes=$SENTRY",
      "--syncmode=full",
      "--verbosity=3",
      "--miner.gasprice=50000000000",
      "--txpool.pricelimit=47619047619",  
      "--mine",
      "--unlock=$VALIDATOR_ADDRESS",
      "--password=/data/passwd.txt",
      "--nodiscover",
      "--netrestrict $MASK"
    ]
    volumes:
      - ./keystore:/data/keystore
      - ./additional:/data/additional
      - validator-node-data:/data
    restart: unless-stopped

      
volumes:
  validator-node-data:
```

  - Adapt `.env`:

```text
QCLIENT_IMAGE=qblockchain/q-client:1.2.3
VALIDATOR_ADDRESS=0000000000000000000000000000000000000000
SENTRY=uri1,uri2,uri3
MASK=10.xxx.xxx.0/24
```

10.xxx.xxx.0/24 is the network mask of your private network (note: it can be not only in 10.0.0.0 range).

8. Add sentries' uris to `/data/geth/static-nodes.json`
```json
[
    "uri1",
    "uri2",
    "uri3",
    ...
]
```

uri1,uri2,uri3 are the enode uris of your sentry nodes. Please provide all uris because peer discovery discovery is disabled!

9. Start validator
```bash
$ docker-compose up -d
```

10. Wait for sync and check mining is working

Notice: if ping is huge your blocks can don't reach to blockchain
