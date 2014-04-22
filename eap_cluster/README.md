JBoss EAP Docker container
==========================

Dockerfile & scripts to build an Apache HTTPD + Mod_cluster + JBoss EAP domain container

This compilation starts four containers:
  1 - Apache http web server with mod_cluster
  2 - JBoss EAP domain controller
  3 - JBoss EAP host (host-1) with 2 servers (server-one, server-two)
  4 - JBoss EAP host (host-2) with 2 servers (server-three, server-four)


Copy "jboss-eap-6.2.0.zip" into installs directory

Install / create containers:
./install.sh

Start all containers:
./start.sh

Stop all containers:
./stop.sh
