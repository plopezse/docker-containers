#!/bin/bash

sed -e 's/^jboss.bind.address=$/jboss.bind.address=0.0.0.0/g' /opt/jon-server-3.2.0.GA/bin/rhq-server.properties > /opt/jon-server-3.2.0.GA/bin/rhq-server.properties.tmp
mv /opt/jon-server-3.2.0.GA/bin/rhq-server.properties.tmp /opt/jon-server-3.2.0.GA/bin/rhq-server.properties

sed -e 's/9999/6999/g' -e 's/9990/6990/g' -e 's/9443/6443/g' /opt/jon-server-3.2.0.GA/jbossas/standalone/configuration/standalone-full.xml > /opt/jon-server-3.2.0.GA/jbossas/standalone/configuration/standalone-full.xml.tmp
mv /opt/jon-server-3.2.0.GA/jbossas/standalone/configuration/standalone-full.xml.tmp /opt/jon-server-3.2.0.GA/jbossas/standalone/configuration/standalone-full.xml

