#!/bin/bash
set -e

/patchcontainer.sh
brctl addbr lxcbr0
ifconfig lxcbr0 10.0.4.1 up

sleep 1
exec /bin/bash
