#!/bin/sh

# you can use this script to reset the blockchain data to a stakecraft snapshot
# This can be useful for faster catchup (instead of syncing from genesis block)
# or to rewind to a stable state when your own chain data is corrupt or your node is stuck otherwise.

# reset fullnode:
#    cd fullnode
#    docker-compose cp ../reset-to-snapshot.sh fullnode:/data
#    docker-compose run --rm --entrypoint /data/reset-to-snapshot.sh fullnode
# reset validator:
#    cd validator
#    docker-compose cp ../reset-to-snapshot.sh validator-node:/data
#    docker-compose run --rm --entrypoint /data/reset-to-snapshot.sh validator-node
# reset root node:
#    cd rootnode
#    docker-compose cp ../reset-to-snapshot.sh rootnode:/data
#    docker-compose run --rm --entrypoint /data/reset-to-snapshot.sh rootnode

TODAY=$(date +'%Y-%m-%d')
URL=https://snapshots.stakecraft.com/q-mainnet_${DATE:=$TODAY}.tar

rm -rf /data/geth/chaindata
mkdir -p /data/geth/chaindata
cd /data/geth/chaindata
echo start download from $URL
wget -O - $URL | tar xf -