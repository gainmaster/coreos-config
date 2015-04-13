#!/usr/bin/env bash

# 
# Start Gainmaster OAuth Service instance
#

echo "==============================================================================================="
echo "[start_gainmaster_oauth_service.sh] - Starting service instance."
echo "==============================================================================================="
echo ""

# Start units
fleetctl start \
    gainmaster-oauth-service@${1}.service \
    gainmaster-oauth-service-vulcand-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_gainmaster_oauth_service.sh] - Service instance started."
echo "==============================================================================================="