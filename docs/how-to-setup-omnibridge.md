# How to setup the OmniBridge

## Basic Requirements

OmniBridge is a component that allows to bridge assets from other blockchains (e.g. Ethereum Rinkeby, Ethereum Mainnet, ..) onto Q. This is used for bridging and transferring collaterals for the creation of Q synthetic assets. Due to their role within Q, validators are predisposed to run an OmniBridge instance.

First please make sure you have a running validator node as described [here](how-to-setup-validator.md).

Also please make sure that you have the private key of the validator account as you need it in the config later. 

## Download Repo and Configuration
Clone the latest master of the [mainnet-public-tools repository](https://gitlab.com/q-dev/mainnet-public-tools/-/tree/master/). It should contain, amongst others, the three following folders:

* omnibridge-oracle : The core OmniBridge client
* omnibridge-ui : A graphical user interface to use the bridge on your local server
* omnibridge-alm : The monitor component to track the status of bridge transactions on the blockchain

## Configure OmniBridge-Oracle

Go into the **omnibridge-oracle** directory. This directory contains a docker-compose file for quickly launching the bridge oracle and some example environment configurations. Copy the file `.env.mainnet` locally to `.env`. Adjust the following parameters:

* ORACLE_VALIDATOR_ADDRESS : Provide your Q validator address. Example: 0xac8e5047d122f801...
* ORACLE_VALIDATOR_ADDRESS_PRIVATE_KEY : Provide your Q validator private key. Example: a385db8296ceb9a....
* COMMON_HOME_RPC_URL : You can keep the default, use https://rpc.q.org or use the RPC endpoint of our own full node if you are operating one.
* COMMON_FOREIGN_RPC_URL : Provide an RPC endpoint of a client of the blockchain on the other side of the bridge. Q mainnet bridges to the Ethereum mainnet. You can use your own ethereum client, a public endpoint or [create an infura account](https://infura.io/) for free to get a personal Ethereum mainnet access point (e.g. https://mainnet.infura.io/v3/1673abc....).

## Launch the Oracle
To start the client with docker-compose make the call

`docker-compose up -d`

You can track the status of your bridge client by following the logs:

`docker-compose logs -f --tail 200`

## Setup and launch the OmniBridge-UI

Change to the folder **omnibridge-ui** and copy the file `.env.mainnet` to `.env`.

* REACT_APP_FOREIGN_RPC_URL : Provide an RPC endpoint of a client of the blockchain on the other side of the bridge, e.g. https://mainnet.infura.io/v3/1673abc....

Start the service with docker-compose

`docker-compose up -d`

You can find the UI running on your machine on port `:8080`, try accessing it with a browser.

## Setup and launch the Omnibridge-ALM

Change to the folder **omnibridge-alm** and copy the file `.env.mainnet` to `.env`. Adjust the following parameters:

* PORT : You can keep the default `8090` or change to some other port.
* COMMON_HOME_RPC_URL : You can keep the default, use https://rpc.q.org or use the RPC endpoint of our own full node if you are operating one.
* COMMON_FOREIGN_RPC_URL : Provide an RPC endpoint of a client of the blockchain on the other side of the bridge, e.g. https://mainnet.infura.io/v3/1673abc....
* ALM_HOME_EXPLORER_TX_TEMPLATE : You can keep the default https://explorer.q.org/tx/%s or change with the IP of your own full node block explorer.

Start the monitor service with docker-compose

`docker-compose up -d`

You can find the monitor running on your machine on port `:8090`, try accessing it with a browser. It can be used to look for bridge transactions once the bridge is in use.
