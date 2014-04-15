#!/bin/sh

# Check if container is already started
if [ -f docker.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker.pid
fi

# Start MariaDB server container
echo "Strting MariaDB server ..."
image_mariadb=$(docker run -d plopezse/MariaDB)
ip_mariadb=$(docker inspect $image_mariadb | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image_mariadb > docker.pid

# End
echo "Installation finished"
echo ""
echo "MariaDB server started in $ip_mariadb:3306"
echo "Try to connect: mysql -h $ip_mariadb -u dockeruser -p password"

