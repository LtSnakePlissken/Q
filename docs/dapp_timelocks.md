# Time lock management

Time locks give you the option to transfer the native asset Q to a recipient, allowing him to dispose of and use the token in a desired way, but without having the possibility to transfer the asset within a given time frame. The possible actions are depending on the time lock category, i.e. in which smart contract they are locked.

The time lock mechanism is designed using a 2-step linear release logic. A start date defines the time until the amount is completely locked. Between start date and end date, the amount of tokens which can be withdrawn increases linearly from 0 to full amount. After the end date, the tokens are not locked anymore and can be withdrawn.

## This can be done with time locked Q tokens

  - Earn rewards on Q tokens in Q vault
  - Use Q tokens for governance tasks, e.g. increase voting weight and participate on votings
  - Delegate Q tokens for stake delegation on validators
  - Act as self-staked Q tokens in root node staking
  - Act as self-staked Q tokens in validator node staking

  > **Note:** *Time locked tokens that are staked on a validator or root node (self-stake as well as delegated stake) are subject to potential slashing actions, just as if they were not time locked!*

## This can't be done with time locked Q tokens

  - Transfer of time locked tokens to another address

## Time lock categories

Using the dApp "Your HQ", any Q token holder is able to create a time lock. Simply head to https://hq.qtestnet.org and make sure you have the MetaMask plugin  [installed](how_to_install_metamask.md).

Within the advanced mode of "Your HQ", click on "Time Locks" within navigation bar and you will be redirected to the time lock overview page. By default, it shows all existing time locks for your active wallet address (i.e. the one you are currently using for dApp interaction).

- Q vault: On the top left quadrant you can find the Q vault time locks. Tokens locked here can be used within Q vault as voting weight and for earning Q Token Holder rewards.
- Root stake: The top right quadrant shows the root node stake. Locked amounts can be used for staking on your root node and might be subject to slashings.
- Validator stake: the lower left quadrant introduces validator time locks. These time locked amounts can be used for validator staking and have direct impact on a validators position within the ranking and therefore its expected rewards. They might be subject to slashing.
- Vesting: the last quadrant at the lower right corner accommodates time locked amounts that can explicitly *not* be used for reward generation in any way. Once the time lock expires, the vested amounts can be transferred.

## Create a time lock

By clicking on the button "Manage" of any of the four categories, you are able to do any of the following actions:
- *Deposit*: Transfer Q into the time lock balance of the selected account address.
- *Purge*: Clears the list of expired time locks and helps to keep the system clean.
- *Withdraw* is only available in Vesting category and allows you to transfer Q tokens noce the time lock is passed.

  > **Note:** *Validator stake, root node stake and Q vault withdrawals can be triggered through the according withdrawal process. These are  "Consensus Services" for validator and root node stake withdrawals and "Q Vault" for vault withdrawals.*

## Self and foreign time locks

The time lock page allows to send and lock Q tokens for any Q address. By default, the "Time Locks" page is loaded with the active MetaMask account address that is used for dApp interaction. You can change the "Current address" by entering any other Q address and clicking on the refresh button next to the input. The menu will reload and show all time locks for the specified address.

Once the menu reloaded with the foreign address, you can deposit Q tokens into the new recipients address and thus create time locks on the foreign address. There are many use cases where a time lock for transferred Q tokens might be helpful, e.g. for saving agreements between companies, investment gifts for family members or deferred payments for services and products.
