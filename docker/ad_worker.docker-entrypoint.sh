#!/bin/bash
# Wrapper for the worker command
# used for development, it installs a desired plugin before running the worker 
# It's a bit of a hack, don't use it in production!

set -e

# Conditional load of module with some helper functions
if [ -f /opt/netbox/ad_common.sh ]; then
    . /opt/netbox/ad_common.sh
    install_plugins
fi

/opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py rqworker

