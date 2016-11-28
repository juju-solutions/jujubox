#!/bin/bash
#set -o xtrace


# Only remove the docker images that are built by this script.
REMOVE_IMAGE=""
# The first parameter is the IMAGE Repository name.
TAG=$1

if [ -z "$TAG" ]; then
  TAG=jujubox-test-image
  # Build a docker image to test.
  docker build -q -t $TAG ./
  # Report the size.
  docker images $TAG --format {{.Size}}
  # Set the image name for removal.
  REMOVE_IMAGE=$TAG
fi

function remove {
  if [ -n "$REMOVE_IMAGE" ]; then
    echo "Removing docker image $REMOVE_IMAGE."
    docker rmi -f $REMOVE_IMAGE
  fi
}

function fail {
  if [ -n "$1" ]; then
    echo $1 >&2
  fi
  remove
  exit 1
}

# Run a command to check if Juju is installed.
CMD="/usr/bin/juju"
JUJU_OUTPUT=$(docker run --entrypoint "$CMD" $TAG)
if [ $? == 0 ]; then
  echo "Juju is installed in the container."
else
  fail "Juju is not installed."
fi
# Run a command to get the environment variables.
CMD="/usr/bin/env"
ENV_VARS=$(docker run --entrypoint "$CMD" $TAG)
if [[ $ENV_VARS == *'JUJU_DATA='* ]]; then
  echo "JUJU_DATA is an environment variable in the container."
else 
  fail "The environment variable JUJU_DATA is not set."
fi
if [[ $ENV_VARS == *'JUJU_REPOSITORY'* ]]; then
  echo "JUJU_REPOSITORY is an environment variable in the container."
else
  fail "The environment variable JUJU_REPOSITORY is not set."
fi

remove

echo "Tests passed."
exit 0
