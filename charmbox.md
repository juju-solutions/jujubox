# Charmbox

Charmbox is a docker container that contains the tools for charm development and charm review.

# Download the jujubox repository

    git clone https://github.com/whitmo/jujubox.git && cd jujubox

# Build and run charmbox 

    sudo docker build -f CharmersDockerfile -t charmbox /path/to/jujubox
    sudo docker run --rm -v ${JUJU_HOME}:/home/ubuntu/.juju ${JUJU_REPOSITORY}:/home/ubuntu/charm-repo -it charmbox

    # for reviewing
    $ubuntu@ab3d:~/$ workon charm-review
