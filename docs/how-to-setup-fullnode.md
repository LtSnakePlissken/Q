# How to setup a Q Fullnode

## Setup your Server

You must prepare your server / machine to begin. One possibility is to use a local machine, alternatively you can use a cloud instance on AWS for example. There is a good external tutorial on how to get started with Ethereum on AWS. You can use this [tutorial](https://medium.com/@pilankar.akshay3/how-to-setup-a-ethereum-poa-private-proof-of-authority-ethereum-network-network-on-amazon-aws-5fdf56d2ad93) as a basic reference.

## Get basic Configuration

Clone the repository

Linux, macOS, other Unix-like systems:

```bash
$ git clone https://gitlab.com/q-dev/mainnet-public-tools
```

Windows (if you don't have git installed):

```
# Download the contents of the Git repository
Invoke-WebRequest -Uri https://gitlab.com/q-dev/mainnet-public-tools/-/archive/master/mainnet-public-tools-master.zip -OutFile mainnet-public-tools-master.zip

# Extract the contents of the ZIP file
Expand-Archive -Path mainnet-public-tools-master.zip -DestinationPath .

# Remove the ZIP file
Remove-Item -Path mainnet-public-tools-master.zip
```


and go to the `/fullnode` directory

Linux, macOS, other Unix-like systems:

```bash
$ cd mainnet-public-tools/fullnode
```

Windows:

```
Set-Location -Path "mainnet-public-tools\mainnet-fullnode"
```


This directory contains the `docker-compose.yaml` file for quick launching of the full node with preconfigurations on rpc, blockchain explorer using `.env` file (which can be created from `.env.example` file).
## Configure Ports

Copy the file `.env.example` to `.env` and configure to your needs.

Linux, macOS, other Unix-like systems:

```bash
$ cp .env.example .env
$ nano .env
```
Windows:

```
# This will copy the .env.example file to a new file named .env.
Copy-Item -Path ".\env.example" -Destination ".\env"

#This will open the .env file in Notepad for editing. If you prefer to use a different text editor, replace notepad.exe with the appropriate command for your editor.
notepad.exe .\env
`



Choose ports (or leave default values) for node rpc api and blockchain explorer by editing the `.env` file.

```text
EXT_PORT=<rpc port>
EXPLORER_PORT=<blockchain explorer port>
```

## Launch Node

Launch the node by executing the following command from `/fullnode` directory:

```bash
$ docker-compose up -d
```

## Verify your Installation

After node is launched, it starts syncing with network.

The setup includes a local blockchain explorer. You can browse blocks, transactions and accounts via your browser by opening the url `http://localhost:PORT`
where `PORT` is the number you chose above for EXPLORER_PORT, e.g. `http://localhost:8080`

You can check your nodes real-time logs with the following command:

```bash
$ docker-compose logs -f --tail "100"
```

## Find additional peers

In case your client can't connect with the default configuration, we recommend that you add an additional flag referring to one of our additional peers (`$BOOTNODE1_ADDR`, `$BOOTNODE2_ADDR`or `$BOOTNODE3_ADDR`) within `docker-compose.yaml` file:

```yaml
fullnode:
  image: $QCLIENT_IMAGE
  entrypoint: ["geth", "--bootnodes=$BOOTNODE1_ADDR,$BOOTNODE2_ADDR,$BOOTNODE3_ADDR", "--datadir=/data", ...]
```

## Updating Q-Client & Docker Images

To upgrade the node follow the instructions [Upgrade Node](how-to-upgrade-node.md)

