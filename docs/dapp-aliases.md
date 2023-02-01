# Account Aliasing

On the "Account Aliasing" page you can see currently used aliases for your/foreign accounts, manage your account aliases, and view alias events history.

By default aliases are displayed for your currently selected account. You can view other account aliases by entering its address to the address field and clicking on "Refresh" button.

## Reserve alias for your main account

Select your alias account in MetaMask and connect it to "Your HQ". Click “Reserve alias” button in the top-right corner. In the appeared modal enter your main account address, click “Reserve alias” and confirm the transaction in MetaMask.

## Set alias on your main account

Select your main node account in MetaMask and connect it to "Your HQ". Then click the “Manage” button under "Account aliases" table. You can see the update alias modal. Enter your alias account address there, click “Update” and confirm the transaction in MetaMask.

## Remove alias from main account

To remove alias account from your main node account select alias account in MetaMask and click “Reserve alias” button. In the appeared modal click “Unreserve” and confirm transaction in MetaMask.

## Aliases events

Under "Aliases events" block you can see all latest alias events with such information:

- Event - Reserved/AliasUpdated, depending on action type
- Main Account - Main account address for which alias is set up. Zero address corresponds to the default value (not set).
- Alias - Alias account address
- Role - BLOCK_SEALING/ROOT_NODE_OPERATION depending on alias role choosen in manage modal (not applicable to Reserved events)

You can filter all events to show only ones that correspond to your currently selected address by clicking on "Only current address" checkbox.
