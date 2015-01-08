#!/bin/bash

set -e

[ -e /usr/lib/apt/methods/https ] || {
  apt-get update
  apt-get install apt-transport-https
}


echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9


apt-get update
apt-get install -y lxc-docker
