#!/bin/bash
wget -q -O - https://dist.sapmachine.io/debian/sapmachine.key | apt-key add -
echo "deb http://dist.sapmachine.io/debian/amd64/ ./" >> /etc/apt/sources.list

# the next command was not part of the code
apt-get clean

apt-get update
apt-get install sapmachine-21-jdk
