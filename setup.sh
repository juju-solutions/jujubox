#!/bin/bash

apt-get install -qy software-properties-common
apt-add-repository -y ppa:juju/stable
apt-get update -qq

apt-get install -qy lxc iptables
apt-get -qy install juju-core juju-quickstart juju-deployer
apt-get -qy install tmux charm-tools juju-local openssh-client
apt-get -qy install virtualenvwrapper python-dev cython git

useradd -m ubuntu
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/juju-users
