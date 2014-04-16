#!/bin/sh

# Create container
echo "Creating DerbyDB container ..."
docker build --rm -q -t plopezse/Derby ./docker

echo "Container created"

