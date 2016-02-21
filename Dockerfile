FROM ubuntu:14.04
MAINTAINER Charles Butler <charles.butler@canonical.com>

ADD setup.sh /setup.sh
RUN /setup.sh

RUN mkdir -p .local/share/juju && \
    mkdir /home/ubuntu/trusty && \
    mkdir /home/ubuntu/xenial

VOLUME ["/home/ubuntu/.local/share/juju"]

ADD run.sh /run.sh
ADD cleanup.sh /cleanup.sh
ADD charming-setup.sh /charming-setup.sh

RUN /charming-setup.sh && /cleanup.sh
CMD /run.sh
