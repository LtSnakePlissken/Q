# System Parameters

Q blockchain is running and using multiple system contracts and system parameters. The latter define governance quorums, voting time periods, financial thresholds, reward allocation ratios and many other values that are crucial for a flexibly and soundly operating ecosystem Q.

System parameters are part of the Q constitution and can be changed by voting majorities through the Q governance and voting processes. Some of the parameters are `governed`, which means that experts take over the governance of these parameters, allowing to reduce the voting load of all Q token holders and outsourcing the parameter management to a defined (and voted) panel of experts.

## Q Constitution Parameters

| **Parameter Name** | **Description** |
|:--|:--|
| `constitution.cliqueEpochLength` | amount of blocks within each clique epoch, i.e. between two transition blocks |
| `constitution.EPDR.maxNExperts` | maximum number of members for the DeFi Expert Panel |
| `constitution.EPQFI.maxNExperts` | maximum number of members for the Q Fees & Incentives Expert Panel |
| `constitution.EPRS.maxNExperts` | maximum number of members for the Q Root Node Selection Expert Panel |
| `constitution.maxNRootNodes` | maximum number of root nodes within root node panel |
| `constitution.maxNStandbyValidators` | maximum number of standby validators |
| `constitution.maxNValidators` | maximum number of validators in validators short list |
| `constitution.proposalExecutionP` | The time window to execute a proposal after it has passed. |
| `constitution.rewardShareQIDHolders` | The share of all rewards (block subsidy, transaction fees, native application fees and slashed stake deposits) that Q ID Holders receive. |
| `constitution.rewardShareQTokenHolders` | The share of all rewards (block subsidy, transaction fees, native application fees and slashed stake deposits) that Q Token Holders receive. |
| `constitution.rewardShareRootNodes` | The share of all rewards (block subsidy, transaction fees, native application fees and slashed stake deposits) that Root Nodes receive.  |
| `constitution.rewardShareValidatorNodes` | The share of all rewards (block subsidy, transaction fees, native application fees and slashed stake deposits) that Validator Nodes receive.  |
| `constitution.rootSlashingAppealP` | The period after a root node slashing objection, during which the affected node has time to open a private arbitration legal case. |
| `constitution.rootSlashingReward` | The fraction of the slashing amount for root node slashing which the proposal initiator receives as reward in case of a successful slashing.  |
| `constitution.rootWithdrawP` | The withdraw has a target time window which needs to be elapsed before the withdrawal of root node stake can be triggered.  |
| `constitution.valSlashingAppealP` | The period after a validator slashing objection, during which the affected node has time to open a private arbitration legal case. |
| `constitution.valSlashingReward` | The fraction of the slashing amount for validator node slashing which the proposal initiator receives.  |
| `constitution.valWithdrawP` | The withdraw has a target time window which needs to be elapsed before the transfer of validator stake can be triggered.  |
| `constitution.voting.addOrRemRootQRM` | Required quorum for votings on proposals to add or remove a root node |
| `constitution.voting.addOrRemRootRMAJ` | Required majority for votings on proposals to add or remove a root node |
| `constitution.voting.addOrRemRootRNVALP` | Root node validation period for votings on proposals to add or remove a root node (to veto as root node) |
| `constitution.voting.addOrRemRootSMAJ` | Required super majority for votings on proposals to add or remove a root node |
| `constitution.voting.addOrRemRootSQRM` | Required super majority quorum for votings on proposals to add or remove a root node |
| `constitution.voting.addOrRemRootVP` | Voting Period for votings on proposals to add or remove a root node |
| `constitution.voting.basicQSectionQRM` | Required quorum for votings on proposals to change the constitution, basic part  |
| `constitution.voting.basicQSectionRMAJ` | Required majority for votings on proposals to change the constitution, basic part  |
| `constitution.voting.basicQSectionRNVALP` | root node validation period for votings on proposals to change the constitution, basic part  |
| `constitution.voting.basicQSectionVP` | Voting Period for votings on proposals to change the constitution, basic part  |
| `constitution.voting.changeQnotConstQRM` | Required quorum for votings on general Q update proposals |
| `constitution.voting.changeQnotConstRMAJ` | Required majority for votings on general Q update proposals |
| `constitution.voting.changeQnotConstRNVALP` | Root node validation period for votings on general Q update proposals |
| `constitution.voting.changeQnotConstVP` | Voting Period for votings on general Q update proposals |
| `constitution.voting.detailedQSectionQRM` | Required quorum for votings on proposals to change the constitution, detailed part  |
| `constitution.voting.detailedQSectionRMAJ` | Required majority for votings on proposals to change the constitution, detailed part  |
| `constitution.voting.detailedQSectionRNVALP` | Root node validation period for votings on proposals to change the constitution, detailed part (to veto as root node) |
| `constitution.voting.detailedQSectionVP` | Voting Period for votings on proposals to change the constitution, detailed part  |
| `constitution.voting.emgQUpdateQRM` | Required quorum for votings on emergency update proposals  |
| `constitution.voting.emgQUpdateRMAJ` | Required majority for votings on emergency update proposals  |
| `constitution.voting.emgQUpdateVP` | Voting Period for votings on emergency update proposals  |
| `constitution.voting.EPDR.addOrRemExpertQRM` | Required quorum for votings on proposals to add or remove an expert in DeFi Risk panel |
| `constitution.voting.EPDR.addOrRemExpertRMAJ` | Required majority for votings on proposals to add or remove an expert in DeFi Risk panel |
| `constitution.voting.EPDR.addOrRemExpertRNVALP` | Root node validation period for votings on proposals to add or remove an expert in DeFi Risk panel (to veto as root node) |
| `constitution.voting.EPDR.addOrRemExpertVP` | Voting Period for votings on proposals to add or remove an expert in DeFi Risk panel |
| `constitution.voting.EPDR.changeParamQRM` | Required quorum for votings on proposals to change parameter(s) managed by the DeFi Risk panel |
| `constitution.voting.EPDR.changeParamRMAJ` | Required majority for votings on proposals to change parameter(s) managed by the DeFi Risk panel |
| `constitution.voting.EPDR.changeParamRNVALP` | Root node validation period for votings on proposal to change parameter(s) managed by the DeFi Risk panel (to veto as root node) |
| `constitution.voting.EPDR.changeParamVP` | Voting Period for votings on proposals to change parameter(s) managed by the DeFi Risk panel |
| `constitution.voting.EPQFI.addOrRemExpertQRM` | Required quorum for votings on proposals to add or remove an expert in Q Fees & Incentives Expert panel |
| `constitution.voting.EPQFI.addOrRemExpertRMAJ` | Required majority for votings on proposals to add or remove an expert in Q Fees & Incentives Expert panel |
| `constitution.voting.EPQFI.addOrRemExpertRNVALP` | Root node validation period for votings on proposals to add or remove an expert in Q Fees & Incentives Expert panel (to veto as root node) |
| `constitution.voting.EPQFI.addOrRemExpertVP` | Voting Period for votings on proposals to add or remove an expert in Q Fees & Incentives Expert panel |
| `constitution.voting.EPQFI.changeParamQRM` | Required quorum for votings on proposals to change parameter(s) managed by the Q Fees & Incentives Expert panel |
| `constitution.voting.EPQFI.changeParamRMAJ` | Required majority for votings on proposals to change parameter(s) managed by the Q Fees & Incentives Expert panel |
| `constitution.voting.EPQFI.changeParamRNVALP` | Root node validation period for votings on proposal to change parameter(s) managed by theQ Fees & Incentives Expert panel (to veto as root node) |
| `constitution.voting.EPQFI.changeParamVP` | Voting Period for votings on proposals to change parameter(s) managed by the Q Fees & Incentives Expert panel |
| `constitution.voting.fundQSectionQRM` | Required quorum for votings on proposals to change the constitution, fundamental part  |
| `constitution.voting.fundQSectionRMAJ` | Required majority for votings on proposals to change the constitution, fundamental part  |
| `constitution.voting.fundQSectionRNVALP` | Root node validation period for votings on proposals to change the constitution, fundamental part (to veto as root node) |
| `constitution.voting.fundQSectionVP` | Voting Period for votings on proposals to change the constitution, fundamental part  |
| `constitution.voting.rootSlashingOBJP` | Target duration for how long an objection can be submitted after a root node has been slashed |
| `constitution.voting.rootSlashingQRM` | Required quorum for votings on proposals to slash a root node |
| `constitution.voting.rootSlashingRMAJ` | Required majority for votings on proposals to slash a root node |
| `constitution.voting.rootSlashingRNVALP` | Root node validation period for votings on proposals to slash a root node (to veto as root node) |
| `constitution.voting.rootSlashingSMAJ` | Required super majority for votings on proposals to slash a root node |
| `constitution.voting.rootSlashingSQRM` | Required super majority quorum for votings on proposals to slash a root node |
| `constitution.voting.rootSlashingVP` | Voting Period for votings on proposals to slash a root node |
| `constitution.voting.valSlashingOBJP` | Target duration for how long an objection can be submitted after a validator has been slashed |
| `constitution.voting.valSlashingQRM` | Required quorum for votings on proposals to slash a validator |
| `constitution.voting.valSlashingRMAJ` | Required majority for votings on proposals to slash a validator |
| `constitution.voting.valSlashingVP` | Voting Period for votings on proposals to slash a validator |
| `constitution.voting.EPRS.addOrRemExpertQRM` | Required quorum for votings on proposals to add or remove an expert in Q Root Node Selection Expert panel |
| `constitution.voting.EPRS.addOrRemExpertVP` | Voting Period for votings on proposals to add or remove an expert in Q Root Node Selection Expert panel |
| `constitution.voting.EPRS.addOrRemExpertRMAJ` | Required majority for votings on proposals to add or remove an expert in Q Root Node Selection Expert panel |
| `constitution.voting.EPRS.addOrRemExpertRNVALP` | Root node validation period for votings on proposals to add or remove an expert in Q Root Node Selection Expert panel (to veto as root node) |
| `constitution.voting.EPRS.changeParamVP` | Voting Period for votings on proposals to change parameter(s) managed by the Q Root Node Selection Expert panel |
| `constitution.voting.EPRS.changeParamRNVALP` | Root node validation period for votings on proposal to change parameter(s) managed by the Q Root Node Selection Expert panel (to veto as root node) |
| `constitution.voting.EPRS.changeParamRMAJ` | Required majority for votings on proposals to change parameter(s) managed by the Q Root Node Selection Expert panel |
| `constitution.voting.EPRS.changeParamQRM` | Required quorum for votings on proposals to change parameter(s) managed by the Q Root Node Selection Expert panel |

## Q Fees and Incentives Expert Panel (EPQFI) Parameters

| **Parameter Name** | **Description** |
|:--|:--|
| `governed.EPQFI.normalizedTransactionSize`| Used for gas price calculation |
| `governed.EPQFI.stakeDelegationFactor`| The validator’s accountable total stake (own stake + delegated stake) is capped by the validator’s own stake multiplied with this factor. |
| `governed.EPQFI.maximumDelegationTargets`| The maximum number of validators a staker can delegate his Q Tokens to |
| `governed.EPQFI.Q_reserveShare`| Share of fees allocated to Q Token holders which is (thereof) allocated to the Q System Reserve.  |
| `governed.EPQFI.Q_rewardPoolInterest`| The interest rate per block at which balances held in Q Vaults are rewarded out of the Q Token Holder reward pool |
| `governed.EPQFI.reserveCoolDownP`| Not more than above threshold can be withdrawn from system reserve within this cool down period. |
| `governed.EPQFI.txFee`| Transaction fee, based on a calculation of reasonable processing and storage costs plus margin (cost-plus) for Validator Nodes which execute transactions, denominated in (Q) USD |
| `governed.EPQFI.reserveCoolDownThreshold`| Not more than this threshold can be withdrawn within the cool down period. |
| `governed.EPQFI.Q_QUSD_source`| The oracle source address (which in turn can be based on multiple source) which is used for all conversions from Q to Q USD and vice versa within Q. The oracle uses Q as base currency and QUSD as quote currency (https://en.wikipedia.org/wiki/Currency_pair))

## Q DeFi Risk Expert Panel (EPDR) Parameters 

| **Parameter Name** | **Description** |
|:--|:--|
| `governed.EPDR.QBTC_QUSD_collateralizationRatio` | The overcollateralization required for this pair when opening or adding to a borrowing position|
| `governed.EPDR.QUSD_step` | Minimum amount of newly minted QUSD|
| `governed.EPDR.surplusAuctionP` | Duration of a surplus auction|
| `governed.EPDR.QBTC_QUSD_liquidationFee` | The fee charged in case of a liquidation|
| `governed.EPDR.QBTC_QUSD_ceiling` | The maximum amount of STC that can be issued with backing of COL|
| `governed.EPDR.QBTC_QUSD_interestRate` | The interest rate charged on borrowing positions of STC against COL|
| `governed.EPDR.QBTC_QUSD_liquidationRatio` | The ratio of COL to STC at which a liquidation will be triggered|
| `governed.EPDR.QUSD_savingRate` | The interest rate received on deposits on STC|
| `governed.EPDR.QUSD_surplusThreshold` | Amount of STC that must be exceeded before a surplus auction can be triggered|
| `governed.EPDR.liquidationAuctionP` | Duration of a liquidation auction|
| `governed.EPDR.reserveLot` | Amount of Q that can be auctioned in one go.|
| `governed.EPDR.QUSD_debtThreshold` | Amount of STC debt must be exceeded before a debt auction can be triggered|
| `governed.EPDR.QUSD_surplusLot` | Amount of STC that can be auctioned in one go.|
| `governed.EPDR.auctionMinIncrement` | Defines the percentage of increased bid increment|
| `governed.EPDR.debtAuctionP` | Duration of a debt auction|
| `governed.EPDR.QBTC_address` | The contract address of the collateral asset with symbol COL|
| `governed.EPDR.QBTC_QUSD_oracle` | The oracle source address (which in turn can be based on multiple source) which is used for all conversions from Q to Q USD and vice versa within Q|
