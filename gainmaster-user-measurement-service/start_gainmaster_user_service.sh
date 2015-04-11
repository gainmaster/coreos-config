#!/usr/bin/env bash

# 
# Start Gainmaster User Service instances
#

echo "==============================================================================================="
echo "[start_gainmaster_user_measurement_service.sh] - Starting service instance."
echo "==============================================================================================="
echo ""

# Start fleet unit
fleetctl start \
    gainmaster-user-measurement-service@${1}.service \
    gainmaster-user-measurement-service-vulcand-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_gainmaster_user_measurement_service.sh] - Service instance started."
echo "==============================================================================================="