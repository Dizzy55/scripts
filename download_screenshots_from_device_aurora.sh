#!/bin/bash

. common_aurora.sh

scp -r -i "${DEVICE_SSH_ID}" -o "StrictHostKeyChecking=no" "${DEVICE_SSH_USER}@${DEVICE_SSH_HOST}:/home/${DEVICE_SSH_USER}/Pictures/Screenshots" "./"

if [ $? -ne 0 ]; then
    echo "Can not connect to device or there are no screenshots"
    exit 1
fi
