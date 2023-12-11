# How to Setup a Q Root Node

## Basic Configuration

Clone the repository

```bash
$ git clone https://gitlab.com/q-dev/mainnet-public-tools
```

Windows (if you don`t have git installed):

```
# Download the contents of the Git repository
Invoke-WebRequest -Uri https://gitlab.com/q-dev/mainnet-public-tools/-/archive/master/mainnet-public-tools-master.zip -OutFile mainnet-public-tools-master.zip

# Extract the contents of the ZIP file
Expand-Archive -Path mainnet-public-tools-master.zip -DestinationPath .

# Remove the ZIP file
Remove-Item -Path mainnet-public-tools-master.zip
```


and go to the `/rootnode` directory

```bash
$ cd mainnet-public-tools/rootnode
```

Windows:
```
Set-Location -Path "mainnet-public-tools\rootnode"
```


This directory contains the `docker-compose.yaml` file for quick launching of the root node with preconfigurations using `.env` file (which can be created from `.env.example` file).

> **Note: ** *If git is not installed on your machine, you can manually copy all files from public repo `mainnet-public-tools` onto your machine. Using git is much more comfortable, since it allows to pull file updates with one single command.*

## Set Password for Keystore File

To act as a root node, your node needs a keypair to sign transactions and L0 governance messages. First, create a `/keystore` directory with

Linux, macOS, other Unix-like systems:

```bash
$ mkdir keystore
```

Windows:
```
New-Item -ItemType Directory -Name "keystore"
```


then create a file `pwd.txt`

Linux, macOS, other Unix-like systems:

```bash
$ nano keystore/pwd.txt
```
Windows:
```
notepad.exe .\keystore\pwd.txt
```



then set a password that will be used for future account unlocking by entering it into `pwd.txt`. The password needs to be entered at the beginning of the file. Save your changes with `CTRL+O`, then close nano with `CTRL+X` (if you use a different editor, commands might be different).

## Generate a Keypair

Copy `.env.example` to `.env` inside the `/rootnode` directory:

Linux, macOS, other Unix-like systems:

```bash
$ cp .env.example .env
```

Windows:
```
# This will copy the .env.example file to a new file named .env.
Copy-Item -Path ".\env.example" -Destination ".\env"

```


Assuming you are in `/rootnode` directory, issue this command in order to generate a keypair:  

```bash
$ docker-compose run --rm --entrypoint "geth account new --datadir=/data --password=/data/keystore/pwd.txt" rootnode
```

The output of this command should look like this:

```text
Your new key was generated

Public address of the key:   0xb3FF24F818b0ff6Cc50de951bcB8f86b52287dac
Path of the secret key file: /data/keystore/UTC--2021-01-18T11-36-28.705754426Z--b3ff24f818b0ff6cc50de951bcb8f86b52287dac

- You can share your public address with anyone. Others need it to interact with you.
- You must NEVER share the secret key with anyone! The key controls access to your funds!
- You must BACKUP your key file! Without the key, it's impossible to access account funds!
- You must REMEMBER your password! Without the password, it's impossible to decrypt the key!
```

This way, a new private key is generated and stored in keystore directory encrypted with password from pwd.txt file. In our example, *0xb3FF24F818b0ff6Cc50de951bcB8f86b52287DAc* (**you will have a different value**) is the address corresponding to the newly generated private key.

*Alternatively*, you can generate a secret key pair and according file [here](https://vanity-eth.tk/) and save it to the `/keystore` directory manually.
Also, you may use `create-geth-private-key.js` script in `/js-tools` folder.

Whether you chose to provide your own vanity keys or use the above command to create a keypair, please ensure that the directory `/keystore` contains the following files:

```text
rootnode
|   ...
|   ...
└ keystore
  |   UTC--2021-01-18T11-36-28.705754426Z--b3ff24f818b0ff6cc50de951bcb8f86b52287dac
  |   pwd.txt
```

> **Note: ** *Following our example, pwd.txt contains the password to encrypted file "UTC--2021-01-18T11-36-28.705754426Z--b3ff24f818b0ff6cc50de951bcb8f86b52287dac" in clear text.*

If you want to change the password in the future, you need to stop the node first.

```bash
$ docker-compose down
```

Then start password reset procedure with

```bash
$ docker-compose run rootnode --datadir /data account update 0xb3ff24f818b0ff6cc50de951bcb8f86b52287dac
```

> **Note: ** *You need to remove address _0xb3ff24f818b0ff6cc50de951bcb8f86b52287dac_ and add your account address instead.*

## Configure Node

Edit the environment file:

Linux, macOS, other Unix-like systems:
```bash
$ nano .env
```

Windows:
```
#This will open the .env file in Notepad for editing. If you prefer to use a different text editor, replace notepad.exe with the appropriate command for your editor.
notepad.exe .\env
```


Enter your (newly created) root node address without leading 0x here:

```text
# your q address here (without leading 0x)
ADDRESS=b3FF24F818b0ff6Cc50de951bcB8f86b52287DAc
```

Then add your machines public IP address (please make sure your machine is reachable at the corresponding IP since it's required for discoverability by other network participants) here:

```text
# your public IP address here
IP=193.19.228.94
```

Optionally choose a port for p2p protocol or just leave default value (use different ports for every node you are running):

```text
# the port you want to use for p2p communication (default is 30304)
EXT_PORT=30304
```

The resulting `.env` file should look somehow like this:

```text
# docker image for q client
QCLIENT_IMAGE=qblockchain/q-client:v1.3.6

# your q address here (without leading 0x)
ADDRESS=b3FF24F818b0ff6Cc50de951bcB8f86b52287DAc

# your public IP address here
IP=193.19.228.94

# the port you want to use for p2p communication (default is 30304)
EXT_PORT=30304

# extra bootnode you want to use
BOOTNODE1_ADDR=enode://22adab037308f02abbb0fd7e831c75afa367b36615b2a0358a5c4673912cf384de6c8e688371822488622ebee383aeea5d41087160cb70484a9f1671876871b1@bootnode.q.org:30301
BOOTNODE2_ADDR=enode://3021f73a6f14f8594384923f7f0228f81a806d1708e5c046db12661bdce6b0f10625fae12771aa36f7a4d1f110d4e5a589bf3d34ec4b1d2c6d10e382d90f6983@extrabootnode.q.org:30314
BOOTNODE3_ADDR=enode://34b9e4e18bc37e4437bc0a9b10ac8ae5d0aab2b2e827310e90ec1012e818d07962b162d98e083ec5487e0cf87d1ffefb46332ec05209ec82fb675ae7afe3e241@extrabootnode.q.org:30315
```

## Add your Root Node to https://stats.q.org

If you want your root node to report to the [network statistics](https://stats.q.org), you can add an additional flag to the node entrypoint within file `/rootnode/docker-compose.yaml`, it should look like this:

```yaml
rootnode:
  image: $QCLIENT_IMAGE
  entrypoint: ["geth", "--ethstats=<Your_RootNode_Name>:<Mainnet_access_key>@stats.q.org", "--datadir=/data", ...]
```

`<Your_RootNode_Name>` can be chosen arbitrarily. It will be displayed in the statistics and could be something like "OurCoolCompany - 0xABC123". You can use special characters, emojis as well as spaces. We would appreciate to include the beginning of your Root Node Q address, so there is a link between your client and your address.

In order to find out the `<Mainnet_access_key>` please write us [on Discord](https://discord.gg/YTgkvJvZGD).

## Launch Root Node

Now launch your root node using docker-compose file in rootnode directory:

```bash
$ docker-compose up -d
```

Check your nodes real-time logs with the following command:

```bash
$ docker-compose logs -f --tail "100"
```

## Find additional peers

In case your client can't connect with the default configuration, we recommend that you add an additional flag referring to one of our additional peers (`$BOOTNODE1_ADDR`, `$BOOTNODE2_ADDR`or `$BOOTNODE3_ADDR`) within `docker-compose.yaml` file:

```yaml
rootnode:
  image: $QCLIENT_IMAGE
  entrypoint: ["geth", "--bootnodes=$BOOTNODE1_ADDR,$BOOTNODE2_ADDR,$BOOTNODE3_ADDR", "--datadir=/data", ...]
```

## Get Q Tokens

In order to become a root node, you will need to make an onchain proposal to [add yourself to the root node panel](how-to-become-a-root-node.md). You need Q tokens for this. We are working on a public listing of the Q token at the moment.

In the meantime, you can get the Q tokens needed for creating the proposal from the [Mainnet Faucet](https://faucet.q.org). You can find more information on the faucet and on how to use it in the [Faucet documentation](how-to-claim-q-tokens.md).

## Put Stake in Roots Contract

As was mentioned previously, you should put stake to rootnodes contract in order to become a rootnode.

You can use the dApp "Your HQ" that can be found at [https://hq.q.org](https://hq.q.org). Go to `Staking` -> `Root Node Staking` for stake management. Also, you may want to check our [Staking documentation](dapp-staking.md).

## Updating Q-Client & Docker Images

To upgrade the node follow the instructions [Upgrade Node](how-to-upgrade-node.md)
