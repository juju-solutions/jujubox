# Charmbox

This box is for charm development and charm review.

# Run it

    sudo docker build -f CharmersDockerfile -t charmbox
    sudo docker run --rm -v ${JUJU_HOME}:/home/ubuntu/.juju ${JUJU_REPOSITORY}:/home/ubuntu/charm-repo -it charmbox

    # for reviewing
    $ubuntu@ab3d:~/$ workon charm-review
