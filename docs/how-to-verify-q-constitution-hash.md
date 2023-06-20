# How to verify the Q Constitution

The Q constitution is the underlying document for the agreement between Q stakeholders. It is therefore key to verify
any document claiming to be the current version or an update of the current Q constitution. The hashing algorithm in use
is SHA256 and the according hash (checksum) of each document version is anchored on the Q blockchain.

## Get the current Constitution

You can choose the level of trust for the first step: For a minimum reliance on other nodes, setup and run your own Q
fullnode and set up MetaMask to be able to interact with Your HQ later (
see [fullnode setup tutorial](how-to-setup-fullnode.md) and [MetaMask tutorial](how-to-install-metamask.md)). For a
higher level of trust, you can connect to the default node provided in the MetaMask tutorial and follow the discussions
in the Q community.

As a next step, visit the ([Your HQ dApp](https://hq.q.org/) and check `Constitution Hash` on the dashboard. This is the
hash of the current version. Click on `Download` to get to the latest version and save it. The constitution service
provides a file in asciidoc format. This format allows for efficient ways to compare the content of different versions
and to calculate the SHA256 hash of it. Further, a human readable format can be obtained by converting to PDF, HTML,
etc.

As an example within this tutorial, let's assume you found the
version `0x6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c` on the dashboard and downloaded the
file `6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c.adoc` which corresponds to a Q constitution with
SHA256 hash `6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c`. Please note that the prefix `0x` is
added to the file name to get the identifier.

## Verify the Constitution Version Hash

Using a console, go into the directory where the file is located.

On windows, type

```
certUtil -hashfile 6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c.adoc SHA256
```

On linux, type

```
shasum -a 256 6e373b129fe2fd2e8ff0fa857df072d1324fda62e4b03ea4fb8431e3e15bcc1c.adoc
```

If you are on Windows and refrain from using a console, you can use tools such
as [Notepad++](https://www.technipages.com/how-to-generate-a-hash-in-notepad) or [7-zip](https://www.7-zip.org/).

The calculated hash should match the value observed on-chain.

## Read the Constitution

You can compile a PDF document using [asciidoctor](https://asciidoctor.org/docs/asciidoctor-pdf/) on your local machine
or using an online asciidoc viewer like  [Heroku](https://thetimetube.herokuapp.com/asciidoc/). For the latter, just
copy & paste the content of the `*.adoc` file and click `Run (F9)`.

It will render a human readable version which you can print to PDF using the `Print` option in the top right.

## Update the Constitution

Every update to the content of the current constitution file will change its hash. If you have to change the content,
e.g. during a Q constitution update proposal on-chain, you have to first modify the content of the `*.adoc` file and
then calculate the new hash.


> **Warning: ** *Windows and UNIX based operation systems use different line ending formats. This will result in
different SHA256 hashes, even though the actual content is identical. UNIX based line endings are preffered. If you are
on Windows, use a tool like Notepad++ and make sure the correct format is applied.
See [this](https://support.nesi.org.nz/hc/en-gb/articles/218032857-Converting-from-Windows-style-to-UNIX-style-line-endings)
for a tutorial.*


Once you have the updated version and calculated the hash, make the file(s) available for public review
and [start a Q constitution update proposal](how-to-exercise-governance-rights.md).

## Constiution storage

Since Q-client version 1.3.0 the constitution can be stored in the Q-client.

### Constitution storage Management

Set of methods to manage your constitution files.
Constitution storage allows you to store new constitution files and create requests for the required ones.
By default, all constitution files are stored in your `_datadir/constitution-storage_` folder.
However, you can specify other folder using flag *_--constitution-dir_=your_dir*.
This directory will contain constitution files and drafts.
Every file stored in this folder will be validated during node functioning.
If non-draft file doesn't have valid filename (with the pattern *_Q-Constitution-AB_AABBCCDD_*) - it will be deleted
automatically.
Also, if the hash of this file doesn't correspond to its filename and does not belong to valid constitution hashes - it
will be deleted as well.
You can store any amount of files in the _"./constitution-storage/drafts"_ folder until you decide to publish them.
All constitution files that you requested from your peers will be named and placed into the _"./constitution-storage"_
folder automatically.

Below is a list of methods for working with storage:

#### gov.addConstitutionFile

Allows you to add new constitution file.
File should be placed into the "./constitution-storage/drafts" directory inside the _datadir_.
Alternatively, as a parameter you can specify the URL of the file.
In this case, file will be downloaded and placed into Drafts folder automatically.
During execution this file will be validated - if hash of the file doesn't belong to blockchain - execution will be
reverted.

> gov.addConstitutionFile("5dfd08904f23e0497b291487319f07e32113f3c5bdc9c540adeb113019920c21.adoc")
> Validating constitution storage
> Constitution file with hash 0x5dfd08904f23e0497b291487319f07e32113f3c5bdc9c540adeb113019920c21 added successfully

or via URL

> gov.addConstitutionFile("https://constitution.q.org/constitution/latest")  
> Constitution file with hash 0x25a0ad3b8de911b1745691b83875291c75f424487551ec83f7ef9ae8205ef059 added successfully  
> The provided path is a URL. Trying to download a file

#### gov.requestForConstitutionFile

Command creates request for the constitution file.
If requested hash is valid, request will be added to queue.
As soon as one of your node's peer has requested file - it will be downloaded and added to the constitution storage.

> gov.requestForConstitutionFile("0x5dfd08904f23e0497b291487319f07e32113f3c5bdc9c540adeb113019920c21")
> Validating constitution storage
> Request for the constitution file with hash 0x5dfd08904f23e0497b291487319f07e32113f3c5bdc9c540adeb113019920c21
> created.
> Once one of your peers has file with the required hash - you'll be informed.

#### gov.constitutionFileRequests

Displays a list of your constitution file requests.
This list will become shorter every time you're getting requested file.

> gov.constitutionFileRequests()  
["0x5dfd08904f23e0497b291487319f07e32113f3c5bdc9c540adeb113019920c21"]

#### gov.constitutionFiles

Displays a list of constitution files which are present in your local constitution storage

> gov.constitutionFiles()  
[{
CreatedAt: 1677671307,  
hash: "0x5dfd08904f23e0497b291487319f07e32113f3c5bdc9c540adeb113019920c21",  
name: "Q-Constitution-AB_0x5dfd08.adoc"  
}]

#### gov.knownConstitutionFiles

Displays a list of constitution files which are known to your node.
This list is updated every time you're getting new constitution file.
If you're getting constitution file from your peer - it will be added to this list automatically.
If you're getting constitution file from the URL - it will be added to this list only if it's valid.
If some of your peers have more records in the known files list - you will be informed about it and will be able to
request this file from them.

> gov.knownConstitutionFiles()  
["0x25a0ad3b8de911b1745691b83875291c75f424487551ec83f7ef9ae8205ef059"]

----

If you're interested in getting a specific constitution file from the known files list - you can use the
_gov.requestForConstitutionFile_ command.