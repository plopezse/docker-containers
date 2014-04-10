#!/bin/bash

# Env variables 
DOCKER_IP=$(ifconfig eth0 | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | awk '{print $2}')

# Start EAP
/opt/jboss-eap-6.2/bin/domain.sh --host-config=host-node-1.xml -b $DOCKER_IP -Djboss.domain.master.address=$DC_IP -Dapache.httpd.address=$APACHE_IP
