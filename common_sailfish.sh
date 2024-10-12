#!/bin/bash

export SDK_ROOT="${HOME}/SailfishOS"
export SDK_SSH_HOST=localhost
export SDK_SSH_PORT=2222
export SDK_SSH_USER=mersdk
export SDK_SSH_ROOT=root
export SDK_SSH_ID="$SDK_ROOT/vmshare/ssh/private_keys/sdk"
export SDK_VM_NAME='Sailfish SDK Build Engine'
export SDK_TARGET_PATTERN='SailfishOS-.*-[^.]*$'
# FIXME: delete
export SDK_PACKAGE_VENDOR=jolla
export SDK_ZYPPER_CACHE_DIR=/home/.zypp-cache/packages/jolla/oss
export EMULATOR_SSH_HOST=localhost
export EMULATOR_SSH_PORT=2223
export EMULATOR_SSH_USER=defaultuser
export EMULATOR_SSH_ROOT=root
export EMULATOR_SSH_ID="$SDK_ROOT/vmshare/ssh/private_keys/sdk"
