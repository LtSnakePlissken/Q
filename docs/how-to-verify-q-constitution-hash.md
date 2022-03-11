# How to verify the the Q constitution

The Q constitution is the underlying document for the agreement between Q stakeholders. It is therefore key to verify any document claiming to be the current version or an update of the current Q constitution. The hashing algorithm in use is SHA256 and the according hash (checksum) of each document version is anchored on the Q blockchain.

## Get the current constitution

You can choose the level of trust for the first step: For a minimum reliance on other nodes, setup and run your own Q fullnode and set up MetaMask to be able to interact with Your HQ later (see [fullnode setup tutorial](how_to_setup_fullnode.md) and [MetaMask tutorial](how_to_install_metamask.md)). For a higher level of trust, you can connect to the default node provided in the MetaMask tutorial and follow the discussions in the Q community.

As a next step, visit the ([Your HQ dApp](https://hq.q.org/) and check `Constitution Hash` on the dashboard. This is the hash of the current version. Click on `Download` to get to the latest version and save it. The constitution service provides a file in asciidoc format. This format allows for efficient ways to compare the content of different versions and to calculate the SHA256 hash of it. Further, a human readable format can be obtained by converting to PDF, HTML, etc.

As an example within this tutorial, let's assume you found the version `0x6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c` on the dashboard and downloaded the file `6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c.adoc` which corresponds to a Q constitution with SHA256 hash `6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c`. Please note that the prefix `0x` is added to the file name to get the identifier.

## Verify the constitution version hash

Using a console, go into the directory where the file is located.

On windows, type

```
certUtil -hashfile 6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c.adoc SHA256
```

On linux, type
```
shasum -a 256 6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c.adoc
```

If you are on Windows and refrain from using a console, you can use tools such as [Notepad++](https://www.technipages.com/how-to-generate-a-hash-in-notepad) or [7-zip](https://www.7-zip.org/).


The calculated hash should match the value observed on-chain.

## Read the constitution

You can compile a PDF document using [asciidoctor](https://asciidoctor.org/docs/asciidoctor-pdf/) on your local machine or using an online asciidoc viewer like  [Heroku](https://thetimetube.herokuapp.com/asciidoc/). For the latter, just copy & paste the content of the `*.adoc` file and click `Run (F9)`.

It will render a human readable version which you can print to PDF using the `Print` option in the top right.

## Update the constitution

Every update to the content of the current constitution file will change its hash. If you have to change the content, e.g. during a Q constitution update proposal on-chain, you have to first modify the content of the `*.adoc` file and then calculate the new hash.


> **Warning: ** *Windows and UNIX based operation systems use different line ending formats. This will result in different SHA256 hashes, even though the actual content is identical. UNIX based line endings are preffered. If you are on Windows, use a tool like Notepad++ and make sure the correct format is applied. See [this](https://support.nesi.org.nz/hc/en-gb/articles/218032857-Converting-from-Windows-style-to-UNIX-style-line-endings) for a tutorial.*


Once you have the updated version and calculated the hash, make the file(s) available for public review and [start a Q constitution update proposal](how_to_exercise_governance_rights.md).
