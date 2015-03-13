#!/usr/bin/env bash

# 
# Update vulcand fleetd units
#

echo "==============================================================================="
echo "[update_vulcand_fleet.sh] - Updating vulcand fleetd units."
echo "==============================================================================="
echo ""

# Stop old jenkins units
fleetctl list-units --no-legend=true | grep vulcand | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old jenkins units
fleetctl list-unit-files --no-legend=true | grep vulcand | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new jenkins units
fleetctl submit vulcand@.service vulcand-registrator@.service

echo ""
echo "==============================================================================="
echo "[update_vulcand_fleet.sh] - Update of vulcand fleetd units completed."
echo "|update_vulcand_fleet.sh] - Run 'fleetctl start' to start vulcand fleetd units."
echo "==============================================================================="