#!/bin/bash

#For more details please refer to https://wiki.openstack.org/wiki/Docker

LOG_FILE="/var/log/docker-plugin"
OS_NAME=""

##Install Docker function
docker_install_ubuntu()
{
    curl -sSL https://get.docker.com/ubuntu/ | sh
}

docker_install_centos()
{
#http://www.liquidweb.com/kb/how-to-install-docker-on-centos-6/
    rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    yum update -y
    yum -y install docker-io
    service docker start
    chkconfig docker on
}

if hiera repo_setup|grep -i ubuntu
then
    echo "Install Docker on Ubuntu machine" >> $LOG_FILE
    OS_NAME="ubuntu"
else
    echo "Install Docker on Centos machine" >> $LOG_FILE
    OS_NAME="centos"
fi

docker_install_$OS_NAME