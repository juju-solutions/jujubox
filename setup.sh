#!/bin/bash

apt-get install -qy software-properties-common
apt-add-repository ppa:juju/stable
apt-get update -qq

apt-get install -qy lxc iptables
apt-get -qy install juju-core juju-quickstart juju-deployer
apt-get -qy install tmux charm-tools juju-local openssh-client
