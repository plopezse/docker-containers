#!/bin/sh

# Start JBoss EAP virtual machine
echo "Starting EAP domain controller ..."
image_eap=$(docker run -d plopezse/eap-standalone)
ip_eap=$(docker inspect $image_eap | grep IPAddress | awk '{print $2}' | tr -d '",')

# End
echo "Installation finished"
echo ""
echo "Server started in $ip_eap"

