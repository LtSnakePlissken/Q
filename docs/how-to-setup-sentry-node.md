# How to Setup Sentry Node

1. Create machines for N sentry nodes and 1 validator node
2. Create private network for senty nodes' machines and validator's machine(e.g. you can use WireGuard and easy-wg-quick to quick setup)
3. Setup firewall on validator node to accept connections only from sentry nodes' machines(e.g. https://aws.amazon.com/network-firewall)
4. Install Sentry nodes:

  - docker-compose.yaml:
```
    services:
      node:
        image: $QCLIENT_IMAGE
        entrypoint: [ "geth",
            "--datadir=/data",
            '--bootnodes=$BOOTNODE_URI',
            "--port=$EXT_PORT",
            "--syncmode=full",
            "--verbosity=3",
            '--networkid=35441',
            '--miner.gasprice=50000000000',
            '--txpool.pricelimit=47619047619',  
            '--http.addr=0.0.0.0',
            '--http.corsdomain=*',  
            '--http.api=net,web3,eth,debug,gov'
            ]
        volumes:
          - ./data:/data
```

  - .env:

```
QCLIENT_IMAGE=qblockchain/q-client
BOOTNODE_URI=enode://$BOOTNODE_ENODE_PUBLIC_KEY@$BOOTNODE_IP:30301
EXT_PORT=30303
```

5. Run node
`docker-compose up -d`

6. Get admin.nodeInfo.enode from nodes' JS console and copy enode URI

7. install Validator node
  - docker-compose.yaml:
```
services:
  node:
    image: $QCLIENT_IMAGE
    entrypoint: [ "geth",
        "--datadir=/data",
        '--bootnodes=$SENTRY',
        "--syncmode=full",
        "--verbosity=3",
         '--networkid=35441',
        '--miner.gasprice=50000000000',
        '--txpool.pricelimit=47619047619',  
        '--mine',
        '--unlock=$VALIDATOR_ADDRESS',
        '--password=/data/passwd.txt',
        '--nodiscover',
        '--netrestrict $MASK'
        ]
    volumes:
      - ./data:/data

```

  - .env:
```
QCLIENT_IMAGE=qblockchain/q-client
SENTRY=uri1,uri2,uri3
MASK=10.xxx.xxx.0/24
```
10.xxx.xxx.0/24 - it's mask of your private network(notice it can be not only in 10.0.0.0 range)
uri1,uri2,uri3 -- enode uris of Sentry nodes; Provide all uri because, discovering is disabled!!!
9. add sentrys' uris to /data/geth/static-peers.json
```
[
    "uri1",
    "uri2",
    "uri3",
    ...
]
```
9. Start validator
  docker-compose up -d

10. Wait for sync and check mining is working
  Notice: if ping is huge your blocks can don't reach to blockchain
