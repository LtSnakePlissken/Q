# Updating Q-Client & Docker Images

In case of severe updates of the Q-Client, you will be required to update the validator files and configs. 
To do so, within directory `/validator` (for validator), `/rootnode` (for rootnode) or `/fullnode` (for fullnode), 
use the following commands.

## Check your docker-compose.yaml
If you set up your node on the early stages your config can be outdated. To keep it up-to-date without 
pulling new releases of the mainnet-public-tools check your **docker-compose.yaml** file and modify it if necessary:

- remove **node-init** service
- remove **"--network=35441"** flag (don't forget to remove comma after it also)
  ![Screenshot](img/node-init.png)

## Update Q-client image

- **Change the docker image directly in your **.env** file:**
```
...
QCLIENT_IMAGE=qblockchain/q-client:1.2.3
...
```

- **Pull (and overwrite) the latest docker image**
```shell
$ docker-compose pull
```

- **Restart with new configs & images**
```shell
$ docker-compose up -d
```

Now your validator node should restart and synchronise with the mainnet again.

## How to be sure that your node is Athos-ready.

Even if your node is up-to-date, there are chances that your node's database isn't properly updated. To ensure, you need to follow the steps:

- **Restart your node**
```shell
$ docker-compose restart
```

- **Check your node database config for the fork blocks**
```shell
$ docker-compose logs |grep "Athos: 5075000"
```
If there is an output with the line
```
{ChainID: 35441 Homestead: 0 DAO: <nil> DAOSupport: false EIP150: 0 EIP155: 0 EIP158: 0 Byzantium: 0 Constantinople: 0 Petersburg: 0 Istanbul: 0, Muir Glacier: <nil>, Berlin: 5075000, London: <nil>, Engine: clique, Athos: 5075000}
```
your database is up-to-date.
Presence of entries _"Berlin: 5075000"_ and _"Athos: 5075000"_ means that your geth database is updated according to the Athos hardfork requirements
