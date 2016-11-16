#!/bin/bash
set -x

# This script installs juju version 2 and all the dependencies.

# Refresh the potentially stale apt cache.
apt-get update -qq
# Install software tools such as add-apt-repository.
apt-get install -qy software-properties-common
# Install the ppa for Juju and charm tools.
apt-add-repository -u -y ppa:juju/stable

# Install juju and the bare minimum components.
apt-get install -qy \
    byobu \
    cython \
    git \
    juju \
    openssh-client \
    python-dev \
    sudo \
    vim \
    virtualenvwrapper

# Add ubuntu to the passwordless sudo file.
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/juju-users

# Get the version of Juju installed.
JUJU_VERSION=`juju version`

# Set a welcome message in .bashrc with the exact version of Juju.
RC=/home/ubuntu/.bashrc
echo "echo Welcome to jujubox version ${JUJU_VERSION}" >> $RC

# Cleanup unnecessary packages.
apt-get remove -qy cython gcc
apt-get autoremove -qy
apt-get autoclean -qy
apt-get clean -qy
