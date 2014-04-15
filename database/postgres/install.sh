#!/bin/sh

# Create container
echo "Creating PostgreSQL container ..."
docker build --rm -q -t plopezse/PostgreSQL ./docker

echo "Container created"

