#!/bin/bash

##Variables
LOG_FILE="/var/log/fuel-plugin-novadocker.log"

#Edit and restart glance
echo "Change glance-api.conf config file" >> $LOG_FILE
sed -i -e s/.*"container_formats".*/"container_formats=ami,ari,aki,bare,ovf,ova,docker"/ /etc/glance/glance-api.conf

echo "Restart glance api. PID: `service glance-api status`" >> $LOG_FILE
service openstack-glance-api restart || service glance-api restart
echo "Glance api restarted. PID: `service glance-api status`" >> $LOG_FILE

#Install docker
./docker-install.sh

exit 0
