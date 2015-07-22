#!/bin/bash
cd /tmp
wget http://nodejs.org/dist/v0.12.7/node-v0.12.7.tar.gz
tar xvf node-v0.12.7.tar.gz
cd node-v0.12.7
./configure
make
make install
cd ..
rm node-v0.12.7.tar.gz
rm -fr node-v0.12.7