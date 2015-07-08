fuel-plugin-docker
============

This plugin install nova-docker on compute node.

User guide
==========
1. Prepare your environment for plugin development following the official guide: [4]
2. Clone this repository
```
git clone https://github.com/ddepaoli3/fuel-plugin-docker.git
```
3. Create the plugin to load into Fuel
```
fpb --build fuel-plugin-docker
```
4. Copy the rpm packet to fuel machine
```
scp fuel-plugin-docker/fuel-plugin-docker-*.noarch.rpm root@10.20.0.2:
```
5. Install the plugin on the Fuel master machine
```
fuel plugins --install fuel-plugin-docker-*.noarch.rpm
```
6. Create a new environment
7. Change the name of the compute nodes on which docker will be installed with a name that contain 'docker'
![node screenshot](https://github.com/ddepaoli3/fuel-plugin-docker/blob/master/doc/images/fuel-docker-screen.png?raw=true)
8. In the settings section activate docker plugin. Here you can add the name of docker images that will
load and load automatically to glance.
If 'Install on compute node' is set nova-docker is installed on all nodes, ignoring the name of the node
![plugin screenshot](https://github.com/ddepaoli3/fuel-plugin-docker/blob/master/doc/images/docker-plugin-setting.png?raw=true)
9. Deploy!

Developer guide
===============
This section describes the operation performed by the plugin.
There are 3 bash script:
* compute.sh: executed on all computes after the deploy
* controller.sh: executed on all controllers after the deploy
* save-image.sh: executed on the primary controller after the deploy

compute.sh
----------
It installs and configures docker and nova-docker
At the end saves the listed docker images.

controller.sh
-------------
It installs docker and allow glance to accept docker format containers.

save-image.sh
-------------
Load to glance the docker images downloaded.

Notes
=====
At the momement the only way to load a container into openstack is save the module on docker-compute host;
nova-docker cannot load container from glance. That is a knwon problem [1].
A solution was proposed [2], but in my tests does't work.

References
==========
[1] https://ask.openstack.org/en/question/55125/which-version-of-nova-docker-should-be-used-with-openstack-juno

[2] https://github.com/fikovnik/nova-docker/commit/1a08ea55df98f46fc5752adc4d5488508dacc827

[3] https://wiki.openstack.org/wiki/Fuel/Plugins

[4] https://wiki.openstack.org/wiki/Fuel/Plugins#Preparing_an_environment_for_plugin_development

[5] https://docs.docker.com/installation/ubuntulinux/
