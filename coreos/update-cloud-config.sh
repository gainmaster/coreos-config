#!/usr/bin/env bash
#
# Update CoreOS cloud config 
#
#

echo "Updating CoreOS cloud config for ${HOSTNAME}."

# Delete old config
sudo rm -f /var/lib/coreos-install/user_data
echo "Deleted old config at /var/lib/coreos-install/user_data."

# Insert new config
sudo cp ./${HOSTNAME}-config.yml /var/lib/coreos-install/user_data
echo "Copied new config ${HOSTNAME}-config.yml to /var/lib/coreos-install/user_data."

echo "Update of CoreOS cloud config completed."
echo "Run "locksmithctl reboot" to load new configuration."