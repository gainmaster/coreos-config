#!/usr/bin/env bash

# 
# Update Gainmaster Account Service fleetd units
#

echo "==============================================================================================="
echo "[update_gainmaster_acocunt_service.sh] - Updating Jenkins fleetd units."
echo "==============================================================================================="
echo ""

# Stop old Gainmaster Account Service units
fleetctl list-units --no-legend=true --fields=unit | grep '^gainmaster-account-service' | xargs -l fleetctl stop

# Destroy old Gainmaster Account Service units
fleetctl list-unit-files --no-legend=true --fields=unit | grep '^gainmaster-account-service' | xargs -l fleetctl destroy

# Insert new Gainmaster Account Service units
fleetctl submit gainmaster-account-service@.service gainmaster-account-service-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_gainmaster_acocunt_service.sh] - Update of Gainmaster Account Service fleetd units completed."
echo "|update_gainmaster_acocunt_service.sh] - Run 'start_gainmaster_acocunt_service.sh <id>' to start Gainmaster Account Service  units."
echo "==============================================================================================="