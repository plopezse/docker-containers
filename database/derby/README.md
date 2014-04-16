Derby DB Docker container
==========================

Dockerfile & scripts to build a Derby DB server container

Install:
./install.sh

Start container:
./start.sh

Stop container:
./stop.sh

Connect to Derby DB server:
  - Execute client: java -jar $DERBY_HOME/lib/derbyrun.jar ij
  - Connecting to server: CONNECT 'jdbc:derby://$ip_derby:1527/testdb;create=true';"
