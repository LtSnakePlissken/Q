# Send Transaction from Within Q-Client

## Prerequisites

* Ensure that your account is unlocked. For detailed instructions, refer to [this guide](https://docs.q.org/account-operations/).

## How to Interact with the Chain within Q-Client

1. Attach to the geth console.

```shell
docker-compose exec node geth attach data/geth.ipc
```

2. In the console, paste the ABI of the contract you want to interact with. Here's an example ABI for votings:

```javascript
var abi =[{"inputs":[{"internalType":"uint256","name":"_proposalId","type":"uint256"}],"name":"voteFor","outputs":[],"stateMutability":"nonpayable","typea":"function"},{"inputs":[{"internalType":"uint256","name":"_proposalId","type":"uint256"}],"name":"voteAgainst","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_proposalId","type":"uint256"}],"name":"veto","outputs":[],"stateMutability":"nonpayable","type":"function"}];
```

ABI source options:

- Get abi from [explorer](https://explorer.q.org/)
    * Go to explorer from [Contract Registry page](https://hq.q.org/q-parameters/contract-registry) by clicking on address of voting contract.
    * If the smart contract has a proxy - go to implementation contract by clicking on the value next to `Implementation`
    * Scroll little bit down and open `Contract` tab.
    * Just after the `Contract source code` you will see the `Contract ABI`
- The full list of system contracts abi could be found [here](https://gitlab.com/q-dev/q-js-sdk/-/tree/v2/src/abi?ref_type=heads).

You might need to use Line Break Removal Tool to avoid errors during creating abi variable. Or you can put abi to a file and simply run `echo $(cat path_to_file_with_abi)` in your terminal (not in geth console).

3. Paste the following code with the desired contract address instead of `0xYourContractAddress`. You can find the
address in [Q Params](https://hq.q.org/q-parameters/contract-registry).

```javascript
var VotingContract = web3.eth.contract(abi);
var VotingContractInstance = VotingContract.at('0xYourContractAddress');
```

For example, if you want to vote against a proposal about adding a new root node, use the address of the contract 
responsible for root node membership votings, which has the key `governance.rootNodes.membershipVoting`. Copy and paste
that address instead  of `0xYourContractAddress`.

4. Finally, call the desired function on the smart contract. Here's an example of voting against a proposal with
ID `VotingId`:

```javascript
VotingContractInstance.voteAgainst(VotingId, {from: eth.accounts[0], gas: 300000});
```

Replace `VotingId` with desired proposal id.

Gas limit options:

- 500000 is enough to vote for or aganist in any voting.
- 900000 could be required to execute some votings decisions.
- 1000000 is basically enough to create a proposal, but it depends on type of the proposal and amount of changes.

As a result console returns the transaction hash, paste it in the [scan](https://explorer.q.org/) search bar.
