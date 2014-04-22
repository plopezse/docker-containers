#!/bin/sh

# Create container
echo "Creating BPMS container ..."
cp installs/jboss-eap-6.1.1.zip docker/
cp installs/jboss-bpms-6.0.1.GA-redhat-4-deployable-eap6.x.zip docker/
cp installs/jboss-bpm-example-dist-6.0.1.GA-redhat-4.zip docker/

docker build --rm -q -t plopezse/bpms ./docker

if [ $? -eq 0 ]; then
    echo "Container build"
else
    echo "Error building container"
fi

rm -f docker/jboss-eap-6.1.1.zip
rm -f docker/jboss-bpms-6.0.1.GA-redhat-4-deployable-eap6.x.zip
rm -f docker/jboss-bpm-example-dist-6.0.1.GA-redhat-4.zip


