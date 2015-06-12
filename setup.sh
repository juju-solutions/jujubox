#!/bin/bash

apt-get update -qq
apt-get install -qy software-properties-common
apt-add-repository -y ppa:juju/stable
apt-get update -qq

## don't install lxc & local till we get local support
#apt-get install -qy lxc iptables juju-local

## actually, we need juju-local since the local provider
## can be used by bootstrapping from outside the container
apt-get -qy install juju-local
apt-get -qy install juju-core juju-quickstart juju-deployer
apt-get -qy install tmux charm-tools openssh-client
apt-get -qy install virtualenvwrapper python-dev cython git

useradd -m ubuntu
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/juju-users
