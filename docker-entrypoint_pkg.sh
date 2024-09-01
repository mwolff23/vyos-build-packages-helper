#!/bin/sh
set -e

[ -e /.dockerenv ] || exit 1

cd /vyos

[ -e /vyos/pkg_scripts ] || git clone -b sagitta https://github.com/mwolff23/vyos-build-packages /vyos/pkg_scripts
/vyos/pkg_scripts/docker_prepare.sh
/vyos/pkg_scripts/build.sh
