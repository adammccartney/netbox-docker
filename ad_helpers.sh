#!/bin/sh

# helper functions for running django based workflows remotely
# note that we want these functions to work across different shells (bash, zsh, etc.),
# so try to keep this file POSIX compliant!

# -----------------------------------------------------------------------------
# Utilities
# -----------------------------------------------------------------------------

die() {
    # **
    # Prints a message to stderr & exits script with non-successful code "1"
    # *

    printf '%s\n' "$@" >&2
    return 1
}

# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------

NETBOX_DOCKER_CONTAINER=${NETBOX_DOCKER_CONTAINER:-netbox-docker-netbox-1}
NETBOX_PYTHON="/opt/netbox/venv/bin/python"


# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

netbox_makemigrations_plugin_dry_run () {
    local plugin="$1"
    if [ -z ${plugin} ]; then
        die 'Error: no plugin. Please specify a plugin to run makemigrations on'
        return 1
    else
        docker exec -it ${NETBOX_DOCKER_CONTAINER} /bin/bash -c "${NETBOX_PYTHON} manage.py makemigrations ${plugin} --dry-run"
    fi
}


netbox_makemigrations_plugin () {
    local plugin="$1"
    if [ -z ${plugin} ]; then
        die 'Error: no plugin. Please specify a plugin to run makemigrations on'
        return 1
    else
        docker exec -it ${NETBOX_DOCKER_CONTAINER} /bin/bash -c "${NETBOX_PYTHON} manage.py makemigrations ${plugin}"
    fi
}


netbox_migrate () {
    docker exec -it ${NETBOX_DOCKER_CONTAINER} /bin/bash -c "${NETBOX_PYTHON} manage.py migrate"
}




