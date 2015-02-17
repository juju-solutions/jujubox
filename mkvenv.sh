#!/bin/bash
set -e
HOME=/home/ubuntu

virtualenv /home/ubuntu/.virtualenvs/charm-review
. ${HOME}/.virtualenvs/charm-review/bin/activate
pip install bundletester
