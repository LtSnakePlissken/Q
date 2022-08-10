# Unlocking Address on Node

This brief tutorial demonstrates how to manually unlock your account by password prompt upon node start.

## Variables in Example

| **Variable Name** | **Description** |
|:--|:--|
| ubuntu | username on your server |
| example.com | hostname or ip address of your server |
| miner/ | path to the specific node content (e.g. /path_to/validator/) |
| keystorefile | encrypted file containing the private key required for unlocking |

## Manual

First, deploy `keystorefile` to server (can be skipped if node is run locally).

```text
$ scp ./keystorefile ubuntu@example.com:miner/keystore/
```

Then connect to your server by ssh and change to node directory

```text
$ ssh ubuntu@example.com
$ cd miner
```

Then manually enter the password for decryption of your keystore (where `0x123abc...f` is the address from keystore file you deployed)

```text
$ docker-compose exec node geth attach --datadir /data --exec personal.unlockAccount('0x123abc...f')
```

## Using of ready Script

```text
./reset-passwd.sh -d example.com -r miner -l ./keystorefile
```
