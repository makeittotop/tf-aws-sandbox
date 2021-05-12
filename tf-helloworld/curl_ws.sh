#!/bin/bash -e

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' "$WEBSERVER")" != 200 ]]; 
do sleep 5;
echo "retrying..."
done
