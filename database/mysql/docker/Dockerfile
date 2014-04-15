# Set the base image to Fedora
FROM fedora

# File Author / Maintainer
MAINTAINER "Pedro Lopez" "plopezse@redhat.com"

# Update the repository sources list
#RUN yum update -y; yum clean all

####### INSTALL MySQL ############
RUN yum -y install community-mysql-server community-mysql pwgen supervisor bash-completion psmisc net-tools; yum clean all

####### Configure PostgreSQL ############
ADD ./supervisord.conf /etc/supervisord.conf

ADD ./config_mysql.sh /config_mysql.sh
RUN chmod 755 /config_mysql.sh
RUN /config_mysql.sh

# RUN echo %sudo	ALL=NOPASSWD: ALL >> /etc/sudoers

####### OPEN PORTS ###############
EXPOSE 3306

####### START SERVICES ###########
ADD ./docker_init.sh /docker_init.sh
RUN chmod +x /docker_init.sh

CMD ["/bin/bash", "/docker_init.sh"]

