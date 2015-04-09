#!/usr/bin/env bash

# 
# Start Gainmaster User Service instances
#

echo "==============================================================================================="
echo "[start_gainmaster_user_service.sh] - Starting Gainmaster User Service instance."
echo "==============================================================================================="
echo ""

# Start Gainmaster User Service fleetd unit
fleetctl start gainmaster-user-service@${1}.service gainmaster-user-service-vulcand-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_gainmaster_user_service.sh] - Gainmaster Account Service instance started."
echo "==============================================================================================="