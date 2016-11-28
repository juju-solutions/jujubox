#!/bin/bash
set -x

# This script installs juju-1 and all the dependencies.

if [ -z "$JUJU_USER" ]; then
  JUJU_USER=ubuntu
fi

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
    juju-1 \
    juju-core \
    juju-deployer \
    openssh-client \
    python-dev \
    sudo \
    vim \
    virtualenvwrapper

# Add the JUJU_USER to the passwordless sudo file.
echo "${JUJU_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/juju-users

JUJU=`which juju-1 > /dev/null && echo juju-1 || echo juju`
# Get the version of Juju installed.
JUJU_VERSION=`${JUJU} version`

# Set a welcome message in .bashrc with the exact version of Juju.
RC=/home/$JUJU_USER/.bashrc
echo "echo Welcome to jujubox version ${JUJU_VERSION}" >> $RC

# Cleanup unnecessary packages.
apt-get remove -qy cython gcc
apt-get autoremove -qy
apt-get autoclean -qy
apt-get clean -qy
