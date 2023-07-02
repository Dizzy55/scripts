#!/bin/bash

export SDK_ROOT="${HOME}/AuroraOS"
export SDK_SSH_HOST=localhost
export SDK_SSH_PORT=2222
export SDK_SSH_USER=mersdk
export SDK_SSH_ROOT=root
export SDK_SSH_ID="$SDK_ROOT/vmshare/ssh/private_keys/sdk"
export SDK_VM_NAME='Aurora Build Engine'
export EMULATOR_SSH_HOST=localhost
export EMULATOR_SSH_PORT=2223
export EMULATOR_SSH_USER=defaultuser
export EMULATOR_SSH_ROOT=root
export EMULATOR_SSH_ID="$SDK_ROOT/vmshare/ssh/private_keys/sdk"
export DEVICE_SSH_HOST=192.168.2.15
export DEVICE_SSH_USER=defaultuser
export DEVICE_SSH_ID="~/.ssh/id_rsa"
