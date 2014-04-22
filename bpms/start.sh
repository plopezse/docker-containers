#!/bin/sh

# Check if container is already started
if [ -f docker.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker.pid
fi

# Start JBoss EAP container
echo "Starting EAP domain controller ..."
image_bpms=$(docker run -d plopezse/bpms)
ip_bpms=$(docker inspect $image_bpms | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image_bpms > docker.pid

echo "Installation finished"
echo ""
echo "EAP started in $ip_bpms"
echo "BPMS running in http://$ip_bpms:8080/business-central"

