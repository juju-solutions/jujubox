FROM ubuntu:16.04
MAINTAINER Matthew Bruzek <Matthew.Bruzek@canonical.com>

ARG JUJU_USER=ubuntu

ENV JUJU_HOME /home/$JUJU_USER/.juju
ENV JUJU_REPOSITORY /home/$JUJU_USER/charms

RUN useradd -m $JUJU_USER -s /bin/bash

RUN mkdir -p $JUJU_HOME 
RUN mkdir -p $JUJU_REPOSITORY

RUN chown -R $JUJU_USER:$JUJU_USER $JUJU_HOME
RUN chown -R $JUJU_USER:$JUJU_USER $JUJU_REPOSITORY

VOLUME [ "$JUJU_HOME", "$JUJU_REPOSITORY" ]

ADD setup.sh /setup.sh
RUN /setup.sh

USER $JUJU_USER

WORKDIR /home/$JUJU_USER

ENTRYPOINT ssh-agent /bin/bash
