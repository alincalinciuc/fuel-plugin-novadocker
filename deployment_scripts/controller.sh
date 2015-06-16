#!/bin/bash

##Variables
LOG_FILE="/var/log/docker-plugin"

#Edit and restart glance
sed -i -e s/.*"container_formats".*/"container_formats=ami,ari,aki,bare,ovf,ova,docker"/ /etc/glance/glance-api.conf
service glance-api restart

curl -sSL https://get.docker.com/ubuntu/ | sudo sh

exit 0
