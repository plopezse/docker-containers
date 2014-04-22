#!/bin/sh

# Create container
echo "Creating MongoDB container ..."
docker build --rm -q -t plopezse/MongoDB ./docker

if [ $? -eq 0 ]; then
    echo "Container build"
else
    echo "Error building container"
fi


