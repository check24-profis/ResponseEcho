#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# build server
./gradlew stage

# create image
docker build -f Dockerfile -t response-echo .

# create container (optional)
# docker create --name response-echo-container -p 80:8080 response-echo

# run image
docker run -d -p 80:8080 response-echo
