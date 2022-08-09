# How to setup a Q Fullnode

## Setup your Server

You must prepare your server / machine to begin. One possibility is to use a local machine, alternatively you can use a cloud instance on AWS for example. There is a good external tutorial on how to get started with Ethereum on AWS. You can use this [tutorial](https://medium.com/@pilankar.akshay3/how-to-setup-a-ethereum-poa-private-proof-of-authority-ethereum-network-network-on-amazon-aws-5fdf56d2ad93) as a basic reference.

## Get basic Configuration

Clone the repository

```text
$ git clone https://gitlab.com/q-dev/mainnet-public-tools
```

and go to the `/fullnode` directory

```text
$ cd mainnet-public-tools/fullnode
```

This directory contains the docker-compose file for quick launching of the full node with preconfigurations on rpc, blockchain explorer, `.env` file for ports configuration and `genesis.json` that contains the genesis block config of Q Mainnet.

## Configure Ports

Copy the file `.env.example` to `.env` and configure to your needs.

```text
$ cp .env.example .env
```

Choose ports (or leave default values) for node rpc api and blockchain explorer by editing the `.env` file.

```text
EXT_PORT=<rpc port>
EXPLORER_PORT=<blockchain explorer port>
```

## Launch Node

Launch the node by executing the following command from `/fullnode` directory:

```text
$ docker-compose up -d
```

## Verify your Installation

After node is launched, it starts syncing with network.

The setup includes a local blockchain explorer. You can browse blocks, transactions and accounts via your browser by opening the url `http://localhost:PORT`
where `PORT` is the number you chose above for EXPLORER_PORT, e.g. `http://localhost:8080`

You can check your nodes real-time logs with the following command:

```text
$ docker-compose logs -f --tail "100"
```

## Find additional peers

In case your client can't connect with the default configuration, we recommend that you add an additional flag referring to one of our additional peers (`$BOOTNODE1_ADDR`, `$BOOTNODE2_ADDR`or `$BOOTNODE3_ADDR`) within `docker-compose.yaml` file:

```text
fullnode:
  image: $QCLIENT_IMAGE
  entrypoint: ["geth", "--bootnodes=$BOOTNODE_ADDR", "--datadir=/data", ...]
```
