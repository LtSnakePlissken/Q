# Clef Tutorial

### initialization
First, you need to init clef dir to create masterseed

```bash
# CLEFDIR - directory with clef data (default: $HOME/.clef)
$ clef init --configdir CLEFDIR
```

![Screenshot](img/clef/init.png)


### "Unlocking" keystore
Then you should COPY your keystore file to keysotre folder
and add password to clef

```bash
$ cp keystoreFile KEYSTOREDIR
$ clef setpw --configdir CLEFDIR 0x123dead #password will prompted and decrypted by masterseed
```

### Rules
To accept or reject some requests create rule file:

```js
function ApproveListing() {
    return "Approve"
}
function ApproveTx(){
        return "Approve"
}
```

and then add checksum of rules file to clef

```bash
$ clef attest --configdir CLEFDIR $(sha256sum rules.js)
```

### Start service

```bash
$ clef --configdir CLEFDIR --keystore KEYSTOREDIR --chainid=35441 --rules=/data/rules.js
```

then you can use clef as signer in geth

```bash
$ geth ...YOUR FLAGS... --signer=CLEFDIR/clef.ipc
```

More info about clef can be found in the offcial [docs](https://geth.ethereum.org/docs/clef/tutorial).

# Demo

### sending tx with "unlocked" account
![Screenshot](img/clef/sendTxFromUnlocked.png)

![Screenshot](img/clef/sendTxFromUnlocked_clefLog.png)

![Screenshot](img/clef/sendTxFromUnlocked_gethLog.png)

### sending tx from "locked" account
rm password from clef

```bash
$ clef --configdir=CLEFDIR $address
```

![Screenshot](img/clef/sendTxFromLocked.png)

password prompted in clef

![Screenshot](img/clef/sendTxFromLocked_clefLog.png)
