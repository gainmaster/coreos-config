#!/usr/bin/env bash

# 
# Start Gainmaster User Service instance
#

echo "==============================================================================================="
echo "[start_gainmaster_user_service.sh] - Starting service instance."
echo "==============================================================================================="
echo ""

# Start units
fleetctl start \
    gainmaster-user-service@${1}.service \
    gainmaster-user-service-vulcand-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_gainmaster_user_service.sh] - Service instance started."
echo "==============================================================================================="