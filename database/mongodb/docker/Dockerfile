############################################################
# Dockerfile to build container image of MongoDB server
# Based on Fedora
############################################################

# Set the base image to Fedora
FROM fedora

# File Author / Maintainer
MAINTAINER "Pedro Lopez" "plopezse@redhat.com"

# Update the repository sources list
#RUN yum update -y

####### Install MongoDB ############
RUN yum -y install mongodb-server net-tools; yum clean all

####### Configure MongoDB ############
RUN mkdir -p /data/db
#RUN sed -i -e 's/127.0.0.1/MongoDB-server/g' /etc/mongodb.conf

####### OPEN PORTS ###############
EXPOSE 22
EXPOSE 27017
EXPOSE 28017

####### START SERVICES ###########
ADD docker_init.sh /
WORKDIR /
ENTRYPOINT /docker_init.sh

