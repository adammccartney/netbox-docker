#!/bin/bash

# ad_custom_build.sh is a simple wrapper for the build script
# note: this assumes that you've got a locally checked-out version of netbox at URL (defined below)

export DOCKERFILE=${DOCKERFILE:-ad_netbox.Dockerfile.tmpl}
export IMAGE_NAMES=ad_netbox
export DOCKER_TAG=${DOCKER_TAG:-4.0.3-ad}
export URL="file://$HOME/src/netbox-community/netbox"

./build.sh v4.0.3 master
