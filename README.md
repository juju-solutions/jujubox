# Juju Box

A docker container w/ everything you need to get start charming and
orchestrating w/ juju.

Requires Docker 1.4.1

# To Run

  ```
  git clone https://github.com/whitmo/jujubox.git && cd jujubox

  sudo docker build -t jujubox ./
  sudo docker run  -ti jujubox
  ```

Or to use your existing ${JUJU_HOME}:

    sudo docker run --rm --privileged -v ${JUJU_HOME}:/home/ubuntu/.juju -i -t jujubox



# Once it's up

All your usual juju command should work:

    juju status


If you need to set up some cloud credentials:

    juju quickstart -i


## Future

Currently we are trying to enable this box o run juju's local provider inside the container.

### note host networking

route add -net 10.0.4.0 netmask 255.255.255.0 gw 172.17.0.6 dev docker0
