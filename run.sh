#!/bin/bash
set -e

export HOME=/home/ubuntu
cd $HOME
chown ubuntu:ubuntu $HOME/.local/share/juju
sudo -u ubuntu ssh-agent /bin/bash
