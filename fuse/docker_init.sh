#!/bin/bash

# Env variables 
DOCKER_IP=$(ifconfig eth0 | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | awk '{print $2}')

# Start Fuse
echo "Starting fuse..."
/opt/fuse-6.1/bin/start
sleep 30
echo "Fuse started"

# Init Fuse
echo "Init fabric..."
/opt/fuse-6.1/bin/client -h 127.0.0.1 -a 8101 -u admin -p admin "fabric:create --wait-for-provisioning"

# Install demo project
echo "Installing demo project..."
/opt/fuse-6.1/bin/client -h 127.0.0.1 -a 8101 -u admin -p admin "osgi:install -s mvn:org.jboss.fuse/simple-demo"

echo "Fuse started!"
tail -f /opt/fuse-6.1/data/log/karaf.log
