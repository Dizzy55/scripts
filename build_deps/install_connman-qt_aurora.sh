#!/bin/bash

. ../common_aurora.sh
. ../common.sh

LIBRARY_NAME=connman-qt5
PACKAGE=connman-qt5
. install_package.sh

LIBRARY_NAME=connman-qt5
PACKAGE=connman-qt5-devel
. install_package.sh
