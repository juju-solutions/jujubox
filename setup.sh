#!/bin/bash

apt-get update -qq
apt-get install -qy software-properties-common
apt-add-repository -y ppa:juju/devel
# stable ppa is required for charm-tools
apt-add-repository -y ppa:juju/stable
apt-get update -qq

apt-get -qy install juju-2.0
apt-get -qy install byobu vim charm-tools openssh-client
apt-get -qy install virtualenvwrapper python-dev cython git

useradd -m ubuntu
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/juju-users

HOME=/home/ubuntu

RC=${HOME}/.bashrc
echo "export JUJU_HOME=${HOME}/.juju" >> $RC
echo "export JUJU_REPOSITORY=${HOME}" >> $RC
echo "export PROJECT_HOME=${HOME}" >> $RC
echo "export JUJU_DATA=${HOME}/.local/share/juju" >> $RC

echo "echo 'welcome to juju 2.0'" >> $RC

chown -R ubuntu:ubuntu ${HOME}

