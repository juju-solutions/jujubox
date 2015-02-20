# Juju Box

Juju provisions machines, deploy services and orchestrates them into
systems.

This container comes with the basics you need to get started w/ juju.

 - juju
 - juju quickstart
 - [juju plugins](https://github.com/juju/plugins)

Docker >= 1.4.1 recommended.


# To Run

From hub.docker.io:

    sudo docker run  -ti whitmo/jujubox

Or to use your existing ${JUJU_HOME}:

    sudo docker run --rm -v ${JUJU_HOME}:/home/ubuntu/.juju -it whitmo/jujubox


# Once it's up

All your usual juju commands should work:

    juju status


If you need to set up some cloud credentials:

    juju quickstart -i


## Build from repo

From source:

    git clone https://github.com/whitmo/jujubox.git && cd jujubox
    sudo docker build -t jujubox ./


## Future

We plan to build some containers that support juju local provider to
allow juju to orchestrate lxc containers locally for inception style
disposable architectures.
