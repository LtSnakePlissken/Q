# How to become a Root Node

## Role and Responsibilities

Root nodes monitor the operations happening on the Q blockchain layer and thus ensure that actions on Q from any network participant are compliant to the Q constitution. The current (mainnet) constitution can be downloaded [here](https://q.org/assets/files/Q_Constitution.pdf).

Root nodes are verified entities (e.g. corporates, universities, NGOs, ..) and well known to the Q community. They are collectively forming the root node panel which has special voting and veto rights, depending on each individual governance context. Each root node acts independently when it comes to monitoring the system and initiating measures in case of constitutional breaches.

All responsibilities of a root node are described within the constitution (c.f. Articles 5, 6 & 9 and Appendix 2). The main tasks are amongst others:

  - monitor the compliance of validators
  - monitor compliance of governance processes, e.g. proposals, votings
  - initiate measures to enforce constitution compliance, e.g. vetos, slashing proposals

To become a root node, you must

1. Setup and run your own root node,
2. get in touch with Root Node Selection Expert Panel (EPRS),
3. meet the requirements according to constitution,
4. create a proposal to enter the root node panel and
5. receive a voting majority on your proposal.

The following tutorial will guide you through the process.

## Run a Full Node

Since the fundamental responsibility of a root node lies in the monitoring of on-chain operations conducted by validators, a root node shall operate its own full node to be able to screen blocks and transactions. Check our [technical root node tutorial](how-to-setup-rootnode.md) to learn how to set up a full node in root node mode.

## Key Export & Root Node Stake

To be able to sign transactions with your root node address, you need to import the private key into a compatible wallet application such as [MetaMask](how-to-install-metamask.md). Check this [tutorial](how-to-export-key.md) for exporting the private key created during root node setup.

If you have imported your keys into MetaMask, the next step is to stake Q tokens to show your commitment to the project and put some "skin into the game". Please note that adding stake is optional for root nodes but the more stake you add, the higher the chance you get voted into the panel.

Go to the dApp "Your HQ" at [https://hq.q.org](https://hq.q.org), connect it with your root node wallet account and go to "Consensus Services -> Root Node Staking". Enter the desired amount of Q you want to stake, then click on "Stake to Panel" and confirm the transaction within MetaMask.

> **Note: ** *If you want to remove stake, you have to enter the desired amount of Q to be withdrawn from panel, then click "Announce Withdrawal". After the announcement period has ended, you can withdraw up to the announced amount within a separate transaction by clicking on "Withdraw from Panel". The announcement period allows others to get notified about your planned stake reduction and potentially initiate (on-chain) legal measures that would have an impact on your stake (e.g. slashing proposal due to constitutional breach or non-compliant actions).*

## The EPRS

The Root Node Selection Expert Panel (EPRS) will assess every root node candidature as described in Constitution Appendix 2, Part B "Eligibility Criteria". This process will happen *before* the on-chain application has been handed in through a root node panel proposal.

Every root node candidate is required to contact the EPRS for this purpose. The easiest way is to join the Q Discord server channel "[General](https://discord.com/channels/902893347239247952/909793165563793408)" in category "Root Nodes".

## Entering the Root Node Panel

Adding stake doesn't add your account to the root node panel automatically. All root nodes are elected by the majority of Q token holders. To initiate election, you must create an appropriate proposal first. In "Your HQ" go to "Q Governance -> Q Root Node Panel", then "Create Q Root Node Panel Proposal".

Within the opening modal, select "Add a new root node" and click on "Next". The address of the currently connected MetaMask wallet account is set automatically as applying root node address. You can't propose any third party address to become root node.

On the next modal page, you need to provide the hash of the current constitution. By signing the proposal including the current hash, you confirm and accept the terms incorporated within constitution (c.f. Appendix 2, Part A, 1.(iv)). The current constitution hash can be fetched from "Your HQ" [Dashboard](https://hq.q.org/).

In addition to the constitution hash, you need to provide a URL that leads potential voters to external information on you, your motivation to join the root node panel and legal information about you or your corporation.

We created a [template](https://qdev.li/q-root-node-proposal-testnet) for Q proposals that can be used as reference for a Q root node proposal. Every ended and `executed` root node panel [proposal](https://hq.q.org/q-root-node-panel) can also be used as best-practice reference.

The external reference shall include all required information as per Constitution Appendix 2, Part A, as well as some additional items that help potential voters evaluate the application and decide on the proposal:

- Root node operator name, address & country of incorporation (if applicable)
- Individual professional or company background
- Abstract on your motivation to contribute to Q as a root node, your commitment plans and your visions on Q
- Link to Q root node panel proposal
- Date of proposal creation

> **Note: ** *The more precise you are, the more likely is a positive vote from all eligible voters, i.e. the Q token holders.*

Finally, select "Yes" if you want to remove and replace an existing root node within a single proposal or "No" if you simply want your address to be added to the existing root node panel.

After you committed the proposal by confirming the transaction through MetaMask, the process is started and voting is possible for all eligible Q token holders until the voting period (c.f. value of [`constitution.voting.addOrRemRootVP`](https://hq.q.org/q-parameters)) has ended. Once ended, if quorum is reached and the required majority voted "yes", you will be added to root node panel after executing the proposal through a final transaction.
