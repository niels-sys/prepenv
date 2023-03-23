ReadMe for V5.50(ABOM.8.2)C0


0. Introduction

  This file will show you how to build the VMG8825-T50K series linux system,
  please note, the download image will overwrite the original image existed in the flash memory of EV board.


1. Files list

   A. README					- This file

   B. V550ABOM8.2C0_GPL.tgz	- Open Source Code of VMG8825-T50K family and Open Source Code of Toolchain


2. Prepare the build OS.

   We suggest using the Linux distribution to setup your environment for reduce compatible issue.

    Install ubuntu-16.04 LTS https://releases.ubuntu.com/16.04.7/ubuntu-16.04.7-desktop-amd64.iso


3. Prepare the compiler environment

   Install the following necessary tools 

    $ apt-get update
    $ apt-get upgrade
    $ apt-get install bash
    $ apt-get install build-essential subversion git-core libncurses5-dev
    $ apt-get install zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs libglib2.0-dev

    $ apt-get install autoconf automake

    $ update-alternatives --install /bin/sh sh /bin/bash 100

    $ add-apt-repository ppa:git-core/ppa 
    $ apt-get update 
    $ apt-get install git
    $ add-apt-repository ppa:fkrull/deadsnakes
    $ apt-get update
    $ apt-get install python3.6
    $ apt-get install python3.6-dev
    $ apt-get install python3.6-gdbm
    $ cd /usr/bin
    $ rm python3
    $ ln -s python3.6 python3

    $ apt-get install bc
    $ apt-get install libc6-dev-i386
    $ apt-get install curl
    $ curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    $ apt-get update
    $ apt-get install -y  --force-yes nodejs --fix-missing



4. Extract the open source code

	$ tar zxvf <FW Tarbal File>


5. Build the firmware for Web-GUI upgrade using

   Change the directory into extrated directory

	$ cd <extrated directory>

	
   Clean and build the firmware

	$ make dirclean
	$ make


6. The image is in the images directory.

    The firmware image will locate at <extrated directory>/bin/en75xx/zyxel/ras.bin
    You can use it update VMG8825-T50K series by using the firmware update procedure.


7. Before building the firmware, check if the automake version is 1.14

	$ aclocal --version

   If not, download and install automake:
   
	$ wget http://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
	$ tar xvzf automake-1.14.tar.gz
	$ cd automake-1.14
	$ ./configure
	$ make
	$ sudo make install