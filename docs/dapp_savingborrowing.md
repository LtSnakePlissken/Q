# Saving & Borrowing

This dApp section is part of the integrated application DeFi. Technically, it is a dedicated application built on top of Q base layer and deeply integrated into Q governance (c.f. DeFi expert panel, Constitution). It offers two main features:

  1. Deposit a supported synthetic asset (e.g. QUSD) and earn interest rewards
  2. Deposit a supported digital asset as collateral and borrow a supported synthetic asset for a borrowing fee

## Saving Crypto Assets

Section "Saving Crypto Assets" covers the first feature. Click on "Manage" of the desired asset class to open the modal for deposit and withdraw functionalities. You will also be informed about the current saving balance (available for withdraw) and available funds for deposit. The interest rewards are received in a specific asset type and the yearly expected reward is shown based on the current annual saving rate.

> **Note: ** *Before you initially deposit your first QUSD, you have to approve contract interaction by entering the desired amount for deposit and clicking on "Approve". After successful transaction confirmation, you can again click on "Deposit" for triggering the deposit.*

## Borrow Crypto Assets  

Before depositing a supported collateral asset, you need to create a vault that is used for collateral deposit and fee management. To do this, click on the top-right cornered button "Create QBTC Vault". After successful transaction confirmation, a new vault will be created and displayed including some basic information. Clicking on "Manage" opens the "Borrowing QUSD" modal in which you can see all required information on the collateral asset, limits, fees and information on liquidation. You can also deposit and withdraw collateral or borrow and repay assets here.

> **Note: ** *Before you initially deposit your first collateral, you have to approve contract interaction by entering the desired amount for deposit and clicking on "Approve". After successful transaction confirmation, you can again click on "Deposit" for triggering the deposit.*

The idea behind borrowing is simple: you can borrow synthetic assets up to the borrowing limit for deposited collaterals. For system stability reasons, the borrowing limit is not equal but less than 100% of the collateral's value. This security buffer is used for price fluctuation. If the threshold (liquidation limit) is reached, the vault can be liquidated and its collateral will be auctioned to the highest bidder on Q system [see here](dapp_decentralizedauctions.md).

If a vault has been liquidated, it will be marked as such and can't be used for borrowing anymore. Also, the liquidated and auctioned collateral will be transferred to the highest bidder after the auction has ended.

Borrowing comes with a fee that is applied based on compound rate approach. You can withdraw your collateral after having re-payed the outstanding debt in synthetic asset (including fees).

> **Note: ** *Q reward rates are based on compound rate approach, meaning that rewards are calculated and aggregated until a transaction (e.g. a withdrawal) triggers a compound rate update combined with a reward pay-out. This implies that rates might change over time and reward estimates will be more imprecise the longer the time interval for estimation is and the more triggering transactions happen.*

## Obtaining QBTC

For borrowing synthetic assets like QUSD, you need to deposit a collateral such as QBTC. QBTC is wrapped BTC that was bridged from Ethereum to Q using a token bridge (or Omnibridge). A token bridgefor Q testnet is deployed and reachable at [https://bridge.qtestnet.org/](https://bridge.qtestnet.org/). This bridge bridges Q testnet with Rinkeby Testnet.

These are the steps you need to do in order to have QBTC in your MetaMask wallet:

1. Search for a faucet on Rinkeby network to retrieve WBTC
2. Go to `https://bridge.qtestnet.org` with MetaMask connected to Rinkeby Testnet
3. Enter the desired and available amount to be bridged in WBTC from Rinkeby to QBTC on Q
4. Wait for confirmation, change MetaMask back to Q testnet and verify your new Balance

If you can't see QBTC asset within MetaMask, you can either open Saving & Borrowing page in a fresh browser session (MetaMask will ask once to add both QUSD and QBTC to MetaMask if not added already) or you do it manually by entering a "Custom Token". You need to provide the QBTC contract address for this which can be found in the [dashboard's parameter list](dapp_dashboard.md#dashboard) under parameter `governed.EPDR.QBTC_address`.

Alternatively, Q testnet faucet allows to retrieve a small amount of QBTC for testing purposes. Please see [here](how_to_install_metamask.md#faucet) how this can be achieved.
