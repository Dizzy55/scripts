#!/bin/bash

. ../common_sailfish.sh
. ../common.sh

sdk_cmd sdk-assistant list | grep -o 'SailfishOS-.*-[^.]*$' | while read TARGET; do
    PACKAGE=make

    echo
    echo "**** Installing ${PACKAGE} on ${TARGET} ****"
    sdk_cmd sb2 -t ${TARGET} -m sdk-install -R zypper --non-interactive install ${PACKAGE}
done
