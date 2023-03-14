#!/bin/bash

echo "---------------------------------------------------------------------------"
echo "$0 [$1] [$2]"
echo "---------------------------------------------------------------------------"

# ./changeExistingDockerContainerMemory.sh <containername> <memoryinmegabytes>

docker update -m$2M $1
