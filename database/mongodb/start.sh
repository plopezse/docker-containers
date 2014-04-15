#!/bin/sh

# Check if container is already started
if [ -f docker.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker.pid
fi

# Start MongoDB server container
echo "Starting MongoDB server ..."
image_mongodb=$(docker run -d plopezse/MongoDB)
ip_mongodb=$(docker inspect $image_mongodb | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image_mongodb > docker.pid

# Wait until MongoDB server is started

# Wait until mongodb starts
let maxLoops=30 timeToSleep=5 success=0
for (( try=0; try < maxLoops; ++try )); do
  echo -n "."
  if curl -s -o /dev/null http://$ip_mongodb:28017/; then
    success=1
    break
  fi
  sleep $timeToSleep
done

# End
if (( success )); then
  echo "Server started."
  echo ""
  echo "MongoDB server started in $ip_mongodb:27017"
  echo "Management console started at http://$ip_mongodb:28017/"
else
  echo "Server start fails: connection timeout"
fi

exit $(( 1-success ))

