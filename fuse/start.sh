#!/bin/sh

## Check if container is already started
#if [ -f docker.pid ]; then
#    echo "Container is already started"
#    container_id=$(cat docker.pid)
#    echo "Stoping container $container_id..."
#    docker stop $container_id
#    rm -f docker.pid
#fi

docker run -t -i plopezse/jboss-fuse-6.1 /docker_init.sh

## Start JBoss Fuse container
#echo "Starting fuse container ..."
#image_fuse=$(docker run -d plopezse/jboss-fuse-6.1 /docker_init.sh)
#ip_fuse=$(docker inspect $image_fuse | grep IPAddress | awk '{print $2}' | tr -d '",')
#echo $image_fuse > docker.pid

## End
#echo "Installation finished"
#echo ""
#echo "Access to management console in http://$ip_fuse:8181"
#echo "Management user" 
#echo "  - user: admin"
#echo "  - password: asmin"

