#!/usr/bin/env bash

# 
# Update Gainmaster Account Service fleetd units
#

echo "==============================================================================================="
echo "[update_gainmaster_user_measurement_service.sh] - Updating fleetd units."
echo "==============================================================================================="
echo ""

# Stop running service instances
fleetctl list-units --no-legend=true --fields=unit | grep '^gainmaster-user-measurement-service' | xargs -l fleetctl stop

# Destroy old fleetd units
fleetctl list-unit-files --no-legend=true --fields=unit | grep '^gainmaster-user-measurement-service' | xargs -l fleetctl destroy

# Insert new fleetd units
fleetctl submit \
    gainmaster-user-measurement-service@.service \
    gainmaster-user-measurement-service-vulcand-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_gainmaster_user_measurement_service.sh] - Update of fleetd units completed."
echo "==============================================================================================="