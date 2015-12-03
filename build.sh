#!/bin/bash
sudo apt-get install puppet
cd "$(dirname ${BASH_SOURCE[0]})"
puppet module install puppetlabs-nodejs --modulepath=./system
sudo puppet apply --verbose --debug --modulepath=./system system.pp
