#!/bin/bash

# Check if container is already started
if [ -f docker.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker.pid
fi

# Start Jboss ON server container
echo -e "\nStarting JON container ..."
container_id=$(docker run -h jboss-on-container -d jboss-on)
ip_container=$(docker inspect $container_id | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $container_id > docker.pid

# End
echo ""
echo -e "JON container $container_id started in $ip_container"
echo -e "Go to $ip_container:7080 in your browser\n"

