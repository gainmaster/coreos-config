#!/usr/bin/env bash

# 
# Start gainmaster-webclient fleetd units
#

echo "==============================================================================================="
echo "[start_frontend.sh] - Starting gainmaster-webclient fleetd units."
echo "==============================================================================================="
echo ""

# Start Jenkins master fleetd unit
fleetctl start gainmaster-webclient-angular@${1}.service gainmaster-webclient-nginx@${1}.service gainmaster-webclient-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_frontend.sh] - gainmaster-webclient fleetd units started."
echo "==============================================================================================="