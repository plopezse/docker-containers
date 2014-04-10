#!/bin/bash

# Env variables 
DOCKER_IP=$(ifconfig eth0 | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | awk '{print $2}')

# Start EAP
/opt/jboss-eap-6.2/bin/domain.sh --host-config=host-master.xml -b $DOCKER_IP -Djboss.bind.address.management=$DOCKER_IP -Dapache.httpd.address=$APACHE_IP
