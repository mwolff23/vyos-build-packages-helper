# VyOS Package Build Helper

Simply run `./vyos-build-packages-helper.sh` and all packages will be build into an local apt repository.
You will be dropped in a vyos-build shell with a webserver at localhost serving the apt repo.

Example usage:

```
sudo ./build-vyos-image iso \
  --architecture amd64 \
  --build-by "root@localhost" \
  --build-type release \
  --version "1.4.x-$(date +%s)" \
  --vyos-mirror "http://localhost/dev.packages.vyos.net" \
  --custom-apt-key /vyos/apt/pubkey.asc
```
