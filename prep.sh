#!/bin/bash

# Update and upgrade packages
apt-get update
apt-get upgrade -y

# Install necessary tools
apt-get install -y bash build-essential subversion git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs libglib2.0-dev autoconf automake bc libc6-dev-i386 curl

# Update /bin/sh symlink to use bash
update-alternatives --install /bin/sh sh /bin/bash 100

# Add Git PPA and install Git
add-apt-repository ppa:git-core/ppa
apt-get update
apt-get install -y git

# Add deadsnakes PPA and install Python 3.6
add-apt-repository ppa:fkrull/deadsnakes
apt-get update
apt-get install -y python3.6 python3.6-dev python3.6-gdbm

# Update python3 symlink to use Python 3.6
cd /usr/bin
rm python3
ln -s python3.6 python3

# Install Node.js 8.x
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get update
apt-get install -y --force-yes nodejs --fix-missing

# Check automake version and install if necessary
aclocal_version=$(aclocal --version | awk 'NR==1{print $NF}')
if [[ $aclocal_version != "1.14" ]]; then
  wget http://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
  tar xvzf automake-1.14.tar.gz
  cd automake-1.14
  ./configure
  make
  sudo make install
  cd ..
  rm -rf automake-1.14 automake-1.14.tar.gz
fi