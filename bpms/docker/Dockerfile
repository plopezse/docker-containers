############################################################
# Dockerfile to build container image of:
#   - JBoss Enterprise Application Platform (EAP) 6.2
# Based on Fedora
############################################################

# Set the base image to Ubuntu
FROM fedora

# File Author / Maintainer
MAINTAINER "Pedro Lopez" "plopezse@redhat.com"

# Update the repository sources list
#RUN yum update -y

####### BASE SOFTWARE ############
RUN yum install -y net-tools
RUN yum install -y java-1.7.0-openjdk
RUN yum install -y unzip

WORKDIR /opt

####### EAP ######################
ADD jboss-eap-6.1.1.zip /tmp/
RUN unzip /tmp/jboss-eap-6.1.1.zip

####### BPMS######################
ADD jboss-bpms-6.0.1.GA-redhat-4-deployable-eap6.x.zip /tmp/
RUN unzip -o /tmp/jboss-bpms-6.0.1.GA-redhat-4-deployable-eap6.x.zip

ADD jboss-bpm-example-dist-6.0.1.GA-redhat-4.zip /tmp/
RUN mkdir /opt/jboss-eap-6.1/standalone/configuration/initial
WORKDIR /opt/jboss-eap-6.1/standalone/configuration/initial
RUN unzip /tmp/jboss-bpm-example-dist-6.0.1.GA-redhat-4.zip

RUN /opt/jboss-eap-6.1/bin/add-user.sh admin admin123! --silent
RUN /opt/jboss-eap-6.1/bin/add-user.sh -a --silent --role admin,developer,analyst,user,manager --user jbossadmin --password admin123!
RUN /opt/jboss-eap-6.1/bin/add-user.sh -a --silent --role user,appraiser,broker,manager --user jbossuser --password user123!

ADD standalone.xml /opt/jboss-eap-6.1/standalone/configuration/

####### OPEN PORTS ###############
#EXPOSE 22
EXPOSE 8080
EXPOSE 9990
EXPOSE 9999

####### START SERVICES ###########
ADD docker_init.sh /docker_init.sh
RUN chmod +x /docker_init.sh

CMD ["/docker_init.sh"]
