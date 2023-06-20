# Account operations

## How to import your account by private key

An example of how to retrieve your private key from your wallet can be
found [here](https://support.metamask.io/hc/en-us/articles/360015289632-How-to-export-an-account-s-private-key).
Then in the node folder you need to connect to the geth console and import account as in example is given below:

Attach to the geth console.

```
docker-compose exec node geth attach data/geth.ipc
```

In the console type

```
personal.importRawKey('YOUR_PRIVATE_KEY','PASSWORD_TO_UNLOCK')
```

Exit console and then restart container with

```
docker-compose restart
```

Keep in mind that you need to use the same password to unlock your account as you used to import it.

## How to locate your keystore

If you unlocked the account without using the new key generation method, its private key is stored in json format inside
the container, in order to find it you need to connect directly to the container again and run the command shown below:

```
docker-compose exec rootnode geth account list
```

An example of what the response to the command looks like and how to correctly save this key to the keystore folder is
shown below:

```
# example
{YourAccount} keystore:///root/.ethereum/keystore/Creation-Date--Your-Account

#to save key from container you should get your docker service id

docker ps

(CONTAINER ID   IMAGE                                                                           COMMAND                  CREATED       STATUS                          PORTS                                                                                                                                                                               NAMES
92b12f674eb4   qblockchain/q-client:1.3.0   "/bin/sh -c 'mix do …"   4 days ago    Up 4 days                       0.0.0.0:8080->4000/tcp, :::8080->4000/tcp, 0.0.0.0:8081->4001/tcp, :::8081->4001/tcp)

docker cp 92b12f674eb4:/root/.ethereum/keystore/Creation-Date--Your-Account ./
```