FROM ubuntu:16.04
MAINTAINER Matthew Bruzek <Matthew.Bruzek@canonical.com>

RUN useradd -m ubuntu -s /bin/bash

RUN mkdir -p /home/ubuntu/.local/share/juju 
RUN mkdir -p /home/ubuntu/charms

RUN chown -R ubuntu:ubuntu /home/ubuntu/.local/share/juju
RUN chown -R ubuntu:ubuntu /home/ubuntu/charms

VOLUME [ "/home/ubuntu/.local/share/juju", "/home/ubuntu/charms ]

ADD setup.sh /setup.sh
ADD run.sh /run.sh

RUN /setup.sh

CMD /run.sh
