# How to setup a Q fullnode

## Setup your server

You must prepare your server / machine to begin. One possibility is to use a local machine, alternatively you can use a cloud instance on AWS for example. There is a good external tutorial on how to get started with Ethereum on AWS. You can use this [tutorial](https://medium.com/@pilankar.akshay3/how-to-setup-a-ethereum-poa-private-proof-of-authority-ethereum-network-network-on-amazon-aws-5fdf56d2ad93) as a basic reference.

## Get basic configuration

Clone this [repository](https://gitlab.com/q-dev/mainnet-public-tools/) and go to the fullnode directory. This directory contains the docker-compose file for quick launching of the full node with preconfigurations on rpc, blockchain explorer, .env file for ports configuration and genesis.json.

## Configure ports

Choose ports (or leave default values) for node rpc api and blockchain explorer by editing the .env file.

`EXT_PORT=<rpc port>`  
`EXPLORER_PORT=<blockchain explorer port>`

## Launch node

Launch the node by executing the following command from fullnode directory:

`docker-compose up -d`

## Verify your installation

After node is launched, it starts syncing with network. You can track the progress using blockchain explorer at `http://localhost:EXPLORER_PORT` (default: http://localhost:8080)

Note: Check our nodes real-time logs with the following command:

`docker-compose logs -f --tail "100"`
