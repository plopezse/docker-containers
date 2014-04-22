#!/bin/sh

# Create container
echo "Creating MariaDB container ..."
docker build --rm -q -t plopezse/MariaDB ./docker

if [ $? -eq 0 ]; then
    echo "Container build"
else
    echo "Error building container"
fi


