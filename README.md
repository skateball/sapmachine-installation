# Sapmachine Installation

Installation scripts for SapMachine on debian-based operating systems.
in subfolder ```t``` there are several evolution stages of the installation script for debian from [SapMachine Wiki: Installation](https://github.com/SAP/SapMachine/wiki/Installation/)

The current version of these script install SapMachine 21 JDK.

## Versions

- [t/w1.sh](https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w1.sh) the intial version <br> ``` wget -qO- https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w1.sh | sudo bash ```
- [t/w2.sh](https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w2.sh) the commit “Updated Debian package installation” from July 1, 2019 <br> ``` wget -qO- https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w2.sh | sudo bash ```
- [t/w3.sh](https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w3.sh) the commit “updated linux installation” from April 20, 2023 <br> ``` wget -qO- https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w3.sh | sudo bash ```
- [t/w4.sh](https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w4.sh) the enhanced version of w1.sh, that never made it to the wiki page <br> ``` wget -qO- https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w4.sh | sudo bash ```
- [t/w5.sh](https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w5.sh) the enhanced version of w4.sh, that never made it to the wiki page - <br> ``` wget -qO- https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w5.sh | sudo bash ``` # _**<<<=== second best recommendation to test**_
- [t/w6.sh](https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w6.sh) the enhanced version of w5.sh, that never made it to the wiki page - <br> ``` curl -fsSL https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w6.sh | sudo bash ``` # _**<<<=== recommended version to test**_

_**INOFFICIAL // still in testing // handle with care // no guarantee for anything // do not install stuff from untrusted sources `:-)`**_

If you want to use it, the recommendation of today would be to use the latest version. <br>
Content on this pages may change **without further notice**.

## Issue reporting

If you experience an possible issue with that script please

1. retry on a fresh debian-based OS instance
1. execute this command: <br> ``` wget -qO- https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w5.sh | sudo bash ; date ``` <br> or <br> ``` curl -fsSL https://raw.githubusercontent.com/skateball/sapmachine-installation/main/t/w6.sh | sudo bash ```
1. if possible try to investigate your own for the reason
1. open a new issue [here](https://github.com/skateball/sapmachine-installation/issues) and include as many information as possible
1. [optional] fix it your own and create an pull request

Have fun
