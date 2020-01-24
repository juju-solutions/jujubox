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
# devel ppa is required for juju2 beta release
# NB: forgive me for what i'm about to do. juju needs lxd, and lxd
# in focal pulls in snapd, which doesn't work under docker; go bionic.
cat <<EOF > /etc/apt/sources.list.d/juju-lxd-devel-bionic.list
deb http://archive.ubuntu.com/ubuntu/ bionic main
deb http://ppa.launchpad.net/juju/devel/ubuntu bionic main
EOF
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 376A290EC8068B11
apt-get update -qq

# Install juju and the bare minimum components.
apt-get install -qy \
    byobu \
    juju \
    lxd=3.0.0-0ubuntu4 lxd-client=3.0.0-0ubuntu4 \
    openssh-client \
    python \
    python3 \
    sudo \
    vim

# Keep lxd on the old bionic version
echo 'lxd hold' | dpkg --set-selections
echo 'lxd-client hold' | dpkg --set-selections

# Fix sudo: https://bugzilla.redhat.com/show_bug.cgi?id=1773148
echo 'Set disable_coredump false' > /etc/sudo.conf

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
