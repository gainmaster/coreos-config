#!/usr/bin/env bash

# 
# Start Gainmaster Body Measurement Service instance
#

echo "==============================================================================================="
echo "[start_gainmaster_body_measurement_service.sh] - Starting service instance."
echo "==============================================================================================="
echo ""

# Start units
fleetctl start \
    gainmaster-body-measurement-service@${1}.service \
    gainmaster-body-measurement-service-vulcand-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_gainmaster_body_measurement_service.sh] - Service instance started."
echo "==============================================================================================="