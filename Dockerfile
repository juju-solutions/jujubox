FROM ubuntu:14.04
MAINTAINER Charles Butler <charles.butler@canonical.com>

ADD setup.sh /setup.sh
RUN /setup.sh

RUN mkdir -p .local/share/juju && \
    mkdir /home/ubuntu/trusty && \
    mkdir /home/ubuntu/xenial

VOLUME ["/home/ubuntu/.local/share/juju"]

ADD cleanup.sh /cleanup.sh
RUN /cleanup.sh
ADD run.sh /run.sh
CMD /run.sh
