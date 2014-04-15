# Set the base image to Fedora
FROM fedora

# File Author / Maintainer
MAINTAINER "Pedro Lopez" "plopezse@redhat.com"

# Update the repository sources list
#RUN yum update -y; yum clean all

####### INSTALL MariaDB ############
RUN yum -y install mariadb-server pwgen supervisor psmisc net-tools; yum clean all

####### Configure MariaDB ############
ADD ./supervisord.conf /etc/supervisord.conf

ADD ./config_mariadb.sh /config_mariadb.sh
RUN chmod 755 /config_mariadb.sh
RUN /config_mariadb.sh

####### OPEN PORTS ###############
EXPOSE 3306

####### START SERVICES ###########
ADD ./docker_init.sh /docker_init.sh
RUN chmod +x /docker_init.sh

CMD ["/bin/bash", "/docker_init.sh"]

