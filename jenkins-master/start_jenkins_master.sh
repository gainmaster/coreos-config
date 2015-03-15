#!/usr/bin/env bash

# 
# Start Jenkins master fleetd units
#

echo "==============================================================================================="
echo "[start_jenkins_master.sh] - Starting Jenkins master fleetd units."
echo "==============================================================================================="
echo ""

# Start Jenkins master fleetd unit
fleetctl start jenkins-master@${1}.service jenkins-master-registrator@${1}.service

echo ""
echo "==============================================================================================="
echo "[start_jenkins_master.sh] - Jenkins master fleetd units started."
echo "==============================================================================================="