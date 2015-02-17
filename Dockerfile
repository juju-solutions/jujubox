FROM ubuntu:14.04

ADD setup.sh /setup.sh
RUN /setup.sh

RUN mkdir /home/ubuntu/.juju
RUN mkdir /home/ubuntu/trusty
RUN mkdir /home/ubuntu/precise
RUN mkdir /home/ubuntu/.virtualenvs

VOLUME ["/home/ubuntu/.juju"]

#ADD patchcontainer.sh /patchcontainer.sh
ADD run.sh /run.sh
ADD cleanup.sh /cleanup.sh
ADD charming-setup.sh /charming-setup.sh
ADD mkvenv.sh /mkvenv.sh

RUN /charming-setup.sh
RUN /cleanup.sh
CMD /run.sh
