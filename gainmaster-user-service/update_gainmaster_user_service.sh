#!/usr/bin/env bash

# 
# Update Gainmaster Account Service fleetd units
#

echo "==============================================================================================="
echo "[update_gainmaster_user_service.sh] - Updating fleetd units."
echo "==============================================================================================="
echo ""

# Stop running Gainmaster User Service instances
fleetctl list-units --no-legend=true --fields=unit | grep '^gainmaster-user-service' | xargs -l fleetctl stop

# Destroy old Gainmaster User Service units
fleetctl list-unit-files --no-legend=true --fields=unit | grep '^gainmaster-user-service' | xargs -l fleetctl destroy

# Insert new Gainmaster User Service units
fleetctl submit gainmaster-user-service@.service gainmaster-user-service-vulcand-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_gainmaster_user_service.sh] - Update of fleetd units completed."
echo "==============================================================================================="