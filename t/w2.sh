#!/bin/bash
apt-get install -y --no-install-recommends wget ca-certificates gnupg2

export GNUPGHOME="$(mktemp -d)"
wget -q -O - https://dist.sapmachine.io/debian/sapmachine.old.key | gpg --batch --import
gpg --batch --export --armor 'DA4C 00C1 BDB1 3763 8608 4E20 C7EB 4578 740A EEA2' > /etc/apt/trusted.gpg.d/sapmachine.old.gpg.asc
wget -q -O - https://dist.sapmachine.io/debian/sapmachine.key | gpg --batch --import
gpg --batch --export --armor 'CACB 9FE0 9150 307D 1D22 D829 6275 4C3B 3ABC FE23' > /etc/apt/trusted.gpg.d/sapmachine.gpg.asc
gpgconf --kill all && rm -rf "$GNUPGHOME"
echo "deb http://dist.sapmachine.io/debian/amd64/ ./" > /etc/apt/sources.list.d/sapmachine.list

apt-get update
apt-get install sapmachine-21-jdk
