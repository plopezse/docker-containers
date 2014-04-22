# Set the base image to Fedora
FROM fedora

# File Author / Maintainer
MAINTAINER "Pedro Lopez" "plopezse@redhat.com"

# Update the repository sources list
#RUN yum update -y; yum clean all

####### INSTALL PostgreSQL ############
RUN yum -y install postgresql-server postgresql postgresql-contrib supervisor net-tools; yum clean all

####### Configure PostgreSQL ############
ADD ./postgresql-setup /usr/bin/postgresql-setup
RUN chmod +x /usr/bin/postgresql-setup
ADD ./supervisord.conf /etc/supervisord.conf

RUN /usr/bin/postgresql-setup initdb
ADD ./postgresql.conf /var/lib/pgsql/data/postgresql.conf
RUN chown -v postgres.postgres /var/lib/pgsql/data/postgresql.conf
RUN echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf

ADD ./postgres_user.sh /postgres_user.sh
RUN chmod +x /postgres_user.sh
RUN /postgres_user.sh

####### OPEN PORTS ###############
EXPOSE 5432

####### START SERVICES ###########
ADD ./docker_init.sh /docker_init.sh
RUN chmod +x /docker_init.sh

CMD ["/bin/bash", "/docker_init.sh"]
