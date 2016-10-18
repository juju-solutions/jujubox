FROM ubuntu:16.04
MAINTAINER Matthew Bruzek <Matthew.Bruzek@canonical.com>

RUN useradd -m ubuntu -s /bin/bash

RUN mkdir -p \
    /home/ubuntu/.local/share/juju \
    /home/ubuntu/builds \
    /home/ubuntu/trusty \
    /home/ubuntu/xenial

RUN chown -R ubuntu:ubuntu /home/ubuntu

VOLUME [ \
    "/home/ubuntu/.local/share/juju", \
    "/home/ubuntu/builds", \
    "/home/ubuntu/trusty", \
    "/home/ubuntu/xenial" \
    ]

ADD setup.sh /setup.sh
ADD run.sh /run.sh

RUN /setup.sh


CMD /run.sh
