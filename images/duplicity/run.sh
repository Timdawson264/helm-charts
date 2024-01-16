#!/bin/bash
set -euox pipefail

export GNUPGHOME=/tmp

if test -f /secret/gpgkey.pub; then
    gpg --import /secret/gpgkey.pub    
fi

#We stash the archive metadata into the .duplicity subpath mount. and exlude this from getting uploaded as a backup.
# /archive/ is a subpath mount of .duplicity in the attached PVC
#this keeps the backup and pvc all self contained so we dont need an extra PVC for metadata.

duplicity --allow-source-mismatch --gpg-options "--trust-model always" --tempdir /tmp --exclude /data/.duplicity --archive-dir /archive/ $BACKUP_ARGS /data $BACKUP_DESTINATION

