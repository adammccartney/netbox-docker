#!/bin/bash


########################
# CUSTOM
########################

# (re)Install plugins
# You can add new plugins by editing the following array


########################

SLEEP_SECONDS=${HOUSEKEEPING_INTERVAL:=86400}
echo "Interval set to ${SLEEP_SECONDS} seconds"
while true; do
    date
  
    # Conditional load of module with some helper functions
    # Used for installing plugins that we wish to develop
    if [ -f /opt/netbox/ad_common.sh ]; then
        . /opt/netbox/ad_common.sh
        install_plugins
    fi
      
    /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py housekeeping
    sleep "${SLEEP_SECONDS}s"
done
