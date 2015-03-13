#!/usr/bin/env bash

# 
# Update SkyDNS node registrator fleetd units
#

echo "==============================================================================================="
echo "[update_skydns_node_registrator.sh] - Updating SkyDNS node registrator fleetd units."
echo "==============================================================================================="
echo ""

# Stop old SkyDNS node registrator fleetd units
fleetctl list-units --no-legend=true | grep '^skydns-node-registrator' | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old SkyDNS node registrator fleetd units
fleetctl list-unit-files --no-legend=true | grep '^skydns-node-registrator' | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new SkyDNS node registrator fleetd units
fleetctl submit skydns-node-registrator.service

echo ""
echo "==============================================================================================="
echo "[update_skydns_node_registrator.sh] - Update of SkyDNS node registrator fleetd units completed."
echo "|update_skydns_node_registrator.sh] - Run 'start_skydns_node_registrator.sh' to start units."
echo "==============================================================================================="