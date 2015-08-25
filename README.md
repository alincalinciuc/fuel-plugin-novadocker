fuel-plugin-novadocker
==================

Intro
-----
This plugin install nova-docker[6] on compute node.

Usage
-----
To install plugin please refer to [install guide](doc/content/installation.rst). To use it, refer to [user guide](doc/content/guide.rst)

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
/usr/lib/python2.7/dist-packages/nova/compute/hvtype.py

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

[6] https://wiki.openstack.org/wiki/Docker
