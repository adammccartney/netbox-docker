#!/bin/bash

# Module for defining plugins that we want to load

########################
# CUSTOM
########################

# (re)Install plugins
# You can add new plugins by editing the following array

plugins=(
    "/opt/netbox-plugin-demo"
    #"/opt/netbox-wireguard-plugin"
        )

function install_plugins () {
    for plugin in ${plugins[@]}; do
        pip install -e "${plugin}"
        echo "✅ (Reinstalled ${plugin})"
    done
}

########################
