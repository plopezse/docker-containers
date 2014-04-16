# Set the base image to Fedora
FROM fedora

# File Author / Maintainer
MAINTAINER "Pedro Lopez" "plopezse@redhat.com"

# Update the repository sources list
#RUN yum update -y; yum clean all

####### INSTALL Base Software ############
RUN yum -y install net-tools wget unzip; yum clean all

RUN yum -y install java-1.7.0-openjdk.x86_64
ENV JAVA_HOME /usr/lib/jvm/jre/

####### INSTALL DerbyDB ############
RUN wget http://www.eu.apache.org/dist//db/derby/db-derby-10.10.1.1/db-derby-10.10.1.1-bin.zip
RUN mkdir /opt/apache
RUN mv db-derby-10.10.1.1-bin.zip /opt/apache
RUN cd /opt/apache; unzip db-derby-10.10.1.1-bin.zip

####### Configure DerbyDB ############
ENV DERBY_HOME /opt/apache/db-derby-10.10.1.1-bin
ENV CLASSPATH ${DERBY_HOME}/lib/derbynet.jar:${DERBY_HOME}/lib/derbytools.jar:${DERBY_HOME}/lib/derbyclient.jar
# Add grant to Java policy
RUN sed -i -e 's/};/permission java.net.SocketPermission "localhost:1527", "listen";\n};/g' /usr/lib/jvm/jre/lib/security/java.policy

####### OPEN PORTS ###############
EXPOSE 1527

####### START SERVICES ###########
CMD java -cp ${CLASSPATH} org.apache.derby.drda.NetworkServerControl start

