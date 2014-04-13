#!/bin/sh

# Start JBoss EAP container
echo "Starting EAP domain controller ..."
image_bpms=$(docker run -d plopezse/bpms)
ip_bpms=$(docker inspect $image_bpms | grep IPAddress | awk '{print $2}' | tr -d '",')

echo "Installation finished"
echo ""
echo "EAP started in $ip_bpms"
echo "BPMS running in http://$ip_bpms:8080/business-central"

