#!/usr/bin/env bash

# 
# Update Jenkins master fleetd units
#

echo "==============================================================================================="
echo "[update_gainmaster_frontend.sh] - Updating Gainmaster frontend fleetd units."
echo "==============================================================================================="
echo ""

# Stop old Jenkins master units
fleetctl list-units --no-legend=true | grep '^gainmaster' | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old Jenkins master units
fleetctl list-unit-files --no-legend=true | grep '^gainmaster' | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new Jenkins master units
fleetctl submit gainmaster-frontend-angular@.service gainmaster-frontend-nginx@.service gainmaster-frontend-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_gainmaster_frontend.sh] - Update of Gainmaster frontend fleetd units completed."
echo "|update_gainmaster_frontend.sh] - Run 'start_gainmaster_frontend.sh <id>' to start Gainmaster frontend units."
echo "==============================================================================================="