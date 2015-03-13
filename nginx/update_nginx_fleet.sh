#!/usr/bin/env bash

# 
# Update Jenkins fleetd units
#

echo "==============================================================================="
echo "[update_nginx_fleet.sh] - Updating nginx fleetd units."
echo "==============================================================================="
echo ""

# Stop old jenkins units
fleetctl list-units --no-legend=true | grep nginx | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old jenkins units
fleetctl list-unit-files --no-legend=true | grep nginx | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new jenkins units
fleetctl submit nginx@.service nginx-registrator@.service

echo ""
echo "==============================================================================="
echo "[update_nginx_fleet.sh] - Update of nginx fleetd units completed."
echo "|update_nginx_fleet.sh] - Run 'fleetctl start' to start nginx fleetd units."
echo "==============================================================================="