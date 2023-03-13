#!/bin/bash

JENKINS_URL="<jenkinsurl>"
UTILITY_USER="<yourusername>"
UTILITY_PW="<jenkinspassword>"

echo "------------------------------------------------------------------------------"
echo "AsyncResourceDisposer Cleanup - Clicks 'Stop Tracking' on all outstanding jobs"
echo "------------------------------------------------------------------------------"

curl -s http://${JENKINS_URL}/administrativeMonitor/AsyncResourceDisposer/ -u${UTILITY_USER}:${UTILITY_PW} | tr '"' '\n' | grep 'stop-tracking' | cut -d '-' -f 3 | sort -n | while read ASYNC_THREAD; do curl http://${JENKINS_URL}/administrativeMonitor/AsyncResourceDisposer/stopTracking -u${UTILITY_USER}:${UTILITY_PW} -X POST --data "id=${ASYNC_THREAD}"; echo "Attempted [${ASYNC_THREAD}]"; done

echo "------------------------------------------------------------------------------"
echo "Done"
echo "------------------------------------------------------------------------------"

