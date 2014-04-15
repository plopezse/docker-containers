#!/bin/sh

# Create container
echo "Creating MariaDB container ..."
docker build --rm -q -t plopezse/MariaDB ./docker

echo "Container created"

