#!/bin/sh

# Create container
echo "Creating MongoDB container ..."
docker build --rm -q -t plopezse/MongoDB ./docker

echo "Container created"

