# Charmbox

Charmbox is a docker container that contains the tools for charm development and charm review.

# Download the jujubox repository

    git clone https://github.com/whitmo/jujubox.git && cd jujubox

# Build and run charmbox

    sudo docker build -f CharmersDockerfile -t charmbox /path/to/jujubox
    sudo docker run --rm -v ${JUJU_HOME}:/home/ubuntu/.juju -v ${JUJU_REPOSITORY}:/home/ubuntu/charm-repo -it charmbox

    # for reviewing
    $ubuntu@ab3d:~/$ workon charm-review


# Run against a locally hosted local provider

Juju local provider allows modelling cloud deploys on your local
machines using lxc containers instead of virtual machines.  Currently
local provider does not run inside docker; we hope to add this feature
soon.

It is possible however to run the dockerized client against a host
bootstrapped local provider.

    juju switch local
    juju bootstrap
    sudo docker run --rm --net=host -v ${JUJU_HOME}:/home/ubuntu/.juju -v ${JUJU_REPOSITORY}:/home/ubuntu/charm-repo -it charmbox

Now you can get all the nice idempotent charmbox behavior for testing
and running charms with all the convenience and speed of local
provider. Don't forget to clean up your local provider on exit:

    juju destroy-environment local
