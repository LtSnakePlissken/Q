# Layer 0 Governance of Root Nodes

Usually, the Q governance takes place on-chain, but pure on-chain governance allows malicious nodes to gain control over
the network in case
they receive the on-chain majority. In such a case, maliciously acting validators can avoid loosing their majority by
transaction
blacklisting and censoring. To avoid this, Q introduces Layer 0 governance (or L0 governance). It's purpose is to allow
root nodes to find
countermeasures to heal and correct the on-chain governance structures in case it has been compromised by malicious
validators.

Currently, L0 governance allows to maintain two kinds of lists:

| **List name**            | **Description**                                                                                                                                                                     |
|:-------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Root node list           | This list contains public root node addresses and <br>determines who can sign L0 governance actions                                                                                 |
| Validator exclusion list | This list contains blacklist of public validator addresses.<br> Validators inside exclusion list can’t produce new blocks. For <br>each validator, block number of ban is specified |

**Precondition**

To perform L0 governance actions you need to understand how to access `q-client console`. You can access q-client
console by running
command `docker-compose exec node geth attach data/geth.ipc` on the node with unlocked root node account.

## Updating the Root Node Lists

First of all it is good to understand how to see current active root node list.

### See active Root Node List

Run:

    gov.activeRootList()

Example Output:

    {
      hash: "0xcf6fb61fc8120e3ca17a8de6cfa03b61c0a39f62c12134c9268e43d91149918b",
      nodes: ["0x6a39b688d591ea00c9ea69658438794204b5cc62", "0x64d4edefe8ba86d3588b213b0a053e7b910cad68", "0x4a14d788d86d021670ebcece1196631d66595984"],
      signers: ["0x6a39b688d591ea00c9ea69658438794204b5cc62", "0x4a14d788d86d021670ebcece1196631d66595984", "0x64d4edefe8ba86d3588b213b0a053e7b910cad68"],
      timestamp: 1641484005
    }

Description:

- hash - contains unique hash for root nodes and timestamp
- nodes - contains list of public addresses of root nodes in the list
- signers - contains list of public addresses of root nodes that signed this list
- timestamp - contains time when the root node list was proposed (could be specified when proposing new root node list)

Active L0 root node list is not always the same as on-chain. Usually after adding root node using voting, we need to
propagate new root node
list via L0 governance. Let’s say we added address `0xF691ea2E16B1017CE4893C2D2b91e745a3E501ad` as a root node, now
on-chain root node list
contains four addresses instead of three. To check it we can use another L0 governance method.

### See current on-chain Root Node List

Run:

    gov.onchainRootList()

Example Output:

      {
        hash: "0xaff40e792ce2205e7c94c5a944aa80b7945036094f3a464e98b15d1bb8f761d7",
        nodes: ["0xf691ea2e16b1017ce4893c2d2b91e745a3e501ad", "0x6a39b688d591ea00c9ea69658438794204b5cc62", "0x64d4edefe8ba86d3588b213b0a053e7b910cad68", "0x4a14d788d86d021670ebcece1196631d66595984"],
        signers: null,
        timestamp: 1641529405
      }

As you can see, now we have four addresses in `nodes` section. But it would be much easier to see only the difference
between `active`
and `on-chain` root node lists. For this we have another method.

### See difference between active and on-chain Root Node Lists

Run:

      gov.diffRootList("active", "onchain")

Example Output:

      [{
          Diff: null,
          Name: "active"
      }, {
          Diff: ["0xf691ea2e16b1017ce4893c2d2b91e745a3e501ad"],
          Name: "onchain"
      }]

Description:

- first object - contains addresses from active list but not from on-chain list
- second object - contains addresses from on-chain list but not from active list

Output means that if on-chain list is adopted, active list will contain new
address (`0xF691ea2E16B1017CE4893C2D2b91e745a3E501ad`).

Now let’s set new active root list. To do so one root node should propose new list and others should accept it.

### Propose new Root Node List based on on-chain Root List

Run:

      gov.proposeOnchainRootList()

Example Output:

      "0x55e82161cb160f29215ee89b4d35f5f0ebeaf83996ebb2f0ef6481087d2507a6"

This proposes a new RootList based on the current on-chain root list. If you want to manually propose a root list,

run:

      gov.proposeRootListUpdate({
      nodes: [
        "0xfd3ba4c7ebda55c038316c776f2479b2909da7a5",
        "0xbada551878e60b7d9173452695c1b3d190c3a3dc",
        "0x0ab8d42796bc11a0c028a25a79cf31d8eabc65cd"
      ],
      timestamp: 1647852102
      })

To verify the proposed root list, use this command:

Run (if another root node has proposed the list):

      gov.proposedRootList()

Run (if you have proposed the root list yourself):

      gov.desiredRootList()

Example Output:

      {
        hash: "0xa812273de092fdf8cf27a5311008a0bf714691c38d6737a62ea40c0a76c2532f",
        nodes: ["0xf691ea2e16b1017ce4893c2d2b91e745a3e501ad", "0x6a39b688d591ea00c9ea69658438794204b5cc62", "0x64d4edefe8ba86d3588b213b0a053e7b910cad68", "0x4a14d788d86d021670ebcece1196631d66595984"],
        signers: ["0x64d4edefe8ba86d3588b213b0a053e7b910cad68"],
        timestamp: 1641529675
      }

We can see list of new root node addresses and who signed it. But usually to make a decision, we need to check only
if `on-chain` list is
the same as `proposed` list.

### See difference between proposed and on-chain Root Node Lists

Run:

      gov.diffRootList("proposed", "onchain")

Example Output:

      [{
          Diff: null,
          Name: "proposed"
      }, {
          Diff: null,
          Name: "onchain"
      }]

If `Diff` parameter for both objects is `null`, then it means that both lists contain the same list of addresses.

Now, we are sure that proposed list contains all addresses from on-chain root node list and we can accept it.

### Accept proposed Root Node List

Run:

      gov.acceptProposedRootList()

This action will sign the proposed root node list and propagate it to other nodes. Once there is enough
signatures, `proposed` root node list will become `active` and will reflect what we have `on-chain`.

## Updating the Validator Exclusion List

Before updating we can check current exclusion list.

### See current Validator Exclusion List

Run:

      gov.activeExclusionList()

Example Output (one validator excluded):

      {
        hash: "0x5cc23f76da89c61f7b0ffbc09f101b96e02484d6f01689b7e4f31efc5057c31a",
        signers: ["0x64d4edefe8ba86d3588b213b0a053e7b910cad68", "0x6a39b688d591ea00c9ea69658438794204b5cc62", "0x4a14d788d86d021670ebcece1196631d66595984"],
        timestamp: 1641484876,
        validators: [{
            address: "0x4a14d788d86d021670ebcece1196631d66595984",
            block: 5301,
            endBlock:6000
        },
        validators: [{
        address: "0x64d4edefe8ba86d3588b213b0a053e7b910cad68",
        block: 4000
        }]
      }      

Example Output (no validators excluded):

      {
        hash: "0x7dc4f6d05d3921da619635b412c54c20b73a0725117c1f42d512ac131809afbf",
        signers: ["0x4a14d788d86d021670ebcece1196631d66595984", "0x64d4edefe8ba86d3588b213b0a053e7b910cad68", "0x6a39b688d591ea00c9ea69658438794204b5cc62"],
        timestamp: 1641561131,
        validators: null
      }

If we want to update validator exclusion list, we can do it by creating proposal on L0 by root node account.

### Propose Validator Exclusion List Update

Run:

      gov.proposeExclusionListUpdate({
        validators: [
          {
            "address": "0x4a14d788d86d021670ebcece1196631d66595984",
            "block": 5304,
            "endBlock":6000
          }
          {
            "address": "0x64d4edefe8ba86d3588b213b0a053e7b910cad68",
            "block": 4000
          }
        ],
        timestamp: 1641561132
      })

Example Output:

      "0x7dc4f6d05d3921da619635b412c54c20b73a0725117c1f42d512ac131809afbf"

In this example we proposed to ban validator with address `0x4a14d788d86d021670ebcece1196631d66595984` on block `5304`.
This means that
starting from block `5304` validator won't be able to produce new blocks. However, you can specify the end block of the
ban. In our example
this is `endBlock:6000`. End block is optional. If this block is set - validator will be able to produce blocks again
after block `6000`.
In the output we get proposal hash.

After one root node proposed update, this proposal should be available on other nodes. To check it, we can call another
method to see
proposed root list.

### See proposed Validator Exclusion List

Run:

      gov.proposedExclusionList()

Example Output:

      {
        hash: "0xd175110816f3b26afa597d789506f9a36781ff9fb884d8c7df4797c08b9ad0a1",
        signers: ["0x64d4edefe8ba86d3588b213b0a053e7b910cad68"],
        timestamp: 1641561132,
        validators: [{
            address: "0x4a14d788d86d021670ebcece1196631d66595984",
            block: 5304
        }]
      }

Now, we are sure that proposed list contains all required addresses and we can accept it.

### Accept proposed Exclusion List

Run:

      gov.acceptProposedExclusionList()

This action will sign the proposed validator exclusion list and propagate it to other nodes. Once there is enough
signatures, `proposed` validator exclusion list will become `active` and validators in the list won’t be able to produce
blocks.

### Human-friendly exclusion lists output.

For all exclusion list types there is a method that prints more human-friendly representation of the list:

    gov.activeExclusionListPrettify()
    gov.proposedExclusionListPrettify()

Example output:

    Hash: 0x43b8e41f1850ae7e521bf05d2853285ab0dbe3a2bb425a747f89eb8f580d20b4
    Timestamp(created at): 1668164617 (2022-11-11 13:03:37 +0200 EET)
    Signers:
        0x64D4edeFE8bA86d3588B213b0A053e7B910Cad68
        0x4a14D788D86D021670EBcecE1196631d66595984
    Validators:
        0x6267c22E0fAB9B071a6e9e3910739D6B07DE6a84:
            #2115546        (active, open-ended)
        0xE3EA34d3Dcc9B8d45B13e117eB13d5B45249E196:
            #2115546        (active, open-ended)
        0xF55c02b021f91752521C0cB74303565f25BAcCb1:
            #2115546        (active, open-ended)

### Root node whitelist co-signing

Each time Root node receives the transition block (end of each epoch) it should sign this block and send signature to
its peers. No matter
if you are a root node, you will get those signatures from other root nodes. To check signatures you can use the
follwing methods:

#### gov.getRootNodeApprovals

Prints rootnode approvals for the latest transition block.
By default, with no params provided - returns signatures of the latest block.
If only one parameter specified (`blockNumber`) - returns signatures of specified block.
Second parameter - `hash` - hash of the required block.
Usage of both `blockNumber` and `hash` is forbidden.

Usage example:

    gov.getRootNodeApprovals()

Example output

     [{
        blockNumber: 2085347,
        hash: "0x8d1d9cb767b87bd97e3639e1558921014e0bb67d567c7a3189dc651caa5a0674",
        signature: "zxNakquu/N6zfWgBqqJBiKt+tATpD4PcIBUEL8VvFyMw0s9KDXq/MVc81QfQd2BUkIpbnvG9vYw2JS2L2O0K5AA=",
        signer: "0xa713a6d7a695c95eb4eafdd588b170a17bf64a58"
    }, {
        blockNumber: 2085347,
        hash: "0x8d1d9cb767b87bd97e3639e1558921014e0bb67d567c7a3189dc651caa5a0674",
        signature: "H7CF0pqD7LywYEKiZ2roNPixz2AfvXWAHPkQRsAS8jUQ+UaUvjRy7GVRVf9NhbbZ4cjuyUb85AFz6LVigPVXygE=",
        signer: "0xe3d50388f8136eac453229d0f88e377a2eb5a80b"
    }]

With block hash specified:

    gov.getRootNodeApprovals(null,"0xba93726efe1681c086f32e242ca39d62b9755599038f80fabe5b56b0b083a3b1")

Example output

    [{
        blockNumber: 2085246,
        hash: "0xba93726efe1681c086f32e242ca39d62b9755599038f80fabe5b56b0b083a3b1",
        signature: "J1oJyfw6DbQRVUb4wI8iXOUJMd5O2FtwZzZaItWuuwUHmo45qvFD3ccmOKcYPMSQsfHPCdF9lXcZLsDXOGp3UgE=",
        signer: "0xe3d50388f8136eac453229d0f88e377a2eb5a80b"
    }, {
        blockNumber: 2085246,
        hash: "0xba93726efe1681c086f32e242ca39d62b9755599038f80fabe5b56b0b083a3b1",
        signature: "GHZqFYSD5bSgkLgJvOX03GJ+lOUrP6p6hBySD2lIfENt9oVIfXrcV4LwQiU0OQ7aI0LPDoM3AsBlCIZsRN4CRAE=",
        signer: "0xa713a6d7a695c95eb4eafdd588b170a17bf64a58"
    }]

With block number specified

    gov.getRootNodeApprovals(2085246)

Example output

    [{
        blockNumber: 2085246,
        hash: "0xba93726efe1681c086f32e242ca39d62b9755599038f80fabe5b56b0b083a3b1",
        signature: "J1oJyfw6DbQRVUb4wI8iXOUJMd5O2FtwZzZaItWuuwUHmo45qvFD3ccmOKcYPMSQsfHPCdF9lXcZLsDXOGp3UgE=",
        signer: "0xe3d50388f8136eac453229d0f88e377a2eb5a80b"
    }, {
        blockNumber: 2085246,
        hash: "0xba93726efe1681c086f32e242ca39d62b9755599038f80fabe5b56b0b083a3b1",
        signature: "GHZqFYSD5bSgkLgJvOX03GJ+lOUrP6p6hBySD2lIfENt9oVIfXrcV4LwQiU0OQ7aI0LPDoM3AsBlCIZsRN4CRAE=",
        signer: "0xa713a6d7a695c95eb4eafdd588b170a17bf64a58"
    }]

