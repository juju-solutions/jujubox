#!/bin/bash
set -e

HOME=/home/ubuntu

RC=${HOME}/.bashrc
echo "export JUJU_HOME=${HOME}/.juju" >> $RC
echo "export JUJU_REPOSITORY=${HOME}" >> $RC
echo "export PROJECT_HOME=${HOME}" >> $RC
echo "export JUJU_DATA=${HOME}/.local/share/juju" >> $RC

echo "echo 'welcome to juju 2.0'" >> $RC

chown -R ubuntu:ubuntu ${HOME}
