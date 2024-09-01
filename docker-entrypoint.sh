#!/bin/sh
set -e

[ -e /.dockerenv ] || exit 1

[ -x /usr/sbin/lighttpd ] || { sudo apt-get update; sudo apt-get install -y lighttpd; }
sudo rm -rf /var/www/html
sudo ln -s /vyos/apt/pub /var/www/html
sudo lighttpd -f /etc/lighttpd/lighttpd.conf

[ -e /vyos/vyos-build ] || git clone -b equuleus /vyos/pkg_build/vyos-build /vyos/vyos-build
cd /vyos/vyos-build

echo ''
echo 'vyos/vyos-build:equuleus'
echo 'Local apt repo reachable at:'
echo 'http://localhost/dev.packages.vyos.net'
echo ''
echo 'Apt-Key: /vyos/apt/pubkey.asc'
echo ''
echo 'Have fun!'
exec bash
