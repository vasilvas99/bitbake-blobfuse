# Bitbake-hashserv in a docker container

This repo modifies the Dockerfile such that it mounts a azure blob storage and then uses this mount to store the hashserver database, thus
sharing it between bitbake-hashserv instances.

To build, run in the **repo root**:

```bash
    docker build . --file ./contrib/hashserv/Dockerfile
```

To then run the container:

```bash
    docker run -d -p 1234:1234 --privileged \
    -e AZURE_STORAGE_ACCESS_KEY="<blob-storage-key>" \
    -e AZURE_STORAGE_ACCOUNT="<account-name>" \
    -e AZURE_STORAGE_ACCOUNT_CONTAINER="<container-name>" \
    <container-hash>

```


Bitbake
=======

BitBake is a generic task execution engine that allows shell and Python tasks to be run
efficiently and in parallel while working within complex inter-task dependency constraints.
One of BitBake's main users, OpenEmbedded, takes this core and builds embedded Linux software
stacks using a task-oriented approach.

For information about Bitbake, see the OpenEmbedded website:
    https://www.openembedded.org/

Bitbake plain documentation can be found under the doc directory or its integrated
html version at the Yocto Project website:
    https://docs.yoctoproject.org

Contributing
------------

Please refer to
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
for guidelines on how to submit patches, just note that the latter documentation is intended
for OpenEmbedded (and its core) not bitbake patches (bitbake-devel@lists.openembedded.org)
but in general main guidelines apply. Once the commit(s) have been created, the way to send
the patch is through git-send-email. For example, to send the last commit (HEAD) on current
branch, type:

    git send-email -M -1 --to bitbake-devel@lists.openembedded.org

If you're sending a patch related to the BitBake manual, make sure you copy
the Yocto Project documentation mailing list:

    git send-email -M -1 --to bitbake-devel@lists.openembedded.org --cc docs@lists.yoctoproject.org

Mailing list:

    https://lists.openembedded.org/g/bitbake-devel

Source code:

    https://git.openembedded.org/bitbake/

Testing:

Bitbake has a testsuite located in lib/bb/tests/ whichs aim to try and prevent regressions.
You can run this with "bitbake-selftest". In particular the fetcher is well covered since
it has so many corner cases. The datastore has many tests too. Testing with the testsuite is
recommended before submitting patches, particularly to the fetcher and datastore. We also
appreciate new test cases and may require them for more obscure issues.
