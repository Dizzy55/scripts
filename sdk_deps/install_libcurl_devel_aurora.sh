#!/bin/bash

. ../common_aurora.sh

function sdk_cmd {
echo "$@" | ssh \
    -q \
    -p $SDK_SSH_PORT \
    -i "$SDK_SSH_ID" \
    -o "StrictHostKeyChecking=no" \
    "$SDK_SSH_USER@$SDK_SSH_HOST"
}

sdk_cmd sdk-assistant list | grep -o 'AuroraOS-.*-base-[^.]*$' | while read TARGET; do
    PACKAGE=libcurl-devel

    echo ""
    echo "**** Installing ${PACKAGE} on ${TARGET} ****"
    sdk_cmd sb2 -t ${TARGET} -m sdk-install -R zypper --non-interactive install ${PACKAGE}
done
