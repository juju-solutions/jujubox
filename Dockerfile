FROM ubuntu:14.04

ADD setup.sh /setup.sh
RUN /setup.sh

VOLUME ["/home/ubuntu/.juju"]

ADD patchcontainer.sh /patchcontainer.sh
ADD run.sh /run.sh
RUN echo "export JUJU_HOME=/home/ubuntu/.juju" >> /home/ubuntu/.bashrc
CMD /run.sh
