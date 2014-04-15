#!/bin/sh

# Check if container is already started
if [ -f docker.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker.pid
fi

# Start MySQL server container
echo "Starting MySQL server ..."
image_mysql=$(docker run -d plopezse/MySQL)
ip_mysql=$(docker inspect $image_mysql | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image_mysql > docker.pid

# End
echo "Installation finished"
echo ""
echo "MySQL server started in $ip_mysql:3306"
echo "Try to connect: mysql -h $ip_mysql -u dockeruser -p password"

