#!/usr/bin/env bash
#
# Update CoreOS cloud config 
#
#

echo "[update_cloud_config.sh] Updating CoreOS cloud config for ${HOSTNAME}."

# Delete old config
sudo rm -f /var/lib/coreos-install/user_data

# Insert new config
sudo cp ./${HOSTNAME}-config.yml /var/lib/coreos-install/user_data

echo "==============================================================================="
echo "[update_cloud_config.sh] - Update of CoreOS cloud config completed."
echo "|update_cloud_config.sh] - Run 'locksmithctl reboot' to load new configuration."
echo "==============================================================================="