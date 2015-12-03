#!/bin/bash
cd /tmp
wget http://nodejs.org/dist/$1/node-$1.tar.gz
tar xvf node-$1.tar.gz
cd node-$1
./configure
make
make install
cd ..
rm node-$1.tar.gz
rm -fr node-$1