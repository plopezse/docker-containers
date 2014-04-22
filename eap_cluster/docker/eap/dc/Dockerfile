############################################################
# Dockerfile to build container image of:
#   - JBoss Enterprise Application Platform (EAP) 6.2
# Based on Fedora
############################################################

# Set the base image to Fedora
FROM fedora

# File Author / Maintainer
MAINTAINER "Pedro Lopez" "plopezse@redhat.com"

# Update the repository sources list
#RUN yum update -y; yum clean all

####### BASE SOFTWARE ############
RUN yum install -y net-tools; yum clean all
RUN yum install -y java-1.7.0-openjdk; yum clean all
RUN yum install -y unzip; yum clean all

####### EAP ######################
ADD jboss-eap-6.2.0.zip /tmp/
WORKDIR /opt
RUN unzip /tmp/jboss-eap-6.2.0.zip
RUN /opt/jboss-eap-6.2/bin/add-user.sh admin admin123! --silent
ADD domain.xml /opt/jboss-eap-6.2/domain/configuration/
ADD host-master.xml /opt/jboss-eap-6.2/domain/configuration/

####### OPEN PORTS ###############
#EXPOSE 22
EXPOSE 8080
EXPOSE 9990
EXPOSE 9999

####### START SERVICES ###########
ADD docker_init.sh /docker_init.sh
RUN chmod +x /docker_init.sh

CMD ["/docker_init.sh"]
