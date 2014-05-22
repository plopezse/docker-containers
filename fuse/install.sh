#!/bin/sh

# Create containers
echo "Creating fuse container ..."
docker build --rm -t plopezse/jboss-fuse-6.1 .

if [ $? -eq 0 ]; then
    echo "Container build"
else
    echo "Error building container"
fi

