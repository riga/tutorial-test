#!/usr/bin/env bash

action() {
    # determine the directy of this file (/docker) and the repo dir
    if [ ! -z "$ZSH_VERSION" ]; then
        local this_file="${(%):-%x}"
    else
        local this_file="${BASH_SOURCE[0]}"
    fi
    local this_dir="$( cd "$( dirname "$this_file" )" && pwd )"
    local repo_dir="$( cd "$( dirname "$this_dir" )" && pwd )"

    # some configs
    [ -z "$DOCKER_PORT" ] && DOCKER_PORT="8888"
    [ -z "$DOCKER_ROOT" ] && DOCKER_ROOT="0"

    # run the
    if [ "$DOCKER_ROOT" != "1" ]; then
        docker run \
            --rm \
            -ti \
            -w /tutorial \
            -v "$repo_dir":/tutorial \
            -e "NB_PORT=$DOCKER_PORT" \
            -p "$DOCKER_PORT":"$DOCKER_PORT" \
            -u $(id -u):$(id -g) \
            riga/iml2019lbn $@
    else
        docker run \
            --rm \
            -ti \
            -w /tutorial \
            -v "$repo_dir":/tutorial \
            -e "NB_PORT=$DOCKER_PORT" \
            -p "$DOCKER_PORT":"$DOCKER_PORT" \
            riga/iml2019lbn $@
    fi
}
action "$@"
