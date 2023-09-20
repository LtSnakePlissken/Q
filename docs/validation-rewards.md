
# Validation rewards

In the Q blockchain network, validators function quite similarly to most EVM-compatible Proof-of-Stake (PoS) validator nodes. These nodes are responsible for creating new blocks and confirming transactions, ensuring the security and functionality of the network.

!!! note "Learn more about validator staking and delegation"
    The following sections refer to concepts such as "accountable stake" or "delegation saturation" detailled in the [staking page of the HQ Dapp](/dapp-staking). Please make sure to understand these concepts before continuing.


## Rewards Eligibility

Q validators must be in the validator "shortlist" in order to begin earning validation rewards.

!!! note "On blacklisting"
    Blacklisting is a more complicated process than described here. It is a "Layer 0" process, which should then normally lead to a 100% slashing proposal of the offending validator. This is not an automated process. Detailed information on blacklisting is beyond the scope of this section.

### About the Shortlist

The shortlist is composed of the top-ranking validator nodes, based on accountable stake. Accountable stake is the total stake below the delegation limit. For more information on staking and delegation limits, refer to the [/dapp-staking](/dapp-staking) page.

The number of validators eligible for rewards is determined by two constitutional parameters:

- `maxNValidators`, which defines the maximum number of active validators
- `maxNStandbyValidators`, which defines the maximum number of standby validators

The top `maxNValidators` in the validator rankings will be designated as active validators, while the following `maxNStandbyValidators` will serve as standby validators. Both active and standby validators earn the same rewards. However, active validators have the added responsibility of maintaining sufficient uptime to avoid getting slashed.

This implies that in total, the top `maxNValidators` + `maxNStandbyValidators` validators in the rankings are eligible for validation rewards. 

You can view the current values for these constitutional parameters on the HQ app: [Q Parameters and Constitution](https://hq.q.org/q-parameters/constitution).

!!! note "Current Parameters"
    At the time of writing, `maxNValidators` = 27, and `maxNStandbyValidators` = 34. This means that currently, the top 61 validators are eligible for validation rewards.

### Rewards Inclusiveness

Unlike most EVM-compatible chains, where rewards often depend on various factors like uptime, performance, and sometimes random selection, Q employs a more inclusive strategy for its validators. On Q, all validators that make it into the "shortlist" are entitled to earn rewards.
The rewards for validators in the shortlist are proportional to their stake in the network. This means that the more you've staked, the higher your reward will be. 

!!! note "Validator slashing"
    While rewards are not contingent upon node performance or even uptime, operating an active validator node with unsatisfactory performance or uptime can result in the slashing of the validator's self stake. While the delegator's stake remains safe, it may affect delegation saturation, or kick the validator out of the validator shortlist, cutting its earnings altogether for the validator node and its delegators.

## Rewards Calculations

[As explained previously](/rewards-sources), currently 40% of the Q rewards from the Default Allocation Proxy are distributed among all validators. Each validator earns rewards from two sources:

- Self-stake
- Delegated stake

### Calculating Rewards Based on Stake

Rewards are calculated as a proportion of each validator's "accountable stake" relative to the global accountable stake across all validator nodes. For example, if a validator has an self-stake of 1,000 Q tokens, has no delegated stake, and the total validation stake is 1,000,000 Q tokens, that validator will receive 1/1000th, or 0.1%, of all validation rewards.

With the current block subsidy of 1.5 tokens per block, and current block time of 5 seconds, this would equate to a total validation rewards of 432 Q tokens each hour, meaning our hypothetical validator would earn 0.1% of 432 = 0.432 Q tokens per hour.

### Delegated Stake Calculation

Calculating rewards for delegated stake can be somewhat convoluted, as it involves a couple extra considerations:

- Delegation rewards *can* be limited if the validator node has reached "delegation saturation"
- The rewards earned from delegated stakes are split between the delegator and the validator

#### Delegation saturation

Validator nodes have a limit to how much delegation they can accept. This limit is defined by the `stakeDelegationFactor` constitutional parameter (under "Fees & Incentives Experts" on the Q HQ app). This factor describes the maximum accountable stake a validator can have, based on their self-stake. At the time of writing, this value is currently at 10. This means that a hypothetical validator with 1,000 Q tokens as self-stake can hold up to 10,000 accountable stake, and therefor 9,000 delegated stake (refer back to [this page](/dapp-staking) for more details on the different kinds of "stake").

"Delegation saturation" compares a validator's total stake with their maximum accountable stake. If a validator's total stake surpasses their maximum accountable stake (over 100% saturation), the delegated tokens past saturation don't earn extra rewards for neither the validator nor the delegator. They only dilute the rewards for the tokens that are effectively used.

#### Examples

In our previous example, if the validator with 1,000 Q tokens of self-stake has no delegated stake, its "delegation saturation" would be 1,000/10,000 = 0.1 = 10%.

If that same validator has 4,000 tokens of delegated stake, its delegation saturation would be (1,000 + 4,000) / 10,000 = 0.5 = 50%.

If that validator has 19,000 delegated stake, its delegation saturation would be (1,000 + 19,000) / 10,000 = 2.0 = __200% delegation saturation__, which means less delegation rewards than if the tokens were delegated to a non-saturated validator with similar delegator share.

#### Delegator share

For every Q token delegated (before saturation), rewards are generated as if they were self-stake. However, those rewards are then split between the "delegator", who delegated the tokens, and the validator.

Let's consider a scenario where the validator has set its delegator share to 90% (meaning, a validator share of 10%) and has sufficient self-stake to avoid reaching delegation saturation. If 1,000 Q tokens are delegated to this validator and the total validation stake is still 1,000,000 tokens, these delegated tokens will earn 0.1% of the total validation rewards. These rewards will then be split as follows:

- The validator will receive 10% of the 0.1%, which equates to an extra 0.01% of total validation rewards on top of their self-stake rewards.
- The delegator will receive the remaining 90% of the 0.1%, or 0.09% of the total validation rewards.

### In Short

Validator rewards calculation can be a complicated matter. But, in order to optimize your delegation rewards, look for those few metrics:

- *Delegation saturation*: Any delegation saturation __below 100%__ will generate full validation rewards for all delegators. Delegating __beyond__ saturation will only dilute delegation rewards from other delegators of this validator instead of generating new rewards.
- *Delegator/validator share*: The aforementionned delegation rewards are then split between the validator and the delegator, at a ratio set by the validator as "Delegator share" and "Validator share".

!!! warning
    This is not financial advice. Delegation is a complex topic that requires extensive research beyond the scope of this documentation. Neither the Q foundation, its development team, nor anyone involved in the Q ecosystem are liable for financial choices made based on this information.