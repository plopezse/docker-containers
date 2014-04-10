#!/bin/bash

# Env variables 
#DOCKER_IP=$(ifconfig eth0 | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | awk '{print $2}')
#echo $DOCKER_IP

# Start Apache

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/*

exec /usr/sbin/apachectl -D FOREGROUND
