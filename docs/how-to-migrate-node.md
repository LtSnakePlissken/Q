## Migrating Node to New Server

Migrating a Q-Client node to a new server can be a complex process, but with the right steps, it can be done smoothly.

The process of migrating a node will be shown for a validator node, but the same steps can be used for a root node or full node.

### Back up your node data

Before you begin migrating your node, it is important to back up all of your data, including your account keys, environment files, and any other important information. This will ensure that you do not lose any important data during the migration process.

Go to `validator` directory and run the following command to create a tar file of the directory.

```bash
$ tar -czvf node.tar.gz .
```

Save the tar file in a safe location. You can also use a tool such as `rsync` or `scp` to copy the data to a remote server.

### Prepare new server

Set up the new server according to the node requirements. Setup your validator node on the new server by following the instructions provided in the [Validator Node Setup](./how-to-setup-validator.md) guide.

### Copy data to new server

Copy the `node.tar.gz` file to the new server and extract it in the `validator` directory. You can use `scp` or `rsync` to copy the file to the new server.

After copying the file, extract it using the following command:

```bash
$ tar -xzvf node.tar.gz
```

After that, you can remove the `node.tar.gz` file from the `validator` directory.

Now you have all the validator data from the old server on the new server.

### Sync new node

Once the data has been copied to the new server, you can start the node and let it sync with the network. You can use the following command to start the node on the new server:

```bash
$ docker-compose down -v --remove-orphans && docker-compose up -d
```

> **Note:** To prevent double signing of blocks, which can lead to slashing, remove or comment the flag `--mine` in your `docker-compose.yaml`. After the complete syncing, activate `--mine` on your new server and restart the node there.

### Stop old node

Once the new node has synced with the network, you have to stop your old node. You can use the following command to stop the node on your old server:

```bash
$ docker-compose down -v --remove-orphans
```
