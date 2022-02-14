# How to install and setup MetaMask

## Installing the extension

The first thing you need to do is install the add-on MetaMask in your browser. To do this, visit the [Metamask Download Page](https://metamask.io/download.html), which offers the Metamask extension for the browsers Chrome, Brave, Firefox, Edge and as an application for Android and iOS phones. This tutorial covers the steps for the Chrome extension, however for other browsers, the steps are nearly identical.

## Account creation

After installing the extension, you will be presented with a page for connecting an existing account or creating a new one.
Select *create an account*, agree to the proposed agreements, and create your password to access your account. You will be prompted to view the seed phrase. Please store it in a safe way, as it will be required for you to back up and restore your account.

## Network configuration

You need to configure your newly created wallet to support and accept Q tokens. To do this, you need to connect to the Q blockchain. On the main page of your account, select *Custom RPC* in the upper right corner in the list of networks. Then enter the following details to setup the connection to Q:

| **Parameter** | **Value** |
|:--|:--|
| Network name | Q Testnet|
| RPC-URL | https://rpc.qtestnet.org |
| Chain-ID | 35443 |
| Symbol | Q |
| Block-Explorer-URL| https://explorer.qtestnet.org |

> **Note: ** *These parameters are valid for Q testnet only!*

## Faucet

To continue working on testnet, you need to receive some Q tokens to your address using the faucet. Add your wallet address (something like `0x0AbC123...abc`) into the below URL of the faucet and open the URL within your browser.  

`https://faucet.qtestnet.org/0x0AbC123...abc`  

If the faucet is working as expected, your balance will increase within a couple of seconds.

Other assets on Q testnet are be supported by the faucet as well. The asset type simply needs to be added to the URL like a sub-folder before the wallet address (again, replace `0x0AbC123...abc` with your Q testnet address.):

`https://faucet.qtestnet.org/QBTC/0x0AbC123...abc`  
`https://faucet.qtestnet.org/QUSD/0x0AbC123...abc`
