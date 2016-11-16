#!/bin/bash
set -e

# This script is run if the jujubox image is run without any arguments.

export HOME=/home/ubuntu
cd $HOME
sudo -u ubuntu ssh-agent /bin/bash
