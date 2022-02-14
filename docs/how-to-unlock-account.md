# Unlocking address on node


## variables in example

 ubuntu - username on your server
 example.com - hostname or ip addr o your server
 miner/ - path to node stuff


## Manual

In first, deploy keyfile to server(skip it if you run node locally)
```
scp ./keystorefile ubuntu@example.com:miner/keystore/
```

then connect to server by ssh and cd to node dir
```
ssh ubuntu@example.com 
cd miner
```

After this command enter password of your keystore 
```
docker-compose exec node geth attach --datadir /data --exec personal.unlockAccount('0x123abc...f')
# 0x123abc...f - eth address from keystore file you deployed
```


## Using of ready script

```
./reset-passwd.sh -d example.com -r miner -l ./keystorefile
```
