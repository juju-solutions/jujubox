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
with jujubox and adds the functionality of 
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

## Running jujubox to use Juju

If you want to use Juju run the container in an interactive (-i) tty (-t) 
session and use the command line. Since the container file system is reset each
time it is highly recommended to mount a volume (-v) from the host system to
the `$JUJU_HOME` directory. This will allow any Juju data to persist between 
runs of jujubox:

```
docker run --rm -it \
  -v $HOME/.juju:/home/ubuntu/.juju \
  jujusolutions/jujubox 
```

### Use charms from the host

If you already have charms on the host machine, you can also mount the 
`$JUJU_REPOSITORY` directory so jujubox can deploy local charms.

```
docker run --rm -it \
  -v $HOME/.juju:/home/ubuntu/.juju \
  -v $JUJU_REPOSITORY:/home/ubuntu/charms \
  jujusolutions/jujubox
```

See the Environment Variables 
[reference](https://jujucharms.com/docs/2.0/reference-environment-variables)
for more information on the paths for `$JUJU_DATA` and `$JUJU_REPOSITORY`.

## jujubox and the LXD provider

At this time we do not support the local provider with jujubox because that is
nested containers Docker and LXD. If you want to use the local provider you
need Ubuntu version 14.04 (trusty) and the juju-local package installed.
The best way to run the local provider is to install Juju on the host system.

# More information

For more information about what you can do in jujubox check out the 
[Juju documenation](https://jujucharms.com/docs).

If you find any bugs please create an issue in the 
[jujubox github repository](https://github.com/juju-solutions/jujubox/issues).
