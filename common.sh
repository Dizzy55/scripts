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
