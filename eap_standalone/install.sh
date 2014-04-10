#!/bin/sh

# Create virtual machines
echo "Creating eap container ..."
docker build --rm -t plopezse/eap-standalone .
echo "Container created"

