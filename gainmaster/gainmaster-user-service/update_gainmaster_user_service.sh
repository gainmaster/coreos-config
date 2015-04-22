#!/usr/bin/env bash

# 
# Update Gainmaster User Service fleetd units
#

echo "==============================================================================================="
echo "[update_gainmaster_user_service.sh] - Updating fleetd units."
echo "==============================================================================================="
echo ""

# Stop running instances
fleetctl list-units --no-legend=true --fields=unit | grep '^gainmaster-user-service' | xargs -l fleetctl stop

# Destroy old units
fleetctl list-unit-files --no-legend=true --fields=unit | grep '^gainmaster-user-service' | xargs -l fleetctl destroy

# Insert new units
fleetctl submit \
    gainmaster-user-service@.service \
    gainmaster-user-service-vulcand-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_gainmaster_user_service.sh] - Update of fleetd units completed."
echo "==============================================================================================="