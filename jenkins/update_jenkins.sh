#!/usr/bin/env bash

# 
# Update Jenkins fleetd units
#

echo "==============================================================================================="
echo "[update_jenkins.sh] - Updating Jenkins fleetd units."
echo "==============================================================================================="
echo ""

# Stop old Jenkins units
fleetctl list-units --no-legend=true | grep '^jenkins' | awk 'NR =1 {print $1}' | xargs -l fleetctl stop

# Destroy old Jenkins units
fleetctl list-unit-files --no-legend=true | grep '^jenkins' | awk 'NR =1 {print $1}' | xargs -l fleetctl destroy

# Insert new Jenkins units
fleetctl submit jenkins-master@.service jenkins-master-registrator@.service jenkins-slave@.service

echo ""
echo "==============================================================================================="
echo "[update_jenkins.sh] - Update of Jenkins fleetd units completed."
echo "|update_jenkins.sh] - Run 'start_jenkins_master.sh <id>' to start Jenkins master units."
echo "==============================================================================================="