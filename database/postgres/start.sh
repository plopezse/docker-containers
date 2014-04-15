#!/bin/sh

# Check if container is already started
if [ -f docker.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker.pid
fi

# Start PostgreSQL server container
echo "Starting PostgreSQL server ..."
image_postgres=$(docker run -d plopezse/PostgreSQL)
ip_postgres=$(docker inspect $image_postgres | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image_postgres > docker.pid

# End
echo "Installation finished"
echo ""
echo "PostgreSQL server started in $ip_postgres:5432"
echo "Try to connect: psql -h $ip_postgres -U dockeruser -d dockerdb"

