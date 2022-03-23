# How to Setup a Q Root Node

## Setup your Server

You must prepare your server / machine to begin. One possibility is to use a local machine, alternatively you can use a cloud instance on AWS for example. There is a good external tutorial on how to get started with Ethereum on AWS. You can use this [tutorial](https://medium.com/@pilankar.akshay3/how-to-setup-a-ethereum-poa-private-proof-of-authority-ethereum-network-network-on-amazon-aws-5fdf56d2ad93) as a basic reference.

## Basic Configuration

Clone the repository `https://gitlab.com/q-dev/mainnet-public-tools` and go to the rootnode directory. This directory contains docker-compose file for quick launching of full node with .env file for ports configuration and genesis.json - config of genesis block of Q MainNet.


## Generate a Keypair for Root Node

In order to participate in layer 0 governance protocol, a root node needs a keypair.
Create a keystore directory, then a password which will be used for private key encryption and save it into a text file pwd.txt in keystore directory.
Assuming you are in rootnode directory, issue this command in order to generate a keypair:  

    docker-compose run --rm --entrypoint "geth account new --datadir=/data --password=/data/keystore/pwd.txt" node

The output of this command should look like this:

    Your new key was generated

    Public address of the key:   0xb3FF24F818b0ff6Cc50de951bcB8f86b52287DAc
    Path of the secret key file: /data/keystore/UTC--2021-01-18T11-36-28.705754426Z--b3ff24f818b0ff6cc50de951bcb8f86b52287dac

    - You can share your public address with anyone. Others need it to interact with you.
    - You must NEVER share the secret key with anyone! The key controls access to your funds!
    - You must BACKUP your key file! Without the key, it's impossible to access account funds!
    - You must REMEMBER your password! Without the password, it's impossible to decrypt the key!

This way, a new private key is generated and stored in keystore directory encrypted with password from pwd.txt file. In our example, *0xb3FF24F818b0ff6Cc50de951bcB8f86b52287DAc* (**you will have a different value**) is the address corresponding to the newly generated private key.

Alternatively, you can generate a secret key pair and according file on this [page](https://vanity-eth.tk/) and save it to the keystore directory manually.
Also you may use `create-geth-private-key.js` script in js-tools dir.

Whether you chose to provide your own vanity keys or use the above command to create a keypair, please ensure that the directory `/keystore` contains the following files:

    rootnode
    |   ...
    |   ...
    └ keystore
      |   UTC--2021-01-18T11-36-28.705754426Z--b3ff24f818b0ff6cc50de951bcb8f86b52287dac
      |   pwd.txt

> **Note: ** *Following our example, pwd.txt contains the password to encrypted file "UTC--2021-01-18T11-36-28.705754426Z--b3ff24f818b0ff6cc50de951bcb8f86b52287dac" in clear text.*

If you want to change the password in the future, you need to stop the node first.

    docker-compose down

Then start password reset procedure with

    docker-compose run node --datadir /data account update 0xb3ff24f818b0ff6cc50de951bcb8f86b52287dac

> **Note: ** *You need to remove address _0xb3ff24f818b0ff6cc50de951bcb8f86b52287dac_ and add your account address instead.*

## Get Q Tokens

In order to become a validator, you will need to put some stake in validators contract, so you need Q tokens for this. We are working on a public listing of the Q token at the moment.

## Configure Setup

Edit .env file in rootnode directory. Put your address without leading 0x from the step 3, into ADDRESS, your public IP address (please make sure your machine is reachable at the corresponding IP) into IP (this is required for discoverability by other network participants) and optionally choose a port for p2p protocol (or just leave default value). The resulting .env file should look like this:

    ADDRESS=b3FF24F818b0ff6Cc50de951bcB8f86b52287DAc
    IP=193.19.228.94
    EXT_PORT=30303

## Put Stake in Roots Contract

You can use the dApp "Your HQ" that can be found at [https://hq.q.org](https://hq.q.org).

## Launch Root Node

Now launch your root node using docker-compose file in rootnode directory:

`docker-compose up -d`

Note: Check your nodes real-time logs with the following command:

`docker-compose logs -f --tail "100"`
