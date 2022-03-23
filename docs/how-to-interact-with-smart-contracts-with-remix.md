# How to interact with Smart Contracts on Q using Remix

## Requirements

To get started with Remix, you need a MetaMask wallet connected to Q mainnet. You can find detailed instructions on working with MetaMask [here](how-to-install-metamask.md).

## Remix

Remix IDE is an open-source web and desktop application that allows developing, deploying, and administering of smart contracts.
It will help you write and upload Solidity contracts straight from the browser.

## Remix Installation

Go to [Remix](http://remix.ethereum.org/#optimize=false&evmVersion=null&version=soljson-v0.7.2+commit.51b20bc0.jsp). Go to the 2nd tab in the list on the left "Solidity Compiler" and select the "Solidity" language.

## Web3

Next, you need to connect MetaMask and Q mainnet. Go to the 2nd tab in the list on the left “deploy and run transactions". In the list “Environment" select "Injected Web3". In the account input field, you will be taken to the account selection page in MetaMask to connect. Select the required account and confirm the connection.
After that, on the Remix page, your address will appear on the contact list.

## Connecting to System Smart Contract

For connecting smart contracts you need abi file and contract address. You have the option to download a contract from portals, devices, or transfer it using a different address.

We will consider the third option, for this on the page “Deploy and run transactions" in the field "At address" enter the address from which you want to receive the contract, in our case it is `0x6048010FB09A36B02AC4b0A48c8E45d3C71eF33`. Download this [Repository](https://gitlab.com/q-dev/mainnet-public-tools/-/tree/master/abi) where abi files with smart contracts are stored. For the next setup you need to get contract addresses from the contract registry, and the contract registry you need to take from file genesis.json. Select function "Upload file" and upload the required file from the device from the repository above. Now on the “Deploy and run transactions” page, you can scroll down the list to see all the smart contract functions.

## Transaction Execution

In the list of functions, there are 3 kinds of function buttons. The orange buttons are functions that will change some information stored on the blockchain. This kind of function expends gas when used. The blue buttons are functions that are read-only and it does not change anything stored on the blockchain. We do not need to expend gas when using them. The red buttons are functions that are bounded with sending tokens. Enter the required value in the field of the desired function and click on the button for this function.
