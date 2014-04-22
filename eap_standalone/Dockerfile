############################################################
# Dockerfile to build container image of:
#   - Apache HTTP server
#   - JBoss Enterprise Application Platform (EAP) 6.2
#   - Mod_cluster
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
RUN yum install -y java-1.7.0-openjdk; yum clean all
RUN yum install -y unzip; yum clean all

####### HTTPD ####################
RUN yum install -y httpd; yum clean all

####### EAP ######################
ADD installs/jboss-eap-6.2.0.zip /tmp/
WORKDIR /opt
RUN unzip /tmp/jboss-eap-6.2.0.zip
RUN /opt/jboss-eap-6.2/bin/add-user.sh admin admin123! --silent

####### MOD_CLUSTER ##############
RUN yum install -y mod_cluster; yum clean all
RUN sed -i -e 's/LoadModule proxy_balancer_module/#LoadModule proxy_balancer_module/g' /etc/httpd/conf.modules.d/00-proxy.conf

RUN sed -i '1,4d' /etc/httpd/conf.d/mod_cluster.conf
RUN tr -d '#' < /etc/httpd/conf.d/mod_cluster.conf > /etc/httpd/conf.d/mod_cluster.conf.new
RUN sed -i -e 's/Require host 127.0.0.1/Require all granted/g' /etc/httpd/conf.d/mod_cluster.conf.new
RUN echo 'ServerAdvertise On' >> /etc/httpd/conf.d/mod_cluster.conf.new
RUN rm /etc/httpd/conf.d/mod_cluster.conf
RUN mv /etc/httpd/conf.d/mod_cluster.conf.new /etc/httpd/conf.d/mod_cluster.conf

####### OPEN PORTS ###############
EXPOSE 22
EXPOSE 80
EXPOSE 8080
EXPOSE 9990
EXPOSE 9999

####### START SERVICES ###########
ADD docker_init.sh /
WORKDIR /
ENTRYPOINT /docker_init.sh

