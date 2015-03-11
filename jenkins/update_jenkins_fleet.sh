#!/usr/bin/env bash

# 
# Update Jenkins fleetd units
#

echo "==============================================================================="
echo "[update_jenkins_fleet.sh] - Updating Jenkins fleetd units."
echo "==============================================================================="
echo ""

# Stop old jenkins units
fleetctl list-units --no-legend=true | grep jenkins | awk 'NR =1 {print $1}' | xargs -l fleetctl stop
echo "[update_jenkins_fleet.sh] - Old jenkins fleetd units stoped"

# Destroy old jenkins units
fleetctl list-unit-files --no-legend=true | grep jenkins | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy
echo "[update_jenkins_fleet.sh] - Old jenkins fleetd units destroyed"

# Insert new jenkins units
fleetctl submit jenkins-master@.service jenkins-master-registrator@.service
echo "[update_jenkins_fleet.sh] - New jenkins fleetd units submited"

echo ""
echo "==============================================================================="
echo "[update_jenkins_fleet.sh] - Update of Jenkins fleetd units completed."
echo "|update_jenkins_fleet.sh] - Run 'fleetctl start' to start jenkins fleetd units."
echo "==============================================================================="