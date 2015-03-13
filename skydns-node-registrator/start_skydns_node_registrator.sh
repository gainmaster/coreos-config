#!/usr/bin/env bash

# 
# Start SkyDNS node registrator fleetd unit
#

echo "=================================================================================="
echo "[start_skydns_node_registrator.sh] - Starting SkyDNS node registrator fleetd unit."
echo "=================================================================================="
echo ""

# Start SkyDNS node registrator fleetd unit
fleetctl start skydns-node-registrator.service

echo ""
echo "=================================================================================="
echo "[start_skydns_node_registrator.sh] - SkyDNS node registrator fleetd unit started."
echo "=================================================================================="