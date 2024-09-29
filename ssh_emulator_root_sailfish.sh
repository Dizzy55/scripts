#!/bin/bash

. common_sailfish.sh

ssh -p ${EMULATOR_SSH_PORT} -i "${EMULATOR_SSH_ID}" -o "StrictHostKeyChecking=no" ${EMULATOR_SSH_ROOT}@${EMULATOR_SSH_HOST}

if [ $? -ne 0 ]; then
    echo "Can not connect to emulator"
    exit 1
fi
