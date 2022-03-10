#!/bin/sh

host=""
localKeystorePath=""
remoteRootPath=""

while getopts "r:l:d:h" opt
do
case $opt in
r) remoteRootPath="$OPTARG";;
l) localKeystorePath="$OPTARG";;
d) host="$OPTARG";;
h) echo "./reset-passwd.sh -r remote/path/to/miner -l local/path/to/keystore -d hostname-or-ip";;
esac
done
if [ -z $localKeystorePath ]; then
    echo 'set localKeystorePath (-l ) parmater'
    exit 1
fi
if [ -z $remoteRootPath ]; then
    echo 'set remoteRootPath (-r )parmater'
    exit 1
fi
if [ -z $host ]; then
    echo 'set host (-d ) parmater'
    exit 1
fi
echo host=$host localKeystorePath=$localKeystorePath remoteRootPath=$remoteRootPath
address=`python3 -c "import json; addr = json.load(open('$localKeystorePath'))['address']; print(addr)" `
echo 0x$address

ssh ubuntu@$host "cd $remoteRootPath && docker-compose exec -T node rm /data/geth/nodekey"
ssh ubuntu@$host "cd $remoteRootPath && docker-compose down"

scp $localKeystorePath ubuntu@$host:$remoteRootPath/keystore/

ssh ubuntu@$host "cd $remoteRootPath && docker-compose up -d"

echo Password:
read -s password
ssh ubuntu@$host "cd $remoteRootPath && docker-compose exec -T node geth attach --datadir /data --exec \"personal.unlockAccount('0x$address', '$password')\" "

