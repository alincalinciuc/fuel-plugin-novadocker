#!/bin/bash

#For more details please refer to https://wiki.openstack.org/wiki/Docker

LOG_FILE="/var/log/fuel-plugin-novadocker.log"
OS_NAME=""

##Install Docker function

#ubuntu 12.04, codename 'precise'
docker_install_ubuntu_precise()
{
    apt-get install --yes lxc-docker
}

#ubuntu 14.04, codename 'trusty'
docker_install_ubuntu_trusty()
{
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
    apt-get update
    apt-get install --yes linux-image-extra-$(uname -r) docker-engine
}

docker_install_centos_6()
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
    OS_NAME="ubuntu"
    OS_RELEASE=`lsb_release -c|cut -f 2`
else
    OS_NAME="centos"
    OS_RELEASE='6'
fi

echo "Install Docker on $OS_NAME machine" >> $LOG_FILE
docker_install_"$OS_NAME"_"$OS_RELEASE"
