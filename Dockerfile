FROM ubuntu:14.04

ADD setup.sh /setup.sh
RUN /setup.sh

RUN mkdir /home/ubuntu/.juju
RUN mkdir /home/ubuntu/trusty
RUN mkdir /home/ubuntu/precise
RUN mkdir /home/ubuntu/.virtualenvs

RUN virtualenv /home/ubuntu/.virtualenvs/charm-review

VOLUME ["/home/ubuntu/.juju"]

ADD patchcontainer.sh /patchcontainer.sh
ADD run.sh /run.sh

RUN /home/ubuntu/.virtualenvs/charm-review/bin/pip install bundletester
RUN git clone https://github.com/juju/plugins.git /home/ubuntu/.juju-plugins

RUN chown -R ubuntu:ubuntu /home/ubuntu

RUN echo "export JUJU_HOME=/home/ubuntu/.juju" >> /home/ubuntu/.bashrc
RUN echo "export JUJU_REPOSITORY=/home/ubuntu" >> /home/ubuntu/.bashrc
RUN echo "export PROJECT_HOME=/home/ubuntu" >> /home/ubuntu/.bashrc
RUN echo "export PATH=$PATH:/home/ubuntu/.juju-plugins" >> /home/ubuntu/.bashrc

CMD /run.sh
