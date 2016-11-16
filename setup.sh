#!/bin/bash
set -x

# This script installs juju version 2 and all the dependencies.

# Refresh the potentially stale apt cache.
apt-get update -qq
# Install software tools such as add-apt-repository.
apt-get install -qy software-properties-common
# Install the ppa for Juju and charm tools.
apt-add-repository -u -y ppa:juju/stable

# Install juju-local since the local provider can be used by bootstrapping 
# from outside the container.
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
# The home directory for the ubuntu user.
HOME=/home/ubuntu
# Set some environment variables used by Juju.
RC=${HOME}/.bashrc
cat << EOF > $RC

# The directory to look for charms.
export JUJU_REPOSITORY=${HOME}/charms
# The path to Juju configuration files.
export JUJU_DATA=${HOME}/.local/share/juju
echo "Welcome to jujubox! Use the juju command version ${JUJU_VERSION}"
EOF

# Cleanup unnecessary packages.
apt-get remove -qy cython gcc
apt-get autoremove -qy
apt-get autoclean -qy
apt-get clean -qy
