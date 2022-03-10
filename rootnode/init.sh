#!/bin/sh

if [ ! -d "$DATADIR/geth" ]; then
  echo "Init genesis file....."
  mkdir -p $DATADIR/geth
  echo "$ENODE_KEY" >> $DATADIR/geth/nodekey
  geth --datadir=$DATADIR init $GENESIS_PATH
  echo "Initialization finished"
fi
