#!/usr/bin/env bash

# 
# Update Docker Socket fleetd units
#

echo "==============================================================================================="
echo "[update_docker_socket.sh] - Updating Registrator fleetd units."
echo "==============================================================================================="
echo ""

# Stop old Registrator fleetd units
fleetctl list-units --no-legend=true | grep '^docker-socket.socket' | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old Registrator fleetd units
fleetctl list-unit-files --no-legend=true | grep '^docker-socket.socket' | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new Registrator fleetd units
fleetctl submit docker-socket.socket

echo ""
echo "==============================================================================================="
echo "[update_docker_socket.sh] - Update of Docker Socket fleetd units completed."
echo "|update_docker_socket.sh] - Run 'start_docker_socket.sh' to start units."
echo "==============================================================================================="