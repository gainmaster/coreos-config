#!/usr/bin/env bash

# 
# Start Docker Socket fleetd units
#

echo "==============================================================================================="
echo "[start_docker_socket.sh] - Starting Docker Socker fleetd units."
echo "==============================================================================================="
echo ""

# Start Docker Socket fleetd units
fleetctl start docker-socket.service

echo ""
echo "==============================================================================================="
echo "[start_docker_socket.sh] - Docker Socket fleetd units started."
echo "==============================================================================================="