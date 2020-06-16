#!/bin/bash
cd "$(dirname "$0")" || exit 1
source ../helper-functions.sh

_docker build --build-arg VERSION=4 -t ${DOCKER_REPOSITORY}bearssl_server:0.4 -f Dockerfile-0_x --target bearssl-server .
_docker build --build-arg VERSION=4 -t ${DOCKER_REPOSITORY}bearssl_client:0.4 -f Dockerfile-0_x --target bearssl-client .

_docker build --build-arg VERSION=5 -t ${DOCKER_REPOSITORY}bearssl_server:0.5 -f Dockerfile-0_x --target bearssl-server .
_docker build --build-arg VERSION=5 -t ${DOCKER_REPOSITORY}bearssl_client:0.5 -f Dockerfile-0_x --target bearssl-client .

exit "$EXITCODE"
