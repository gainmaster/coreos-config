#!/usr/bin/env bash

# 
# Start Registrator fleetd units
#

echo "==============================================================================================="
echo "[start_registrator.sh] - Starting registrator fleetd units."
echo "==============================================================================================="
echo ""

# Start Registrator fleetd units
fleetctl start registrator.service

echo ""
echo "==============================================================================================="
echo "[start_registrator.sh] - Registrator fleetd units started."
echo "==============================================================================================="