FROM ubuntu:juju

ADD setup.sh /setup.sh
RUN /setup.sh

ADD patchcontainer.sh /patchcontainer.sh
ADD run.sh /run.sh
CMD /run.sh
