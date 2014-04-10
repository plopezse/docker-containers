#!/bin/sh

#
# Start services
#

# Start Apache web server virtual machine
echo "Starting httpd server ..."
image_httpd=$(docker run -d plopezse/eap-httpd)
ip_httpd=$(docker inspect $image_httpd | grep IPAddress | awk '{print $2}' | tr -d '",')

# Start JBoss EAP virtual machine

# Domain Controller
echo "Starting EAP domain controller ..."
image_eap_dc=$(docker run -d -e "APACHE_IP=$ip_httpd" plopezse/eap-dc)
ip_eap_dc=$(docker inspect $image_eap_dc | grep IPAddress | awk '{print $2}' | tr -d '",')

# Host 1
echo "Starting EAP Host 1 ..."
image_eap1=$(docker run -d -e "APACHE_IP=$ip_httpd" -e "DC_IP=$ip_eap_dc" plopezse/eap-node-1)
ip_eap1=$(docker inspect $image_eap1 | grep IPAddress | awk '{print $2}' | tr -d '",')

# Host 2
echo "Starting EAP Host 2 ..."
image_eap2=$(docker run -d -e "APACHE_IP=$ip_httpd" -e "DC_IP=$ip_eap_dc" plopezse/eap-node-2)
ip_eap2=$(docker inspect $image_eap2 | grep IPAddress | awk '{print $2}' | tr -d '",')

# End
echo "Installation finished"
echo ""
echo "Apache web server started in $ip_httpd"
echo "EAP domain controller started in $ip_eap_dc"
echo "EAP node 1 started in $ip_eap1"
echo "EAP node 2 started in $ip_eap2"

