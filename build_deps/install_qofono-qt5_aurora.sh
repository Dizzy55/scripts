#!/bin/bash

. ../common_aurora.sh
. ../common.sh

LIBRARY_NAME=qofono-qt5
PACKAGE=libqofono-qt5
. install_package.sh

LIBRARY_NAME=qofono-qt5
PACKAGE=libqofono-qt5-devel
. install_package.sh
