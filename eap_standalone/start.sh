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
image_eap=$(docker run -d plopezse/eap-standalone)
ip_eap=$(docker inspect $image_eap | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image_eap > docker.pid

# End
echo "Installation finished"
echo ""
echo "Server started in $ip_eap"

