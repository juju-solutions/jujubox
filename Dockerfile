FROM ubuntu:16.04
MAINTAINER Matthew Bruzek <Matthew.Bruzek@canonical.com>

RUN useradd -m ubuntu -s /bin/bash

RUN mkdir -p /home/ubuntu/.local/share/juju 
RUN mkdir -p /home/ubuntu/charms

RUN chown -R ubuntu:ubuntu /home/ubuntu/.local
RUN chown -R ubuntu:ubuntu /home/ubuntu/charms

VOLUME [ "/home/ubuntu/.local/share/juju", "/home/ubuntu/charms" ]

ADD setup.sh /setup.sh
RUN /setup.sh

USER ubuntu

WORKDIR /home/ubuntu

ENV HOME /home/ubuntu
ENV JUJU_DATA /home/ubuntu/.local/share/juju
ENV JUJU_REPOSITORY /home/ubuntu/charms

ENTRYPOINT ssh-agent /bin/bash
