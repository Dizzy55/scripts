#!/bin/bash

. ../common_sailfish.sh
. ../common.sh

LIBRARY_NAME=qofonoext
PACKAGE=libqofonoext
. install_package.sh

LIBRARY_NAME=qofonoext
PACKAGE=libqofonoext-devel
. install_package.sh
