# Juju Box

Juju provisions machines, deploy services and orchestrates them into
systems.

This container comes with the basics you need to get started w/ juju.

 - juju
 - juju quickstart
 - [juju plugins](https://github.com/juju/plugins)

Docker >= 1.4.1 recomended.

# To Run

  ```
  git clone https://github.com/whitmo/jujubox.git && cd jujubox

  sudo docker build -t jujubox ./
  sudo docker run  -ti jujubox
  ```

Or to use your existing ${JUJU_HOME}:

    `sudo docker run --rm -v ${JUJU_HOME}:/home/ubuntu/.juju -i -t jujubox`



# Once it's up

All your usual juju command should work:

    juju status


If you need to set up some cloud credentials:

    juju quickstart -i


## Future

We plan to build some containers that support juju local provider to
allow juju to orchestrate lxc containers locally for inception style
disposable architectures.
