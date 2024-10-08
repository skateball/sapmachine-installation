#!/bin/bash
apt-get update
apt-get install -y --no-install-recommends ca-certificates gnupg2 
rm -rf /var/lib/apt/lists/*

export GNUPGHOME="$(mktemp -d)"
gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys CACB9FE09150307D1D22D82962754C3B3ABCFE23
gpg --batch --export --armor 'CACB 9FE0 9150 307D 1D22 D829 6275 4C3B 3ABC FE23' > /etc/apt/trusted.gpg.d/sapmachine.gpg.asc
gpgconf --kill all && rm -rf "$GNUPGHOME"
echo "deb http://dist.sapmachine.io/debian/$(dpkg --print-architecture)/ ./" > /etc/apt/sources.list.d/sapmachine.list
apt-get update
apt-get -y --no-install-recommends install sapmachine-21-jdk
rm -rf /var/lib/apt/lists/*

apt-get update
apt-get install sapmachine-21-jdk
