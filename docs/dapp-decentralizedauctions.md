# Decentralized Auctions

This dApp section is part of the integrated application DeFi. Technically, it is a dedicated application built on top of Q base layer and deeply integrated into Q governance (c.f. DeFi expert panel, Constitution). Decentralized auctions are the vehicle to maintain the DeFi system's stability.

There are three different types of auctions:

  - Liquidation: for borrowing vault liquidation auctions
  - System Debt: If DeFi system significantly lacks of synthetic asset (e.g. QUSD), any user can bid in QUSD to receive a lot of Q tokens
  - System Surplus: If DeFi system significantly created a surplus in synthetic asset (e.g. QUSD), these tokens can be purchased by bidding Q tokens to receive a certain lot size of synthetic asset

Auctions don't happen automatically, they need to be triggered by any user within Q system. Auctions can only be triggered if certain thresholds or limits are reached. Whereas this (collateral price) limit for borrowing vaults is depending on the collateralized asset's price, both system dept and surplus auctions are framed by a set of parameters that define thresholds, lot sizes and others. Please check the [Q DeFi Risk Expert Panel parameter list](dapp-dashboard.md#dashboard) for a list of all relevant parameters.

## Information Boxes

### Auction Stats

Shows your available Q balance according to the connected wallet account as well as funds in Q vault and synthetic asset balance (QUSD). A click on "Manage" will redirect you to [Q vault](dapp-qvault.md).

### QUSD System Balance

Shows different balances of DeFi application, like collected surplus and open debt as well as actual balance in QUSD and the surplus auction lot size as per system parameter `governed.EPDR.QUSD_surplusLot`.

A click on "Perform Netting" will net out surplus with open debt without initiating an auction.

### Q System Reserve

The Q System Reserve collects Q from multiple sources and can be used to maintain the overall systems stability. The reserve balance shows the overall available funds whereas "Immediately Available" shows the funds that can be used by DeFi application at this very moment, e.g. for auctioning Q to get QUSD. The Debt Auction lot defines the lot size of Q per auction.

## Liquidation

When a borrowing vault is free for liquidation due to price fluctuation of collateralized assets, you can create a liquidation auction with button "Create Liquidation Auction" in the top right corner of the screen. A modal opens up and allows to enter

- Address of vault owner
- Vault ID
- Your initial bid in QUSD

After successful transaction confirmation, the auction is started and will remain open until auction time has ended (`governed.EPDR.liquidationAuctionP`). It will be visible under "Active Auctions" until it has ended and everyone interested will be able to put a bid on it. "Ended Auctions" can be searched as well.

## System Debt

When the system dept overpasses the threshold (`governed.EPDR.QUSD_debtThreshold`) and netting is not possible, any Q token holder can initiate a system debt auction with button "Create System Debt Auction" in the top right corner of the screen. A modal opens up and allows to enter the initial bid in QUSD for the defined auction lot in Q.

After successful transaction confirmation, the auction is started and will remain open until auction time has ended (`governed.EPDR.debtAuctionP`). It will be visible under "Active Auctions" until it has ended and everyone interested will be able to put a bid on it. "Ended Auctions" can be searched as well.

## System Surplus

When the system surplus overpasses the threshold (`governed.EPDR.QUSD_surplusThreshold`) and netting is not possible, any Q token holder can initiate a system debt auction with button "Create System Surplus Auction" in the top right corner of the screen. A modal opens up and allows to enter the initial bid in Q for the defined auction lot in QUSD.

After successful transaction confirmation, the auction is started and will remain open until auction time has ended (`governed.EPDR.surplusAuctionP`). It will be visible under "Active Auctions" until it has ended and everyone interested will be able to put a bid on it. "Ended Auctions" can be searched as well.
