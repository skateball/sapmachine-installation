#!/bin/bash
### basis is w5.sh and switched from wget to curl, to enable error identification caused by possible network issues
CURL_OPTIONS="-fsSL"
WGET_OPTIONS="-qO-"

# Check if curl is installed
if command -v curl >/dev/null 2>&1; then
  DOWNLOADER="curl $CURL_OPTIONS "
elif command -v wget >/dev/null 2>&1; then
  DOWNLOADER="wget $WGET_OPTIONS"
else
  echo "Error: Neither curl nor wget is installed."
  exit 1
fi

# set default permission for new files to 644 (rw-r--r--) and new directories will have permissions of 755 (rwxr-xr-x)
umask 022

# Check if the directory exists
if [ -d "/etc/apt/trusted.gpg.d" ]; then
  # Directory exists, use tee to add the key to the file
  $DOWNLOADER https://dist.sapmachine.io/debian/sapmachine.key | sudo tee /etc/apt/trusted.gpg.d/sapmachine.asc
  # make it readable for all that user '_apt' can read it
  sudo chmod 444 /etc/apt/trusted.gpg.d/sapmachine.asc
else
  # Directory doesn't exist, use apt-key add to add the key
  $DOWNLOADER https://dist.sapmachine.io/debian/sapmachine.key | sudo apt-key add -
fi

# the next commented line was the initial code
echo "deb https://dist.sapmachine.io/debian/amd64/ ./" | sudo tee /etc/apt/sources.list.d/sapmachine.list

# the next command was not part of the code
# make it readable for all that user '_apt' can read it
sudo chmod 444 /etc/apt/sources.list.d/sapmachine.list

# the next command was not part of the initial code; perhaps not necessary and can be removed
sudo apt-get clean

sudo apt-get update
sudo apt-get -y install sapmachine-21-jdk

# the next command was not part of the code
export JAVA_HOME=/usr/lib/jvm/sapmachine-21
# Add the JAVA_HOME/bin directory to the PATH environment variable
export PATH=$JAVA_HOME/bin:$PATH

# the next command was not part of the code
which java
# the next command was not part of the code
java -version

echo "script 6 ended"
