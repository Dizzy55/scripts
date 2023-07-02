#!/bin/bash

. common_aurora.sh

ssh -i "${DEVICE_SSH_ID}" -o "StrictHostKeyChecking=no" ${DEVICE_SSH_USER}@${DEVICE_SSH_HOST}

if [ $? -ne 0 ]; then
    echo "Can not connect to device"
    exit 1
fi
