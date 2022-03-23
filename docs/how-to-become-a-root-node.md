# How to become a Root Node

## Role and Responsibilities

Root nodes monitor the operations happening on the Q blockchain layer and thus ensure that actions on Q from any network participant are compliant to the Q constitution. The current constitution can be downloaded [here](https://q.org/).

Root nodes are verified entities (e.g. corporates, universities, NGOs, ..) and well known to the Q community. They are collectively forming the root node panel which has special voting and veto rights, depending on each individual governance context. Each root node acts independently when it comes to monitoring the system and initiating measures in case of constitutional breaches.

All responsibilities of a root node are described within the constitution. The main tasks are amongst others:

  - monitor the compliance of validators
  - monitor compliance of governance processes, e.g. proposals, votings
  - initiate measures to enforce constitution compliance, e.g. vetos, slashing proposals

To become a root node, you must run your own full node, meet the requirements according to constitution, create a proposal to enter the root node panel and receive a voting majority on this proposal. The following tutorial will guide you through the process.

## Onboarding on Mainnet

For Q mainnet, the onboarding of root nodes is bound to root node eligibility and selection of appropriate candidates. Amongst others, this includes the requirement to fully identify (due dilligence) the root node operator and ensure he is incorporated within a country that has accepted the Convention on the Recognition and Enforcement of Foreign Arbitral Awards of 1958 ("NY Convention").

Since this implies discretionary decisions to be made, a dedicated expert panel for root node onboarding decisions takes over this task. Please check Q Constitution, Article 5.

## Run a Full Node

Since the fundamental responsibility of a root node lies in the monitoring of on-chain operations conducted by validators, a root node shall operate its own full node to be able to screen blocks and transactions. Check our [full node tutorial](how-to-setup-fullnode.md) to learn how to set up a full node.

## Root Node Stake

To be able to sign transactions with your root node address, you need to import the private key into a compatible wallet application such as [MetaMask](how-to-install-metamask.md). Check this [tutorial](how-to-export-key.md) to learn how to export the private key created during full node installation.

Next step is to add Q tokens as stake to show your commitment to the project and put some "skin into the game". Please note that adding stake is optional for root nodes but the more stake you add, the higher the chance you get voted into the panel.

Go to the dApp "Your HQ" at [https://hq.q.org](https://hq.q.org), connect it with your root node wallet account and go to "Consensus Services -> Root Node Staking". Enter the desired amount of Q you want to stake, then click on "Stake to Panel" and confirm the transaction within MetaMask.

> **Note: ** *If you want to remove stake, you have to enter the desired amount of Q to be withdrawn from panel, then click "Announce Withdrawal". After the announcement period has ended, you can withdraw up to the announced amount within a separate transaction by clicking on "Withdraw from Panel". The announcement period allows others to get notified about your planned stake reduction and potentially initiate (on-chain) legal measures that would have an impact on your stake (e.g. slashing proposal due to constitutional breach or incompliant actions).*

## Entering the Root Node Panel

Adding stake doesn't add your account to the root node panel automatically. All root nodes are elected by the majority of Q token holders. To initiate election, you must create an appropriate proposal first. In "Your HQ" go to "Q Governance -> Q Root Node Panel", then "Create Q Root Node Panel Proposal".

Within the opening modal, select "Add a new root node" and click on "Next". The address of the currently connected MetaMask wallet account is set automatically as root node candidate address.

On the next modal page, you need to provide the hash of the current constitution. By signing the proposal including the current hash, you confirm and accept the terms incorporated within constitution. The current constitution hash can be received by any active root node and within "Your HQ" Dashboard.

In addition to the constitution hash, you need to provide a URL that leads potential voters to external information on you, your motivation to join root node panel and legal information about you or your corporation.

We created a template on reddit for Q proposals that can easily be adapted for a Q root node proposal: [Q proposal template](https://www.reddit.com/r/QBlockchain/comments/o1xd5r/q_proposal_general_q_update_example_proposal_for/).

If you want to use a different content platform, please ensure you include at least the following details:

- Author's name, address & country of incorporation
- Link to Q root node panel proposals
- Date of proposal creation
- Your or your companies professional & business background
- Abstract on your motivation to contribute to Q as a root node, your commitment plans and your visions on Q

> **Note: ** *The more precise you are, the more likely is a positive vote from all eligible voters, i.e. the Q token holders.*

Finally, select "Yes" if you want to remove and replace an existing root node within a single proposal or "No" if you simply want your address to be added to the existing root node panel.

After you committed the proposal by confirming the transaction through MetaMask, the process is started and voting is possible for all eligible Q token holders until the voting period has ended. Once ended, if quorum is reached and the required majority voted "yes", you will be added to root node panel by executing the proposal through a final transaction.
