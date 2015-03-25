#!/bin/bash
set -e
HOME=/home/ubuntu

sudo apt-get install unzip -qy
sudo pip install bundletester flake8

chown -R ubuntu:ubuntu ${HOME}
