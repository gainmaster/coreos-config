#!/usr/bin/env bash

# 
# Start Gainmaster Account Service fleetd units
#

echo "==============================================================================================="
echo "[start_gainmaster_account_service.sh] - Starting Gainmaster Account Service fleetd units."
echo "==============================================================================================="
echo ""

# Start Gainmaster Account Service fleetd unit
fleetctl start gainmaster-account-service@${1}.service gainmaster-account-service-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_gainmaster_account_service.sh] - Gainmaster Account Service fleetd units started."
echo "==============================================================================================="