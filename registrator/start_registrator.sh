#!/usr/bin/env bash

# 
# Start Registrator fleetd unit
#

echo "=========================================================="
echo "[start_registrator.sh] - Starting registrator fleetd unit."
echo "=========================================================="
echo ""

# Start Registrator fleetd unit
fleetctl start registrator.service

echo ""
echo "=========================================================="
echo "[start_registrator.sh] - Registrator fleetd unit started."
echo "=========================================================="