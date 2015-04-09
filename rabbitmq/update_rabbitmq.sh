#!/usr/bin/env bash

# 
# Update RabbitMQ fleetd units
#

echo "==============================================================================================="
echo "[update_rabbitmq.sh] - Updating RabbitMQ master fleetd units."
echo "==============================================================================================="
echo ""

# Stop old Vulcand units
fleetctl list-units --no-legend=true | grep '^rabbitmq' | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old Vulcand units
fleetctl list-unit-files --no-legend=true | grep '^rabbitmq' | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new Vulcand units
fleetctl submit rabbitmq@.service rabbitmq-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_rabbitmq.sh] - Update of RabbitMQ fleetd units completed."
echo "|update_rabbitmq.sh] - Run 'update_rabbitmq.sh <id>' to start RabbitMQ."
echo "==============================================================================================="