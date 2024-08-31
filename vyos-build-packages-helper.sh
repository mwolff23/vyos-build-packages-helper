#!/bin/sh

basedir="$(readlink -f .)"

echo "Will run in Docker"
sleep 1

docker run --rm -ti -e "VYOS_VOLUME=$basedir" -v "${basedir}:/vyos" -v "/var/run/docker.sock:/var/run/docker.sock" -w "/vyos" "node:20-bookworm" sh /vyos/docker-entrypoint_pkg.sh
exec docker run --rm -ti -v "${basedir}:/vyos" -w "/vyos" "vyos/vyos-build:sagitta" sh /vyos/docker-entrypoint.sh