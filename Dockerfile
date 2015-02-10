FROM ubuntu:14.04

ADD setup.sh /setup.sh
RUN /setup.sh

RUN mkdir /home/ubuntu/.juju
RUN chown -R ubuntu:ubuntu /home/ubuntu/.juju
VOLUME ["/home/ubuntu/.juju"]

ADD patchcontainer.sh /patchcontainer.sh
ADD run.sh /run.sh
RUN echo "export JUJU_HOME=/home/ubuntu/.juju" >> /home/ubuntu/.bashrc
CMD /run.sh
