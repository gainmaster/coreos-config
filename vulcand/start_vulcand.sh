#!/usr/bin/env bash

# 
# Start Vulcand fleetd units
#

echo "==============================================================================================="
echo "[start_vulcand.sh] - Starting Vulcand fleetd units."
echo "==============================================================================================="
echo ""

# Start Vulcand fleetd unit
fleetctl start vulcand@${1}.service vulcand-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_vulcand.sh] - Vulcand fleetd units started."
echo "==============================================================================================="