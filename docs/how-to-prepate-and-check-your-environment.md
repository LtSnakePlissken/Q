## Setup your Server

The Q Node is required to run on a server or (virtual) machine. One possibility is to use a local machine, alternatively you can use a cloud instance on AWS for example. A good external tutorial on how to get started with Ethereum on AWS can be found [here](https://medium.com/@pilankar.akshay3/how-to-setup-a-ethereum-poa-private-proof-of-authority-ethereum-network-network-on-amazon-aws-5fdf56d2ad93) also you sould open custom port range 30300-30400 to be able to connect to nodes from outside and 8000-8999 to run an rpc and wss endpoint. Any other  machine will work as well if it meets the following requirements:

  - Linux machine with SSH access;
  - Min. 1(v)Core (x86), 20 GB storage and 2 GB RAM;
  - Rec. 2(v)Cores (x86), 30 GB storage and 4 GB RAM;
  - Installed applications: docker, docker-compose, git (optional).

Guide how to install [docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04) and [docker-compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04) could be found by the links.
 
### Check your setup

Check that your node has access to outside:

    docker-compose run --rm --entry "ping 8.8.8.8" validator/rootnode/fullnode
expected result:

    Creating miner1_node_run ... done
    PING 8.8.8.8 (8.8.8.8): 56 data bytes
    64 bytes from 8.8.8.8: seq=0 <...>
    64 bytes from 8.8.8.8: seq=1 <...>
    64 bytes from 8.8.8.8: seq=2 <...>
    64 bytes from 8.8.8.8: seq=3 <...>
    
possible errors:

        Permission denied - to fix this run docker comand with sudo or update docker permissions by sudo usermod -aG docker $USER
        Can't find a suitable configuration file in this directory or any parent - switch to the directory that contains your docker-compose file, e.g. cd testnet-public-tools/rootnode
