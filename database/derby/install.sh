#!/bin/sh

# Create container
echo "Creating DerbyDB container ..."
docker build --rm -q -t plopezse/Derby ./docker

if [ $? -eq 0 ]; then
    echo "Container build"
else
    echo "Error building container"
fi
