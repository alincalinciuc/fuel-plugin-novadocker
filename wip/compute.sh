#!/bin/bash

#Install docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

#Install nova-docker
apt-get update
apt-get install git
wget -O- https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
ln -s `which pip` /usr/bin/pip
git clone -b stable/juno https://github.com/ddepaoli3/nova-docker.git
cd nova-docker
python setup.py install

#Config nova
echo -e "[DEFAULT]\ncompute_driver=novadocker.virt.docker.DockerDriver" > /etc/nova/nova-compute.conf
echo '[Filters]' > /etc/nova/rootwrap.d/docker.filters
echo 'ln: CommandFilter, /bin/ln, root' >> /etc/nova/rootwrap.d/docker.filters
usermod -G docker nova

service nova-compute restart
