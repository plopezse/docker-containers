# Base on fedora image
FROM fedora

# Update the repository sources list
#RUN yum update -y

####### BASE SOFTWARE ############
RUN yum install -y unzip net-tools java-1.7.0-openjdk postgresql-server; yum clean all

####### POSTGRES #################
ADD ./postgresql-setup /usr/bin/postgresql-setup
ADD ./postgres_user.sh /postgres_user.sh
RUN chmod +x /usr/bin/postgresql-setup
RUN chmod +x /postgres_user.sh

RUN /usr/bin/postgresql-setup initdb
RUN grep -v "host    all" /var/lib/pgsql/data/pg_hba.conf > /var/lib/pgsql/data/pg_hba.conf.tmp
RUN mv /var/lib/pgsql/data/pg_hba.conf.tmp /var/lib/pgsql/data/pg_hba.conf
RUN echo "host    all     all         0.0.0.0/0       trust" >> /var/lib/pgsql/data/pg_hba.conf
RUN echo "host    rhq     rhqadmin    127.0.0.1/32    trust" >> /var/lib/pgsql/data/pg_hba.conf

ADD ./postgresql.conf /var/lib/pgsql/data/postgresql.conf
RUN chown -v postgres.postgres /var/lib/pgsql/data/postgresql.conf

RUN /postgres_user.sh

####### JON ######################
ADD ./jon/jon-server-3.2.0.GA.zip /tmp/jon-server-3.2.0.GA.zip
RUN unzip -q /tmp/jon-server-3.2.0.GA.zip -d /opt
RUN rm -rf /tmp/jon-server-3.2.0.GA.zip

ADD ./config_jon.sh /config_jon.sh
ADD ./install_jon.sh /install_jon.sh
RUN chmod +x /config_jon.sh
RUN chmod +x /install_jon.sh
RUN /config_jon.sh
RUN /install_jon.sh

####### JON PLUGINS ##############
ADD ./jon/jon-plugins /tmp/jon-plugins
ADD ./unzip_plugins.sh /unzip_plugins.sh
RUN chmod +x /unzip_plugins.sh
RUN /unzip_plugins.sh
RUN mv -u /tmp/jon-plugin-pack/jon-plugin-pack-*/*.jar /opt/jon-server-3.2.0.GA/plugins/
RUN rm -rf /tmp/jon-plugins /tmp/jon-plugin-pack


####### START  SCRIPT ############
ADD ./start_jon.sh /start_jon.sh
RUN chmod +x /start_jon.sh

####### OPEN PORTS ###############
#EXPOSE 22
#EXPOSE 80
#EXPOSE 5432
EXPOSE 7080
#EXPOSE 8080


####### ENTRYPOINT ###############
ENTRYPOINT ["/start_jon.sh"]

