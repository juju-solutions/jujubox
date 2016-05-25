#!/bin/bash
set -x

# Juju and Dependencies
apt-get update -qq
apt-get install -qy software-properties-common
apt-add-repository -y ppa:juju/devel
# stable ppa is required for charm-tools
apt-add-repository -y ppa:juju/stable
apt-get update -qq

apt-get -qy install juju-2.0
apt-get -qy install byobu vim charm-tools openssh-client sudo
apt-get -qy install virtualenvwrapper python-dev cython

useradd -m ubuntu -s /bin/bash
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/juju-users

HOME=/home/ubuntu

RC=${HOME}/.bashrc
cat << EOF > $RC
export PROJECT_HOME=${HOME}
export JUJU_REPOSITORY=${HOME}
export JUJU_DATA=${HOME}/.local/share/juju
export INTERFACE_PATH=${HOME}/interfaces
export LAYER_PATH=${HOME}/layers
echo 'welcome to juju 2.0'
EOF

# Create volume export paths
mkdir -p /home/ubuntu/.local/share/juju
mkdir /home/ubuntu/trusty
mkdir /home/ubuntu/xenial
mkdir /home/ubuntu/layers
mkdir /home/ubuntu/interfaces
mkdir /home/ubuntu/builds

chown -R ubuntu:ubuntu ${HOME}

# Cleanup Script moved here
apt-get remove -qy cython gcc

apt-get autoremove -qy
apt-get autoclean -qy
apt-get clean -qy
