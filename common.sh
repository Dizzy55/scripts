#!/bin/bash

function sdk_cmd {
echo "$@" | ssh \
    -q \
    -p $SDK_SSH_PORT \
    -i "$SDK_SSH_ID" \
    -o "StrictHostKeyChecking=no" \
    "$SDK_SSH_USER@$SDK_SSH_HOST"
}

function sdk_root_cmd {
echo "$@" | ssh \
    -q \
    -p $SDK_SSH_PORT \
    -i "$SDK_SSH_ID" \
    -o "StrictHostKeyChecking=no" \
    "$SDK_SSH_ROOT@$SDK_SSH_HOST"
}

function get_short_architecture {
    _architecture=$1

    if [ ${_architecture} == "aarch64-meego-linux-gnu" ]; then
       _arch="aarch64"
    elif [ ${_architecture} == "armv7hl-meego-linux-gnueabi" ]; then
       _arch="armv7hl"
    elif [ ${_architecture} == "x86_64-meego-linux-gnu" ]; then
       _arch="x86_64"
    elif [ ${_architecture} == "i486-meego-linux-gnu" ]; then
       _arch="i486"
    fi

    echo ${_arch}
}