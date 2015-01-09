# Juju Box

A docker container w/ everything you need to get start charming and
orchestrating w/ juju.

Requires Docker 1.4.1

# To Run

  ```
  docker build -t jujubox ./
  docker run --privileged -ti jujubox
  ```

# host networking

route add -net 10.0.4.0 netmask 255.255.255.0 gw 172.17.0.6 dev docker0
