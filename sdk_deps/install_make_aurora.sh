#!/bin/bash

. ../common_aurora.sh
. ../common.sh

sdk_cmd sdk-assistant list | grep -o 'AuroraOS-.*-base-[^.]*$' | while read TARGET; do
    PACKAGE=make

    echo ""
    echo "**** Installing ${PACKAGE} on ${TARGET} ****"
    sdk_cmd sb2 -t ${TARGET} -m sdk-install -R zypper --non-interactive install ${PACKAGE}
done
