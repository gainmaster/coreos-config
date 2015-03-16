#!/usr/bin/env bash

# 
# Start Gainmaster frontend fleetd units
#

echo "==============================================================================================="
echo "[start_frontend.sh] - Starting Gainmaster frontend fleetd units."
echo "==============================================================================================="
echo ""

# Start Jenkins master fleetd unit
fleetctl start gainmaster-frontend-angular@${1}.service gainmaster-frontend-nginx@${1}.service gainmaster-frontend-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_frontend.sh] - Gainmaster frontend fleetd units started."
echo "==============================================================================================="