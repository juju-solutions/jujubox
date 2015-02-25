# Juju Box

Juju provisions machines, deploy services and orchestrates them into
systems.

This container comes with the basics you need to get started w/ juju.

 - juju
 - juju quickstart
 - [juju plugins](https://github.com/juju/plugins)

Docker >= 1.4.1 recommended.


# To Run

### Linux
```
git clone https://github.com/whitmo/jujubox.git && cd jujubox

From hub.docker.io:

    sudo docker run  -ti whitmo/jujubox
    ```

Or to use your existing ${JUJU_HOME}:

```
    sudo docker run --rm -v ${JUJU_HOME}:/home/ubuntu/.juju -it whitmo/jujubox

```

### OS X

Docker does not run natively in OS X, so we'll need to use VirtualBox and boot2docker. This is relatively easy for users of brew:

```
brew install cask
brew cask install virtualbox
brew install docker
brew install boot2docker

boot2docker init
boot2docker up
```

When boot2docker finishes, it will prompt you to export Docker environment variables. With that done, you're ready to use docker.

```
git clone https://github.com/whitmo/jujubox.git && cd jujubox

From hub.docker.io:
    # Don't run as sudo; boot2docker runs as root.
    docker run  -ti whitmo/jujubox
```

# Once it's up

All your usual juju commands should work:

    juju status


If you need to set up some cloud credentials:

    juju quickstart -i


## Build from repo

From source:

    git clone https://github.com/whitmo/jujubox.git && cd jujubox
    sudo docker build -t jujubox ./


## Future Direction

We plan to build some containers that support juju local provider to
allow juju to orchestrate lxc containers locally for inception style
disposable architectures.
