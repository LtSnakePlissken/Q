# Understanding the Q rewards structure

Understanding the Q rewards structure is essential for anyone involved in or considering becoming a part of the Q blockchain network. While we will focus here on the allocation of rewards to root nodes and validators, you must know that there are more actors eligible for rewards under the Q ecosystem.

![Tokenomics](./img/tokenomics.png)

## Default Allocation Proxy

The default allocation proxy (or DAP) serves as the central distribution point for all rewards in the Q rewards ecosystem. The rewards distributed by the default allocation proxy come from the following sources :
- The Q token inflation, also known as the "block subsidy." This is a flat amount of tokens minted each block. This is currently the primary source of Q token rewards.
- The slashed tokens of a successful validator or root node slashing proposal.
- All revenue from the Saving & Borrowing integrated application on the Q HQ.
- Future plans for DAO payment for "GaaS" or "Governance-as-a-Service"

## Q Token Inflation and Distribution

At the time of writing, the Q token inflation is the primary source of Q token rewards on the Q blockchain.
The Q token inflation rate is defined by the `blockSubsidy` constitutional parameter. At the time of writing, this value is set at 1.5. Given that the Q network operates with a block time of 5 seconds, this equates to an inflation rate of 18 Q tokens per minute, 1,080 per hour, and 25,920 per day, on average.

These newly minted tokens are then distributed among various actors in the Q ecosystem, such as validators and root nodes.

### Reward Shares

Each group of users eligible for rewards from the default allocation proxy receives a different proportion of these rewards. The distribution percentages are defined by constitutional parameters. 

- For validators, this parameter is `rewardShareValidatorNodes`, and it is currently set at 40%.
- For root nodes, the parameter is `rewardShareRootNodes`, and it is currently set at 20%.

These constitutional parameters can be subject to change and can be verified directly from the [Q HQ app](https://hq.q.org/q-parameters/constitution)
