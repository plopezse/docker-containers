#!/bin/sh

# Create container
echo "Creating MySQL container ..."
docker build --rm -q -t plopezse/MySQL ./docker

if [ $? -eq 0 ]; then
    echo "Container build"
else
    echo "Error building container"
fi


