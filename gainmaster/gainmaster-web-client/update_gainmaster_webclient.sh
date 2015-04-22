#!/usr/bin/env bash

# 
# Update gainmaster-webclient master fleetd units
#

echo "==============================================================================================="
echo "[update_gainmaster_webclient.sh] - Updating gainmaster-webclient fleetd units."
echo "==============================================================================================="
echo ""

# Stop old Jenkins master units
fleetctl list-units --no-legend=true | grep '^gainmaster' | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old Jenkins master units
fleetctl list-unit-files --no-legend=true | grep '^gainmaster' | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new Jenkins master units
fleetctl submit gainmaster-webclient-angular@.service gainmaster-webclient-nginx@.service gainmaster-webclient-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_gainmaster_frontend.sh] - Update of gainmaster-webclient fleetd units completed."
echo "|update_gainmaster_frontend.sh] - Run 'start_gainmaster_webclient.sh <id>' to start gainmaster-webclient units."
echo "==============================================================================================="