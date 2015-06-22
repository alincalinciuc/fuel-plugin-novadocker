#!/bin/bash

##Variables
LOG_FILE="/var/log/docker-plugin"

#From hiera retrieves if all_nodes checkbox is checked
#Must do a workaround with python because
#hiera cannot return subkey correctly
all_nodes=`hiera fuel-plugin-docker | sed -e 's/=>/:/g' | \
python -c \
'import json; \
import sys; \
print str(json.load(sys.stdin)["fuel-plugin-docker_checkbox"]).lower()'`

#Check if the name of the node contains 'docker'
if (hiera user_node_name|grep -i docker) || $all_nodes
then
    echo "Proceed to docker installation" >> $LOG_FILE
else
    echo "No docker installation" >> $LOG_FILE
    echo "Exit" >> $LOG_FILE
    exit 0
fi

#Install docker
./docker-install.sh

apt-get update -y || yum update -y
apt-get install -y git || yum install -y git
#Install pip from this script to avoid possibile problem with the version in repository
wget -O- https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
ln -s `which pip` /usr/bin/pip
#Use a version of nova-docker adapt for fuel 6.1 Juno.
git clone -b stable/juno https://github.com/ddepaoli3/nova-docker.git
cd nova-docker
python setup.py install

#Config nova
echo -e "[DEFAULT]\ncompute_driver=novadocker.virt.docker.DockerDriver" > /etc/nova/nova-compute.conf
echo '[Filters]' > /etc/nova/rootwrap.d/docker.filters
echo 'ln: CommandFilter, /bin/ln, root' >> /etc/nova/rootwrap.d/docker.filters
usermod -G docker nova

service nova-compute restart || service openstack-nova-compute restart

#Save images in compute node.
#For a known limit the compute search the image locally
#and don't get it from glance
images=(`hiera fuel-plugin-docker | \
sed -e 's/=>/:/g' | \
python -c \
'import json; \
import sys; \
print json.load(sys.stdin)["fuel-plugin-docker_text"].replace(" ","").replace(","," ")'`)

for image in ${images[@]}
do
    docker pull $image
done

exit 0
