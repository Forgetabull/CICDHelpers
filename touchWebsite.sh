#!/bin/bash
## Add a string to a existing list of strings
echo "---------------------------------------------------------------------------"
echo "touchWebsite.sh  [$1]"
echo "---------------------------------------------------------------------------"
url="$1"


status_code=$(curl --write-out %{http_code} --silent --output /dev/null $url)

echo "Waiting on valid response."
while [ "$status_code" -ge 500 ]
do
  read -t 3 -p "."
  status_code=$(curl --write-out %{http_code} --silent --output /dev/null $url)
done
curl --connect-timeout 30 $url
echo " "
echo "---------------------------------------------------------------------------"
echo "touchWebsite.sh Done."
echo "---------------------------------------------------------------------------"

