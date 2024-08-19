#!/bin/bash
### basis is w4.sh with some changes in how to add the key

### add the key to the trusted keyring
### apt-key that was initially used is deprecated
### apt-key stores the key in /etc/apt/trusted.gpg, what should not be used anymore
#wget -q -O - https://dist.sapmachine.io/debian/sapmachine.key | apt-key add -
#the line above causes:
#Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
#W: http://dist.sapmachin.io/debian/amd64/./InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.

# To add the SapMachine key to the keyring it is required to identify if the new or the old method should be taken.
# Therefore it is checked if the directory /etc/apt/trusted.gpg.d is existing and if so the new method is used otherwise the old method is used.
# That makes this script working from ubuntu14 to 24+

# Check if the directory exists
if [ -d "/etc/apt/trusted.gpg.d" ]; then
  # Directory exists, use tee to add the key to the file
  wget -qO- https://dist.sapmachine.io/debian/sapmachine.key | sudo tee /etc/apt/trusted.gpg.d/sapmachine.asc
else
  # Directory doesn't exist, use apt-key add to add the key
  wget -qO- https://dist.sapmachine.io/debian/sapmachine.key | sudo apt-key add -
fi

# the next commented line was the initial code
#echo "deb http://dist.sapmachine.io/debian/amd64/ ./" >> /etc/apt/sources.list
echo "deb http://dist.sapmachine.io/debian/amd64/ ./" | sudo tee /etc/apt/sources.list.d/sapmachine.list

# the next command was not part of the code
# required in rare cases, when the default UMASK does not allow 'read' for group and other
sudo chmod +r /etc/apt/sources.list.d/sapmachine.list

# the next command was not part of the initial code
sudo apt-get clean

sudo apt-get update
sudo apt-get -y install sapmachine-21-jdk

# the next command was not part of the code
export JAVA_HOME=/usr/lib/jvm/sapmachine-21

# the next command was not part of the code
which java
# the next command was not part of the code
java -version

echo "script 5 ended"
