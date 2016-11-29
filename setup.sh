#!/bin/bash
set -x

# This script installs juju version 2 and all the dependencies.

if [ -z "$JUJU_USER" ]; then
  JUJU_USER=ubuntu
fi

# Refresh the potentially stale apt cache.
apt-get update -qq
# Install software tools such as add-apt-repository.
apt-get install -y software-properties-common
# Install the ppa for Juju and charm tools.
apt-add-repository -u -y ppa:juju/stable

# Install juju and the bare minimum components.
apt-get install -qy \
    byobu \
    juju \
    openssh-client \
    python \
    python3 \
    sudo \
    vim

# Add the JUJU_USER to the passwordless sudo file.
echo "${JUJU_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/juju-users

# Disable strict host key checking as Juju hostnames may be reused.
mkdir -p /home/$JUJU_USER/.ssh
chmod 700 /home/$JUJU_USER/.ssh
echo 'Host *' > /home/$JUJU_USER/.ssh/config
echo '  StrictHostKeyChecking no' >> /home/$JUJU_USER/.ssh/config
chmod 400 /home/$JUJU_USER/.ssh/config
chown -R $JUJU_USER:$JUJU_USER /home/$JUJU_USER/.ssh

# Get the version of Juju installed.
JUJU_VERSION=`juju version`

# Set a welcome message in .bashrc with the exact version of Juju.
RC=/home/$JUJU_USER/.bashrc
echo "echo Welcome to jujubox version ${JUJU_VERSION}" >> $RC

# Cleanup any unnecessary packages.
apt-get autoremove -qy
apt-get autoclean -qy
apt-get clean -qy
