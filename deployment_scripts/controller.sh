#!/bin/bash

##Variables
LOG_FILE="/var/log/docker-plugin"

#Edit and restart glance
echo "Change glance-api.conf config file" >> $LOG_FILE
sed -i -e s/.*"container_formats".*/"container_formats=ami,ari,aki,bare,ovf,ova,docker"/ /etc/glance/glance-api.conf

echo "Restart glance api. PID: `service glance-api status`" >> $LOG_FILE
service glance-api restart
echo "Glance api restarted. PID: `service glance-api status`" >> $LOG_FILE

echo "Install Docker" >> $LOG_FILE
curl -sSL https://get.docker.com/ubuntu/ | sh

exit 0
