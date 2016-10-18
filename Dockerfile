FROM ubuntu:16.04
MAINTAINER Matthew Bruzek <Matthew.Bruzek@canonical.com>

RUN useradd -m ubuntu -s /bin/bash
RUN mkdir -p \
    /home/ubuntu/.juju \
    /home/ubuntu/builds \
    /home/ubuntu/trusty \
    /home/ubuntu/xenial

RUN chown -R ubuntu:ubuntu /home/ubuntu

VOLUME [ \
    "/home/ubuntu/.juju", \
    "/home/ubuntu/builds", \
    "/home/ubuntu/trusty", \
    "/home/ubuntu/xenial" \
    ]

COPY setup.sh /setup.sh
RUN /setup.sh

COPY run.sh /run.sh
CMD /run.sh
