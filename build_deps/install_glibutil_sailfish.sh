#!/bin/bash

. ../common_sailfish.sh
. ../common.sh

LIBRARY_NAME=glibutil
PACKAGE=libglibutil
. install_package.sh

LIBRARY_NAME=glibutil
PACKAGE=libglibutil-devel
. install_package.sh
