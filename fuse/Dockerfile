############################################################
# Dockerfile to build container image of:
#   - JBoss Fuse 6.1
# Based on Fedora
############################################################

# Set the base image to Fedora
FROM fedora

# File Author / Maintainer
MAINTAINER "Pedro Lopez" "plopezse@redhat.com"

# Update the repository sources list
#RUN yum update -y

####### BASE SOFTWARE ############
RUN yum install -y net-tools; yum clean all
RUN yum install -y java-1.7.0-openjdk maven git unzip; yum clean all

####### INSTALL FUSE #############
ADD installs/jboss-fuse-full-6.1.0.redhat-379.zip /tmp/
WORKDIR /opt
RUN unzip /tmp/jboss-fuse-full-6.1.0.redhat-379.zip

####### CONFIG FUSE ##############
RUN ln -s /opt/jboss-fuse-6.1.0.redhat-379 /opt/fuse-6.1
RUN sed -i "s/#admin/admin/" /opt/fuse-6.1/etc/users.properties

####### INSTALL DEMO #############
RUN git clone https://github.com/plopezse/jboss-fuse-examples.git
WORKDIR /opt/jboss-fuse-examples
RUN mvn clean install

####### OPEN PORTS ###############
EXPOSE 22
EXPOSE 8181
EXPOSE 8101

####### START SERVICES ###########
ADD docker_init.sh /
WORKDIR /
ENTRYPOINT /docker_init.sh

