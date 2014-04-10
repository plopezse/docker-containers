#!/bin/bash

# Env variables 
DOCKER_IP=$(ifconfig eth0 | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | awk '{print $2}')

# Start Apache
/usr/sbin/httpd -k start

# Start EAP
/opt/jboss-eap-6.2/bin/standalone.sh -b 0.0.0.0 -Djboss.bind.address.management=$DOCKER_IP -c standalone-ha.xml
