FROM ubuntu:16.04
LABEL maintainer "Matthew Bruzek <Matthew.Bruzek@canonical.com>"

ARG JUJU_USER=ubuntu

ENV JUJU_DATA /home/$JUJU_USER/.local/share/juju
ENV JUJU_REPOSITORY /home/$JUJU_USER/charms

RUN useradd -m $JUJU_USER -s /bin/bash

RUN mkdir -p $JUJU_DATA
RUN mkdir -p $JUJU_REPOSITORY

RUN chown -R $JUJU_USER:$JUJU_USER /home/$JUJU_USER/.local
RUN chown -R $JUJU_USER:$JUJU_USER $JUJU_REPOSITORY

VOLUME [ "$JUJU_DATA", "$JUJU_REPOSITORY" ]

COPY setup.sh /setup.sh
RUN /setup.sh

USER $JUJU_USER

WORKDIR /home/$JUJU_USER

ENTRYPOINT ssh-agent /bin/bash
