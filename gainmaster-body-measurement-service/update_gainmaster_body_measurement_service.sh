#!/usr/bin/env bash

# 
# Update Gainmaster Body Measurement Service fleetd units
#

echo "==============================================================================================="
echo "[update_gainmaster_body_measurement_service.sh] - Updating fleetd units."
echo "==============================================================================================="
echo ""

# Stop running instances
fleetctl list-units --no-legend=true --fields=unit | grep '^gainmaster-body-measurement-service' | xargs -l fleetctl stop

# Destroy old units
fleetctl list-unit-files --no-legend=true --fields=unit | grep '^gainmaster-body-measurement-service' | xargs -l fleetctl destroy

# Insert new units
fleetctl submit \
    gainmaster-body-measurement-service@.service \
    gainmaster-body-measurement-service-vulcand-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_gainmaster_body_measurement_service.sh] - Update of fleetd units completed."
echo "==============================================================================================="