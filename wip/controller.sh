#!/bin/bash

#Edit and restart glance
sed -i -e s/.*"container_formats".*/"container_formats=ami,ari,aki,bare,ovf,ova,docker"/ /etc/glance/glance-api.conf
service glance-api restart

curl -sSL https://get.docker.com/ubuntu/ | sudo sh
source /root/openrc admin admin

docker pull cirros
docker save cirros | glance image-create --is-public=True --container-format=docker --disk-format=raw --name cirros
