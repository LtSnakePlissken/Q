# How to export a Private Key

If you managed to run a validator or full node (e.g. for becoming a root node), you might want to import your private key into a wallet application like MetaMask in order to actively participate in Q governance processes, change your stake or interact with other system contracts through the dApp "Your HQ".

The script located [here](https://gitlab.com/q-dev/testnet-public-tools/-/tree/master/js-tools) helps you with the export. It is best used within node.js environment.

## Prepare

Install npm package manager for node.js:

```text
$ npm install
```

## Scripts

Extract private key from keystore file:

```text
$ node extract-geth-private-key ADDRESS [GETH_DATA_DIR [PASSWORD]]
```

| **Parameter Name** | **Description** |
|:--|:--|
| ADDRESS | The address you are interested in |
| GETH_DATA_DIR | the directory that holds the `keystore` sub directory. Defaults to `../validator` |
| PASSWORD | The password that encrypts the key file. If omitted, the user will be prompted for the password |

*EXAMPLES*

```text
$ node extract-geth-private-key 61f519ef91942b19061ba02864655326e9a260a2
$ node extract-geth-private-key 61f519ef91942b19061ba02864655326e9a260a2 /path/to/geth/dir myPassword
```

## Run without node.js
If you don't have a node.js environment, you can run all scripts inside a docker container:

```text
cd ..
./run-js-tools-in-docker.sh
```

Follow the on-screen instructions to obtain the file containing your private key.

##  Import into Wallet Applications

Depending on the used wallet application, importing the private key can be slightly different. For MetaMask, click on the account icon on the top right corner of MetaMask, then select "Import Account". Then select type "JSON" and upload the key file or select "Private Key" and copy&paste your exported private key.
