#!/usr/bin/env bash
#
# Script for reloading a set of units
# Usage: ./reload.sh <units-directory>
#
# Exit codes:
# 1 - units directory does not exist

declare ROOT_DIRECTORY=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
declare UNITS_DIRECTORY=${ROOT_DIRECTORY}/${1}
declare UNITS_BASENAME=$(basename ${UNITS_DIRECTORY})

if [ ! -d "${UNITS_DIRECTORY}" ]; then
    echo "Unable to find units directory: ${UNITS_DIRECTORY}"
    exit 1
fi

# Find units
units=()
fleetctl list-units --no-legend=true --fields=unit | grep "^$UNITS_BASENAME" | while read unit ; do
    case "${unit_instances[@]}" in  ${unit}) continue; ;; esac
    echo "Found unit: ${unit}"
    units+=($unit)
done

# Stop units
echo "Stopping units"
for unit in "${units[@]}"; do
    fleetctl stop ${unit}
done

# Destroy unit files
echo "Destroying unit files"
fleetctl list-unit-files --no-legend --fields=unit | grep "^$UNITS_BASENAME" | xargs -l fleetctl destroy

# Submit unit files
echo "Submitting unit files"
for unit_file in "${UNITS_DIRECTORY}/*"; do
    fleetctl submit $(basename ${unit_file})
done
