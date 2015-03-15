#!/usr/bin/env bash

# 
# Update Vulcand fleetd units
#

echo "==============================================================================================="
echo "[update_vulcand.sh] - Updating Jenkins master fleetd units."
echo "==============================================================================================="
echo ""

# Stop old Vulcand units
fleetctl list-units --no-legend=true | grep '^vulcand' | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old Vulcand units
fleetctl list-unit-files --no-legend=true | grep '^vulcand' | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new Vulcand units
fleetctl submit vulcand@.service vulcand-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_vulcand.sh] - Update of Vulcand fleetd units completed."
echo "|update_vulcand.sh] - Run 'start_vulcand.sh <id>' to start Vulcand."
echo "==============================================================================================="