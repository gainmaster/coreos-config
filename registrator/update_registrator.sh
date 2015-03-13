#!/usr/bin/env bash

# 
# Update Registrator fleetd units
#

echo "==============================================================================================="
echo "[update_registrator.sh] - Updating Registrator fleetd units."
echo "==============================================================================================="
echo ""

# Stop old Registrator fleetd units
fleetctl list-units --no-legend=true | grep '^registrator' | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old Registrator fleetd units
fleetctl list-unit-files --no-legend=true | grep '^registrator' | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new Registrator fleetd units
fleetctl submit registrator.service

echo ""
echo "==============================================================================================="
echo "[update_registrator.sh] - Update of Registrator fleetd units completed."
echo "|update_registrator.sh] - Run 'start_registrator.sh' to start units."
echo "==============================================================================================="