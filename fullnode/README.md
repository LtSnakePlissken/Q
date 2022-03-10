## Requirments

 ```
 docker
 docker-compose
 ```

## Prepare node (only once)

Copy the file `.env.example` to `.env` and configure to your needs.

Alternatively, you can set environment variables, e.g.

```
export EXT_PORT=<port for rpc, e.g 8545>
export EXPLORER_PORT=<port for explorer, e.g. 8080>
```

## Run node

```
docker-compose up -d
```

You can see the logs of your docker containers with

```
docker-compose logs -f --tail 100
```

_CTRL+C_ will exit from the logs, but not stop the containers.

The setup includes a local blockchain explorer.
You can browse blocks, transactions and accounts via your browser.
Open the url http://localhost:<port>
where port is the number you chose above for `EXPLORER_PORT`, e.g.
http://localhost:8080

## Stop node 

```
docker-compose stop
```

## Wipe node data 

```
docker-compose down -v
```
