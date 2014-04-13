#!/bin/sh

#
# Create container
#

# Start Apache web server container
echo "Creating httpd container ..."
docker build --rm -q -t plopezse/eap-httpd ./docker/http

# Domain Controller
echo "Creating eap domain-controller container ..."
cp installs/jboss-eap-6.2.0.zip docker/eap/dc/
docker build --rm -q -t plopezse/eap-dc ./docker/eap/dc

# Host 1
echo "Creating eap host-1 container ..."
mv docker/eap/dc/jboss-eap-6.2.0.zip docker/eap/node1/
docker build --rm -q -t plopezse/eap-node-1 ./docker/eap/node1

# Host 2
echo "Creating eap host-2 container ..."
mv docker/eap/node1/jboss-eap-6.2.0.zip docker/eap/node2/
docker build --rm -q -t plopezse/eap-node-2 ./docker/eap/node2
rm -f docker/eap/node2/jboss-eap-6.2.0.zip

echo "Containers created"

