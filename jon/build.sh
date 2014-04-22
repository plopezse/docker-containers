#!/bin/bash

cp -rp jon/ docker/jon

echo "Building JON container ..."
docker build -t jboss-on ./docker

if [ $? -eq 0 ]; then
    echo "Container build"
else
    echo "Error building container"
fi

rm -rf docker/jon
