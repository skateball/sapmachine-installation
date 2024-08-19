#!/bin/bash
### basis is w5.sh and switched from wget to curl, to enable error identification caused by possible network issues

# Check if the directory exists
if [ -d "/etc/apt/trusted.gpg.d" ]; then
  # Directory exists, use tee to add the key to the file
  curl -fsSL https://dist.sapmachine.io/debian/sapmachine.key | sudo tee /etc/apt/trusted.gpg.d/sapmachine.asc
  # ensure that key file can only written by root. (it is not required that it is readable to group and others, wherefore system-default will decide on this)
  sudo chmod go-wx /etc/apt/trusted.gpg.d/sapmachine.asc
else
  # Directory doesn't exist, use apt-key add to add the key
  curl -fsSL https://dist.sapmachine.io/debian/sapmachine.key | sudo apt-key add -
fi

# the next commented line was the initial code
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

echo "script 6 ended"
