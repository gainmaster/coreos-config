#!/usr/bin/env bash

# 
# Start SkyDNS node registrator fleetd units
#

echo "==============================================================================================="
echo "[start_skydns_node_registrator.sh] - Starting SkyDNS node registrator fleetd units."
echo "==============================================================================================="
echo ""

# Start SkyDNS node registrator fleetd units
fleetctl start skydns-node-registrator.service

echo ""
echo "==============================================================================================="
echo "[start_skydns_node_registrator.sh] - SkyDNS node registrator fleetd units started."
echo "==============================================================================================="