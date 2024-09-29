#!/bin/bash

. common_aurora.sh

ssh -p "${SDK_SSH_PORT}" -i "${SDK_SSH_ID}" -o "StrictHostKeyChecking=no" "${SDK_SSH_ROOT}@${SDK_SSH_HOST}"

if [ $? -ne 0 ]; then
    echo "Can not connect to build engine"
    exit 1
fi
