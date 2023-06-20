# Unlocking Address on Node

This brief tutorial demonstrates how to manually unlock your account by password prompt upon node start.

## Variables in Example

| **Variable Name** | **Description** |
|:--|:--|
| ubuntu | username on your server |
| example.com | hostname or ip address of your server |
| miner/ | path to the specific node content (e.g. /path_to/validator/) |
| keystorefile | encrypted file containing the private key required for unlocking |

## Manual

First, deploy `keystorefile` to server (can be skipped if node is run locally).


Linux, macOS, other Unix-like systems:
```bash
$ scp ./keystorefile ubuntu@example.com:miner/keystore/
```

Windows:

```
# This will copy the keystore file from the current directory to the remote miner/keystore directory on the example.com server, using the SCP protocol.

# Note that you will need to replace "example.com" with the actual hostname or IP address of the remote server, and "ubuntu" with the appropriate username for that server. 

Copy-Item -Path ".\keystorefile" -Destination "ubuntu@example.com:miner\keystore\" -ToSession (New-PSSession -ComputerName "example.com" -Credential "ubuntu")
```


Then connect to your server by ssh and change to node directory

Linux, macOS, other Unix-like systems:

```bash
$ ssh ubuntu@example.com
$ cd miner
```

Windows:

```
Enter-PSSession -ComputerName "example.com" -Credential "ubuntu"
Set-Location -Path "miner"
```


Then manually enter the password for decryption of your keystore (where `0x123abc...f` is the address from keystore file you deployed)

```bash
$ docker-compose exec node geth attach --datadir /data --exec personal.unlockAccount('0x123abc...f')
```

## Using of ready Script

```bash
./reset-passwd.sh -d example.com -r miner -l ./keystorefile
```
