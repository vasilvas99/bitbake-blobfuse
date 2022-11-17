#!/bin/bash

set -euo pipefail
set -o errexit
set -o errtrace
IFS=$'\n\t'
AZURE_MOUNT_POINT=/opt/cloud
# mount our blobstore
test ${AZURE_MOUNT_POINT}
rm -rf ${AZURE_MOUNT_POINT}
mkdir -p ${AZURE_MOUNT_POINT}

blobfuse ${AZURE_MOUNT_POINT} --use-https=true --tmp-path=/tmp/blobfuse/${AZURE_STORAGE_ACCOUNT} --container-name=${AZURE_STORAGE_ACCOUNT_CONTAINER} -o allow_other


cd $AZURE_MOUNT_POINT
python3 /opt/bbhashserv/bin/bitbake-hashserv -b 0.0.0.0:1234
