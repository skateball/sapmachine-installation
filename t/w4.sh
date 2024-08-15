#!/bin/bash
### basis is w1.sh with some minor changes
wget -q -O - https://dist.sapmachine.io/debian/sapmachine.key | apt-key add -

# the next commented line was the initial code
#echo "deb http://dist.sapmachine.io/debian/amd64/ ./" >> /etc/apt/sources.list
echo "deb http://dist.sapmachine.io/debian/amd64/ ./" > /etc/apt/sources.list.d/sapmachine.list

# the next command was not part of the code
chmod +r /etc/apt/sources.list.d/sapmachine.list

# the next command was not part of the initial code
apt-get clean

apt-get update
apt-get install sapmachine-21-jdk

# the next command was not part of the code
export JAVA_HOME=/usr/lib/jvm/sapmachine-21

# the next command was not part of the code
which java
# the next command was not part of the code
java -version
