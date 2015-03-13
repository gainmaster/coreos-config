#!/usr/bin/env bash

# 
# Update Jenkins master fleetd units
#

echo "==============================================================================================="
echo "[update_jenkins_master.sh] - Updating Jenkins master fleetd units."
echo "==============================================================================================="
echo ""

# Stop old jenkins units
fleetctl list-units --no-legend=true | grep '^jenkins-master' | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old jenkins units
fleetctl list-unit-files --no-legend=true | grep '^jenkins-master' | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new jenkins units
fleetctl submit jenkins-master@.service jenkins-master-registrator@.service

echo ""
echo "==============================================================================================="
echo "[update_jenkins_master.sh] - Update of Jenkins master fleetd units completed."
echo "|update_jenkins_master.sh] - Run 'start_jenkins_master.sh <id>' to start Jenkins master units."
echo "==============================================================================================="