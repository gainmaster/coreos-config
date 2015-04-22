#!/usr/bin/env bash

# 
# Start RabbitMQ fleetd units
#

echo "==============================================================================================="
echo "[start_rabbitmq.sh] - Starting RabbitMQ fleetd units."
echo "==============================================================================================="
echo ""

# Start Vulcand fleetd unit
fleetctl start rabbitmq@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_rabbitmq.sh] - RabbitMQ fleetd units started."
echo "==============================================================================================="