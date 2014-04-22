JBoss BPMS Docker container
==========================

Dockerfile & scripts to build an JBoss BPMS container

Copy into installs directory:
  - jboss-eap-6.1.1.zip
  - jboss-bpms-6.0.1.GA-redhat-4-deployable-eap6.x.zip
  - jboss-bpm-example-dist-6.0.1.GA-redhat-4.zip

This container creates 3 users:
    admin / admin123! --> Jboss EAP administration user
    jbossadmin / admin123! --> BPMS administrator (roles: admin, developer, analyst, user, manager)
    jbossuser / user123! --> BPMS user (roles: user, appraiser, broker, manager)

Install / create container:
./install.sh

Start container:
./start.sh

Stop container:
./stop.sh
