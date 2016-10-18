#!/bin/bash

# This script installs all the juju-1 and the dependencies.

# Refresh the potentially stale apt cache.
apt-get update -qq
# Install software tools such as add-apt-repository.
apt-get install -qy software-properties-common
# Install the ppa for Juju and charm tools.
apt-add-repository -y ppa:juju/stable
# Refresh the apt-cache with the new Juju PPA.
apt-get update -qq

# Install juju-local since the local provider can be used by bootstrapping 
# from outside the container.
apt-get install -qy \
    byobu \
    cython \
    git \
    juju-1 \
    juju-core \
    juju-deployer \
    juju-local \
    openssh-client \
    python-dev \
    sudo \
    vim \
    virtualenvwrapper

# Add ubuntu to the passwordless sudo file.
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/juju-users
JUJU=`which juju-1 > /dev/null && echo juju-1 || echo juju`
# Get the version of Juju installed.
JUJU_VERSION=`${JUJU} version`
# The home directory for the ubuntu user.
HOME=/home/ubuntu
# Set some environment variables used by Juju.
RC=${HOME}/.bashrc
cat << EOF > $RC
# The directory to look for charms.
export JUJU_REPOSITORY=${HOME}
# The path to Juju configuration files.
export JUJU_HOME=${HOME}/.juju
echo "Welcome to jujubox! Use the ${JUJU} command version ${JUJU_VERSION}."
EOF

# Cleanup unnecessary packages.
apt-get remove -qy cython gcc
apt-get autoremove -qy
apt-get autoclean -qy
apt-get clean -qy
