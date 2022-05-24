# How to Setup a Q Root Node

## Setup your Server

The Q Root Node is required to run on a server or (virtal) machine on linux. One possibility is to use a local machine, alternatively you can use a cloud instance on AWS for example. A good external tutorial on how to get started with Ethereum on AWS can be found [here](https://medium.com/@pilankar.akshay3/how-to-setup-a-ethereum-poa-private-proof-of-authority-ethereum-network-network-on-amazon-aws-5fdf56d2ad93). Any other linux machine will work as well if it meets the following requirements:

  - Linux machine with SSH access
  - Min. 3(v)Cores (x86), 30 GB storage and 3 GB RAM
  - Installed applications: docker, docker-compose, git (optional)

## Basic Configuration

Clone the repository

`$ git clone https://gitlab.com/q-dev/mainnet-public-tools`

and go to the rootnode directory

`$ cd mainnet-public-tools/rootnode`

This directory contains a docker-compose file for quick launching of a full node using files `.env` for basic configuration and `genesis.json` that contains the genesis block config of Q Mainnet.

> **Note: ** *If git is not installed on your machine, you can manually copy all files from public repo `mainnet-public-tools` onto your machine. Using git is much more comfortable, since it allows to pull file updates with one single command.*

## Set Password for Keystore File

To act as a root node, your node needs a keypair to sign transactions and L0 governance messages. First, create a keystore directory with

`$ mkdir keystore`

then create a file pwd.txt

`$ nano keystore/pwd.txt`

then set a password that will be used for future account unlocking by entering it into `pwd.txt`. The password needs to be entered at the beginning of the file. Save your changes with `CTRL+O`, then close nano with `CTRL+X` (if you use a different editor, commands might be different).

## Generate a Keypair

Assuming you are in `/rootnode` directory, issue this command in order to generate a keypair:  

    $ docker-compose run --rm --entrypoint "geth account new --datadir=/data --password=/data/keystore/pwd.txt" node

The output of this command should look like this:

    Your new key was generated

    Public address of the key:   0xb3FF24F818b0ff6Cc50de951bcB8f86b52287DAc
    Path of the secret key file: /data/keystore/UTC--2021-01-18T11-36-28.705754426Z--b3ff24f818b0ff6cc50de951bcb8f86b52287dac

    - You can share your public address with anyone. Others need it to interact with you.
    - You must NEVER share the secret key with anyone! The key controls access to your funds!
    - You must BACKUP your key file! Without the key, it's impossible to access account funds!
    - You must REMEMBER your password! Without the password, it's impossible to decrypt the key!

This way, a new private key is generated and stored in keystore directory encrypted with password from pwd.txt file. In our example, *0xb3FF24F818b0ff6Cc50de951bcB8f86b52287DAc* (**you will have a different value**) is the address corresponding to the newly generated private key.

*Alternatively*, you can generate a secret key pair and according file [here](https://vanity-eth.tk/) and save it to the keystore directory manually.
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

`$ docker-compose down`

Then start password reset procedure with

    $ docker-compose run node --datadir /data account update 0xb3ff24f818b0ff6cc50de951bcb8f86b52287dac

> **Note: ** *You need to remove address _0xb3ff24f818b0ff6cc50de951bcb8f86b52287dac_ and add your account address instead.*

## Configure Node

Edit .env file in `/rootnode` directory:

`$ nano .env`

Enter your (newly created) root node address without leading 0x here:

    # your q address here (without leading 0x)
    ADDRESS=b3FF24F818b0ff6Cc50de951bcB8f86b52287DAc

Then add your machines public IP address (please make sure your machine is reachable at the corresponding IP since it's required for discoverability by other network participants) here:

    # your public IP address here
    IP=193.19.228.94

Optionally choose a port for p2p protocol or just leave default value (use different ports for every node you are running):

    # the port you want to use for p2p communication (default is 30303)
    EXT_PORT=30303

The resulting .env file should look somehow like this:

    # docker image for q client
    QCLIENT_IMAGE=qblockchain/q-client:mainnet

    # your q address here (without leading 0x)
    ADDRESS=b3FF24F818b0ff6Cc50de951bcB8f86b52287DAc

    # your public IP address here
    IP=193.19.228.94

    # the port you want to use for p2p communication (default is 30303)
    EXT_PORT=30303

    # the initial root node set if never connected before
    INITIALROOTS=0xB6fs1878e60B7D9152695c1b3D190c3a3DC,0x3313ba4c7EbDa55C038316C77679b2909da7a5

    # only root lists later than this will be considered for updates
    ROOTTIMESTAMP=1647418453

## Add your Root Node to https://stats.q.org

If you want your root node to report to the [network statistics](https://stats.q.org), you can add an additional flag to the node entrypoint, it should look like this:

    node:
    image: $QCLIENT_IMAGE
    entrypoint: ["geth", "--ethstats=<Your_RootNode_Name>:<Mainnet_access_key>@stats.q.org", "--datadir=/data", ...]

`Your_RootNode_Name` can be chosen arbitrarily. It will be displayed in the statistics and could be something like "OurCoolCompany - 0xABC123". You can use special characters, emojis as well as spaces. We would appreciate to include the beginning of your Root Node Q address, so there is a link between your client and your address.

In order to find out the `Mainnet_access_key` we ask you to write to us [on Discord](https://discord.gg/YTgkvJvZGD).

## Launch Root Node

Now launch your root node using docker-compose file in rootnode directory:

`$ docker-compose up -d`

Check your nodes real-time logs with the following command:

`$ docker-compose logs -f --tail "100"`

## Get Q Tokens

In order to become a root node, you will need to make an onchain proposal to [add yourself to the root node panel](how-to-become-a-root-node.md). You need Q tokens for this. We are working on a public listing of the Q token at the moment.

## Put Stake in Roots Contract

You can use the dApp "Your HQ" that can be found at [https://hq.q.org](https://hq.q.org). Go to `Consensus Services` -> `Root Node Staking` for stake management. Also, you may want to check our [Consensus Services documentation](dapp-consensusservices.md).
