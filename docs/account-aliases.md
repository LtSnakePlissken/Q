# How to use Account Aliases

Root nodes and Validators should have the possibility to (optionally) have an additional address per node and split the functionality:

- Main account: holds and transfers funds;
- “Alias”: used within the Q-client to seal blocks, sign L0 protocol messages or transition blocks.

More details about aliases are available in [QIP-00003](https://gitlab.com/q-dev/QIPs/-/blob/463d59c24b890b7bf569be52e0480a584217cbda/QIPs/QIP-00003.adoc).

## Create alias account

First of all, you need to create a new account that can be used as an alias for your main account. To generate a keystore for your new account, please follow setup docs. Note: back up your main account keystore before generating alias keystore.

After you have generated your alias account (A) you should import it to your wallet (e.g. MetaMask). You can import generated keystore file in MetaMask or you can export the private key for A by following these instructions.
Update your node address

Open `.env` file under your node folder and replace the address to your newly created A account. Save the file, but do not restart your node right away, as the network will not be able to recognize your alias account yet.  

The process to setup an alias account follows a two-step confirmation approach. First, you set a main account for your alias account. Then you confirm the alias account using your main account. 

## Reserve A for your main account (M)

To setup an alias account (A) you need to transfer a small amount of Q tokens to it to pay for transaction fees.
Go to _“Account Aliasing”_ page, here you can reserve your account A to be used as an alias for your main validator/root node account (M). First, click _“Reserve alias”_ button in the top-right corner. In the appeared modal enter your M address, click _“Reserve alias”_ and confirm the transaction in MetaMask.

## Set alias on your main account

Select your main node account M in MetaMask and connect it to "Your HQ". Open the [“Account Aliasing” page](https://hq.q.org/account-aliasing) in your browser.

Here you can currently see two roles for aliases: `BLOCK_SEALING` and `ROOT_NODE_OPERATION`. Depending on your node type select the preferred role and click _“Manage”_ button in the role row:

- `BLOCK_SEALING` for validators to use alias account for producing new blocks.
- `ROOT_NODE_OPERATION` for root nodes to participate in Layer 0 governance.

Once you click the _“Manage”_ button you’ll see the update alias modal. Enter your alias account (A) address there, click _“Update”_ and confirm the transaction in MetaMask.

## Run your node with alias account

Come back to your validator/root node machine. In the appropriate node folder run the command to recreate your node container with newly set up alias account:

```bash
$ docker-compose down && docker-compose up -d
```

On the corresponding monitoring page in Your HQ you can now see alias icon close to your node address. It means now your main account uses an alias for block sealing (validator) or root node operation (root node).

## Remove alias from main account

If you no more need alias account A for your main node account M select account A in MetaMask, open _“Account aliasing”_ page and click _“Reserve alias”_ button. In the appeared modal click _“Unreserve”_ and confirm transaction in MetaMask.

Now you no more use alias account for your node operations. Note: you need to change address in your node `.env` file back to your main account and restart the node. Only then your node would use your main account instead of alias.
