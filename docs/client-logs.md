
| Level | Name   | Meaning                                                               |
|-------|--------|-----------------------------------------------------------------------|
| 0     | silent | Completely hides all output logs                                      |
| 1     | error  | Shows only errors that can cause complete inoperability of the client |
| 2     | warn   | Shows logs in case something goes wrong                               |
| 3     | info   | General information about what is happening in the client's work      |
| 4     | debug  | Shows all that the client catches in his work                         |
| 5     | detail | Detailed information about values and decision flow                   |


The recommended initial configuration for verbosity is level 3. At this stage you have enough logs to track the client and get all the necessary information. Using levels 4 and 5, the number of records will be problematic to track in real time. This value is set in `docker-compose.yaml` in the entrypoint part "--verbosity=3"

# Starting the Client

```text
node_1  | INFO [09-28|14:46:05.919] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"
node_1  | INFO [09-28|14:46:05.919] Set global gas cap                       cap=50,000,000
node_1  | INFO [09-28|14:46:05.919] Allocated cache and file handles         database=/data/geth/gov-35441 cache=16.00MiB handles=16
node_1  | INFO [09-28|14:46:05.934] Allocated trie memory caches             clean=154.00MiB dirty=256.00MiB
node_1  | INFO [09-28|14:46:05.934] Allocated cache and file handles         database=/data/geth/chaindata cache=512.00MiB handles=524,288
node_1  | INFO [09-28|14:46:05.978] Opened ancient database                  database=/data/geth/chaindata/ancient readonly=false
node_1  | INFO [09-28|14:46:05.979] Initialised chain configuration          config="{ChainID: 35441 Homestead: 0 DAO: <nil> DAOSupport: false EIP150: 0 EIP155: 0 EIP158: 0 Byzantium: 0 Constantinople: 0 Petersburg: 0 Istanbul: 0, Muir Glacier: <nil>, Berlin: 0, London: <nil>, Engine: <nil>, HF001: clique}"
node_1  | WARN [09-28|14:46:05.979] Served eth_getCode                       reqid=1 t="43.083µs" err="the method eth_getCode does not exist/is not available"
node_1  | WARN [09-28|14:46:05.980] failed to check if contract registry was deployed err="the method eth_getCode does not exist/is not available"
node_1  | INFO [09-28|14:46:05.980] Initialising Ethereum protocol           network=35441 dbversion=<nil>
node_1  | INFO [09-28|14:46:05.981] Loaded most recent local header          number=0 hash=56f326..6e37bd td=1 age=2w4h34m
node_1  | INFO [09-28|14:46:05.981] Loaded most recent local full block      number=0 hash=56f326..6e37bd td=1 age=2w4h34m
node_1  | INFO [09-28|14:46:05.981] Loaded most recent local fast block      number=0 hash=56f326..6e37bd td=1 age=2w4h34m
node_1  | WARN [09-28|14:46:05.981] Served eth_getCode                       reqid=2 t="11.389µs" err="the method eth_getCode does not exist/is not available"
node_1  | WARN [09-28|14:46:05.982] Error reading unclean shutdown markers   error="leveldb: not found"
node_1  | INFO [09-28|14:46:05.982] Starting peer-to-peer node               instance=Q-Client/v1.0.8-stable/Geth/v1.10.8-stable-b2e2961d/linux-amd64/go1.16.15
node_1  | WARN [09-28|14:46:05.983] Served eth_getCode                       reqid=3 t="40.489µs" err="the method eth_getCode does not exist/is not available"
node_1  | WARN [09-28|14:46:05.983] failed to check if contract registry was deployed err="the method eth_getCode does not exist/is not available"
node_1  | INFO [09-28|14:46:05.983] Stored checkpoint snapshot to disk       number=0 hash=56f326..6e37bd
node_1  | WARN [09-28|14:46:05.983] Served eth_getCode                       reqid=4 t="9.472µs"  err="the method eth_getCode does not exist/is not available"
node_1  | WARN [09-28|14:46:05.984] failed to check if contract registry was deployed err="the method eth_getCode does not exist/is not available"
node_1  | WARN [09-28|14:46:05.984] Served eth_getCode                       reqid=5 t="9.203µs"  err="the method eth_getCode does not exist/is not available"
node_1  | WARN [09-28|14:46:05.984] failed to check if contract registry was deployed err="the method eth_getCode does not exist/is not available"
node_1  | INFO [09-28|14:46:05.999] New local node record                    seq=1 id=7da854359b1ff64e ip=YOUR_IP udp=30303 tcp=30303
node_1  | INFO [09-28|14:46:06.000] Mapped network port                      proto=tcp extport=30303 intport=30303 interface=ExtIP(YOUR_IP)
node_1  | INFO [09-28|14:46:06.000] Mapped network port                      proto=udp extport=30303 intport=30303 interface=ExtIP(YOUR_IP)
node_1  | INFO [09-28|14:46:06.001] IPC endpoint opened                      url=/data/geth.ipc
node_1  | INFO [09-28|14:46:06.001] Started P2P networking                   self=enode://YOUR_ENODE_ID@YOUR_IP:30303
node_1  | INFO [09-28|14:46:07.082] Unlocked account                         address=YOUR_ACCOUND_ADDRESS
```
Above is the basic log output when starting any client type (fullnode/root node/validator).

```text
node_1  | INFO [09-28|14:46:16.027] Looking for peers                        peercount=1 tried=1 static=0
node_1  | INFO [09-28|14:46:20.835] Imported new chain segment               blocks=1 txs=0 mgas=0.000 elapsed="776.77µs"  mgasps=0.000 number=1 hash=052567..354970 dirty=699.00B
node_1  | INFO [09-28|14:46:20.836] Commit new mining work                   number=2 sealhash=a6abc0..d74721 uncles=1 txs=0 gas=0 fees=0 elapsed="275.516µs"
node_1  | INFO [09-28|14:46:26.044] Looking for peers                        peercount=2 tried=0 static=0
node_1  | INFO [09-28|14:46:29.610] Imported new chain segment               blocks=1 txs=0 mgas=0.000 elapsed="905.051µs" mgasps=0.000 number=2 hash=65a32d..98d44f dirty=1.12KiB
node_1  | INFO [09-28|14:46:29.611] Commit new mining work                   number=3 sealhash=eb0759..f1af89 uncles=1 txs=0 gas=0 fees=0 elapsed="731.827µs"
```
The set of logs above shows that your node is looking to pull in the current state of the blockchain and retrieve data from other nodes in the network, and that retrieving the data is successful.

# Running a Validator after joining the Validator List

```text
node_1  | INFO [09-28|14:46:07.084] Successfully sealed new block            number=1 sealhash=60deff..86037c hash=433b61..746a84 elapsed="757.526µs"
node_1  | INFO [09-28|14:46:07.084] 🔨 mined potential block                  number=1 hash=433b61..746a84
node_1  | INFO [09-28|14:46:07.084] Commit new mining work                   number=2 sealhash=a6abc0..d74721 uncles=0 txs=0 gas=0 fees=0 elapsed="769.886µs"
node_1  | INFO [09-28|14:46:07.085] Signed recently, must wait for others
node_1  | INFO [09-28|14:46:16.027] Looking for peers                        peercount=1 tried=1 static=0
node_1  | INFO [09-28|14:46:20.835] Imported new chain segment               blocks=1 txs=0 mgas=0.000 elapsed="776.77µs"  mgasps=0.000 number=1 hash=052567..354970 dirty=699.00B
node_1  | INFO [09-28|14:46:20.836] Commit new mining work                   number=2 sealhash=a6abc0..d74721 uncles=1 txs=0 gas=0 fees=0 elapsed="275.516µs"
node_1  | INFO [09-28|14:46:26.044] Looking for peers                        peercount=2 tried=0 static=0
node_1  | INFO [09-28|14:46:29.610] Imported new chain segment               blocks=1 txs=0 mgas=0.000 elapsed="905.051µs" mgasps=0.000 number=2 hash=65a32d..98d44f dirty=1.12KiB
node_1  | INFO [09-28|14:46:29.611] Commit new mining work                   number=3 sealhash=eb0759..f1af89 uncles=1 txs=0 gas=0 fees=0 elapsed="731.827µs"
node_1  | INFO [09-28|14:46:34.833] Successfully sealed new block            number=3 sealhash=eb0759..f1af89 hash=eae446..578fda elapsed=5.222s
node_1  | INFO [09-28|14:46:34.834] 🔨 mined potential block                  number=3 hash=eae446..578fda
node_1  | INFO [09-28|14:46:34.835] Commit new mining work                   number=4 sealhash=be05aa..208f45 uncles=1 txs=0 gas=0 fees=0 elapsed=1.445ms
node_1  | INFO [09-28|14:46:34.836] Signed recently, must wait for others
node_1  | INFO [09-28|14:46:34.837] Imported new chain segment               blocks=1 txs=0 mgas=0.000 elapsed="804.275µs" mgasps=0.000 number=1 hash=1231b9..d9e652 dirty=1.57KiB
node_1  | INFO [09-28|14:46:34.838] Commit new mining work                   number=4 sealhash=be05aa..208f45 uncles=2 txs=0 gas=0 fees=0 elapsed="265.022µs"
node_1  | INFO [09-28|14:46:36.063] Looking for peers                        peercount=3 tried=0 static=0
node_1  | INFO [09-28|14:46:39.918] Imported new chain segment               blocks=1 txs=0 mgas=0.000 elapsed="827.464µs" mgasps=0.000 number=4 hash=d03fc2..a065c9 dirty=2.01KiB
node_1  | INFO [09-28|14:46:39.918] Commit new mining work                   number=5 sealhash=a4c587..da00ab uncles=2 txs=0 gas=0 fees=0 elapsed="569.475µs"
node_1  | INFO [09-28|14:46:44.982] Successfully sealed new block            number=5 sealhash=a4c587..da00ab hash=6b7134..a5d994 elapsed=5.063s
node_1  | INFO [09-28|14:46:44.982] 🔨 mined potential block                  number=5 hash=6b7134..a5d994
node_1  | INFO [09-28|14:46:44.983] Commit new mining work                   number=6 sealhash=7e13ec..e628c0 uncles=2 txs=0 gas=0 fees=0 elapsed="965.557µs"
node_1  | INFO [09-28|14:46:44.983] Signed recently, must wait for others
node_1  | INFO [09-28|14:46:46.084] Looking for peers                        peercount=3 tried=0 static=0
node_1  | INFO [09-28|14:46:49.004] Imported new chain segment               blocks=1 txs=0 mgas=0.000 elapsed="851.414µs" mgasps=0.000 number=6 hash=e3fc30..6869ef dirty=2.89KiB
node_1  | INFO [09-28|14:46:49.005] Commit new mining work                   number=7 sealhash=4f44d8..752747 uncles=2 txs=0 gas=0 fees=0 elapsed="861.611µs"
node_1  | INFO [09-28|14:46:49.006] no system txs
node_1  | INFO [09-28|14:46:49.007] Commit new mining work                   number=7 sealhash=dc61c0..584a55 uncles=2 txs=8 gas=168,000 fees=0.0084 elapsed=2.184ms
node_1  | INFO [09-28|14:46:54.001] Successfully sealed new block            number=7 sealhash=dc61c0..584a55 hash=17aa76..0393ad elapsed=4.993s
node_1  | INFO [09-28|14:46:54.001] 🔨 mined potential block                  number=7 hash=17aa76..0393ad
node_1  | INFO [09-28|14:46:54.002] Commit new mining work                   number=8 sealhash=786e69..90da58 uncles=0 txs=0 gas=0       fees=0      elapsed=1.214ms
node_1  | INFO [09-28|14:46:54.002] Signed recently, must wait for others
```

The logs above show the correct operation of the client for the miner. The in-turn node "🔨 mined potential block", waits for the signature of other validators and then waits for another validator to do the same.

# Running a Fullnode & Root Node

```text
node_1   | WARN [10-03|18:49:13.478] Served trace_block   conn=YOUR_IP:38636   reqid=9996   t="2.267µs"    err="the method trace_block does not exist/is not available"
node_1   | WARN [10-03|18:49:13.478] Served trace_block   conn=YOUR_IP:38636   reqid=9997   t="2.394µs"    err="the method trace_block does not exist/is not available"
node_1   | WARN [10-03|18:49:13.478] Served trace_block   conn=YOUR_IP:38636   reqid=9998   t="3.005µs"    err="the method trace_block does not exist/is not available"
node_1   | WARN [10-03|18:49:13.478] Served trace_block   conn=YOUR_IP:38636   reqid=9999   t="3.279µs"    err="the method trace_block does not exist/is not available"
node_1   | WARN [10-03|18:49:13.478] Served trace_block   conn=YOUR_IP:38636   reqid=10000  t="3.282µs"    err="the method trace_block does not exist/is not available"
node_1   | INFO [10-03|18:49:16.035] Imported new chain segment   blocks=1  txs=0   mgas=0.000 elapsed=4.424ms   mgasps=0.000   number=2,584,653 hash=eedf34..2551af dirty=0.00B
node_1   | INFO [10-03|18:49:16.070] no system txs
node_1   | WARN [10-03|18:49:16.273] Served eth_coinbase   conn=EXTERNAL_IP:50202 reqid=1   t="57.87µs"    err="etherbase must be explicitly specified"
node_1   | INFO [10-03|18:49:21.044] Imported new chain segment   blocks=1  txs=0   mgas=0.000 elapsed=4.659ms   mgasps=0.000   number=2,584,654 hash=410ad0..202ee9 dirty=0.00B
node_1   | INFO [10-03|18:49:21.079] no system txs
```

This set of logs is common for fullnode & root node operation.

# Frequent Startup Logs

```text
node_1  | INFO [09-28|14:46:05.919] Maximum peer count   ETH=50 LES=0 total=50
```
You get this output if the bootnode you are trying to connect to has currently reached the connection limit. In this case you can either wait and try again later or add the flag referring to one of our additional peers (`$BOOTNODE1_ADDR`, `$BOOTNODE2_ADDR`or `$BOOTNODE3_ADDR`) within `docker-compose.yaml` file:

```text
fullnode:
  image: $QCLIENT_IMAGE
  entrypoint: ["geth", "--bootnodes=$BOOTNODE_ADDR", "--datadir=/data", ...]
```

You may also encounter "bad peer" or another network id at the stage of searching for peers. In this case you can skip these logs completely. The client will keep searching for correct peers to connect with.

# How to understand that something goes wrong and what to do about it

Init error logs:

```
"no chain id specified", "No genesis block configured", "Failed to open local genesis", "Invalid genesis spec" or "not authorized to sign this account" can be encountered if you modified the docker-compose file or did not create a keystore, you can get rid of these errors if you follow the startup instructions.

"key generation: could not read from random source" it means that when trying to generate or connect a key to your account the path to it was not specified correctly

"could not decrypt key with given password" wrong password for account

"account already exists" means that this account is already in the keystore and there is no need to try to add it again

"key content mismatch: have account some_another_account, want your_account" "imported account has wrong address"  means that the .env file specifies a wallet that belongs to another keystore

"An error was encountered when saving and verifying the keystore file." means an error in the generation of the keystore, restart the generation, if the error appears again then write to us in Discord

"panic: reading from crypto/rand failed ..." "wrong error for invalid password" "Unexpected privkey: ..." this type of error means that the keystore password specified in the .env file does not сorrect
```

Errors that need restart of the container:

```
Corrupted database:
"Failed to read database stats"
"Failed to read database iostats"
"Failed to load head block"
"Gap in the chain, rewinding to genesis"
"Missing block in the middle, aiming genesis"
"Failed to commit recent state trie"
"Synced chain does not match checkpoint"
"Failed to derive block receipts fields"
"Database contains unaccounted data"
"Current full block number unavailable"
"Database compaction failed"
"Found bad hash, rewinding chain"
"Failed writing block to chain"
"Node state db entry with invalid length"
"########## BAD BLOCK #########"
"Failed to load old bad blocks"
"Failed to decode old bad blocks"
"Failed to load all bad blocks"

"Failed to decode node info"
"Invalid node field count"

"Low disk space. Gracefully shutting down Geth to prevent database corruption." Means that at this point the client can no longer save blockchain history, an increase in volume is required
```

# How to share your logs

```text
docker-compose logs validator-node > YOURNAME.log
```

The above command will save your logs from "validator" to the YOURNAME.log file. Replace with "fullnode" or "rootnode" according to the chosen node type.

```text
scp ubuntu@YOUR_MACHINE_IP:PATH/TO/LOGS/YOURNAME.log PATH/TO/LOCAL/STORAGE
```
This command will download the logs from your external machine.

