FROM ubuntu:16.04
MAINTAINER Charles Butler <charles.butler@canonical.com>

VOLUME ["/home/ubuntu/.local/share/juju", "/home/ubuntu/trusty", "/home/ubuntu/xenial", "/home/ubuntu/layers", "/home/ubuntu/interfaces", "/home/ubuntu/builds"]

ADD setup.sh /setup.sh
ADD run.sh /run.sh

RUN /setup.sh


CMD /run.sh
