# How to obtain a Loan against a Collateral

## Setup MetaMask and Your HQ

On the Q network, you can take a loan in the QUSD against collateral (QBTC, QUSDC, QDAI etc.) and use these assets for your aims. To do this you must have a MetaMask account and collateral tokens in your wallet. We will use QBTC token as a collateral asset in this tutorial.

First, go to the dApp [*Your HQ*](https://hq.q.org/). Complete the installation by following the instructions on the website or following this [tutorial](how-to-install-metamask.md) to set up your MetaMask account.

## Account Funding

You must have Q and QBTC tokens within your wallet. There are several options how you can achieve this:

- Buy QBTC from someone else, e.g. on an exchange
- Provide goods or services and accept QBTC as payment asset
- Receive tokens from someone else, e.g. friends & families

## QBTC Vault

To start go to the *Saving and Borrowing* tab within Your HQ website mentioned in step 1 and select *Borrowing tab*. Choose an asset pair you want to interact with, e.g. QBTC-QUSD. Create a new QBTC vault by clicking on the appropriate button. After successful signing of the according transaction via MetaMask and its successful confirmation, you can now see the newly created vault and interact with it by clicking "Manage" button on its top-right corner. You will see four sections in the modal: Deposit, Borrow, Repay, and Withdraw.

### Deposit

Here is displayed information about your locked QBTC. "Collateral" is your already deposited QBTC amount. "Price" is the actual price of BTC on the exchange. "Liquidation price" is based on your borrowing value. "Liquidation limit" is a minimum safe rate of the asset price.

To deposit QBTC enter the desired amount, click "Deposit" and confirm transaction in MetaMask.

> Note: When making the deposit first time you need to allow the contract to use your collateral tokens by clicking "Approve" button and confirming transaction in MetaMask.

### Borrow

Here you can borrow QUSD tokens backed up by your deposit. "Borrowing Fee (p.a.)" displays per annual rate of fees you need to pay by borrowed QUSD. "Borrowed" displays your current ratio between already borrowed QUSD and your borrowing limit.

To borrow QUSD enter the desired amount, click "Borrow" and confirm transaction in MetaMask.

> Note: If the asset price falls below the liquidation limit, your collateral will be put up on the decentralized auctions.

### Repay

If you no more need your borrowed QUSD you can repay them using "Repay" tab. Here you can see your QUSD balance as well as outstanding debt for your current vault.

To repay your borrowed QUSD enter the desired amount, click "Repay" and confirm transaction in MetaMask.

### Withdraw

If you want to withdraw collateral tokens from borrowing vault back to your wallet use "Withdraw" tab.

To withdraw your deposited QBTC enter the desired amount, click "Withdraw" and confirm transaction in MetaMask.

> Note: Amount to withdraw depends on your borrowed QUSD amount. To withdraw the entire amount make sure you fully repayed the outstanding debt.
