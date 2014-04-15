#!/bin/sh

# Create container
echo "Creating MySQL container ..."
docker build --rm -q -t plopezse/MySQL ./docker

echo "Container created"

