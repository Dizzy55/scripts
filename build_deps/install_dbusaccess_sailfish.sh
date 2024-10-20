#!/bin/bash

. ../common_sailfish.sh
. ../common.sh

LIBRARY_NAME=dbusaccess
PACKAGE=libdbusaccess
. install_package.sh

LIBRARY_NAME=dbusaccess
PACKAGE=libdbusaccess-devel
. install_package.sh
