PostgreSQL Docker container
==========================

Dockerfile & scripts to build a PostgreSQL server container

Install:
./install.sh

Start container:
./start.sh

Stop container:
./stop.sh

Connect to PostgreSQL server:
psql -h {container_ip} -U dockeruser -d dockerdb
