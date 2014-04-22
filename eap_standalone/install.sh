#!/bin/sh

# Create containers
echo "Creating eap container ..."
docker build -q --rm -t plopezse/eap-standalone .

if [ $? -eq 0 ]; then
    echo "Container build"
else
    echo "Error building container"
fi

