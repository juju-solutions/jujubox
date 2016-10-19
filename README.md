# Juju Box

Juju Box is a docker container project that provides a configured Juju
environment with all the tools you need to work with 
[Juju](https://jujucharms.com).

Juju is an open source, universal model for applications. Juju allows you to 
deploy, configure, manage, maintain, and scale cloud services quickly and 
efficiently on public clouds, as well as on physical servers.

This container comes with the basic tools you need to get started with Juju.

 - juju
 - juju-deployer

The [charmbox](https://github.com/juju-solutions/charmbox) container starts 
jujubox and adds the functionality of 
[charm-tools](https://github.com/juju/charm-tools) and 
[bundletester](https://github.com/juju-solutions/bundletester).

# Install Docker

## Linux
Install Docker using the package manager for your Linux distribution, or
[get.docker.com](https://get.docker.com/). We recommend Docker version 1.6 or
greater.

## Mac OS X

There are several ways to 
[install Docker on Mac OS X](https://docs.docker.com/engine/installation/mac/). 
Consult the latest documentation on
[Getting Started with Docker for Mac](https://docs.docker.com/docker-for-mac/).

# Download jujubox

If you want to see the code you can download the jujubox project from 
[github](https://github.com/juju-solutions/jujubox) and build it from source.

```
git clone https://github.com/jujusolutions/jujubox.git && cd jujubox
docker build -t jujusolutions/jujubox ./
```

Or simply pull the jujubox container from the
[Docker hub](https://registry.hub.docker.com/u/jujusolutions/jujubox/).

```
docker pull jujusolutions/jujubox
```

# Run jujubox

There are several different ways to run jujubox depending on what you are 
trying to accomplish. 

## Running jujubox to evaluate Juju

If you do not already have Juju installed and want to check this container out 
you can simply run the container in an interactive (-i) tty (-t) session to use
the Juju tools:

```
docker run --rm -it jujusolutions/jujubox 
```

## Running jujubox if you have Juju installed on host

If you already have Juju installed on the host machine, you can mount the 
existing host directories to the container using volume mounts (-v). Run the 
container using your volume mounts to your existing ${JUJU_HOME} directory 
(~/.juju) and your existing ${JUJU_REPOSITORY} directory (where the local 
charms are held):

```
docker run --rm -it \
  -v ${JUJU_HOME}:/home/ubuntu/.juju \
  -v ${JUJU_REPOSITORY}/builds:/home/ubuntu/builds \
  -v ${JUJU_REPOSITORY}/trusty:/home/ubuntu/trusty \
  -v ${JUJU_REPOSITORY}/xenial:/home/ubuntu/xenial \
  jujusolutions/jujubox
```

## jujubox and the local provider

At this time we do not support the local provider with jujubox because that is
nested containers Docker and LXD. If you want to use the local provider you
need Ubuntu version 14.04 (trusty) and the juju-local package installed.
The best way to run the local provider is to install Juju on the host system.

# More information

For more information about what you can do in jujubox check out the 
[Juju documenation](https://jujucharms.com/docs).

If you find any bugs please create an issue in the 
[jujubox github repository](https://github.com/juju-solutions/jujubox/issues).
