fuel-plugin-novadocker
==================

Intro
-----

This fuel plugin[1] install nova-docker[2] on compute node.

Usage
-----

To install plugin please refer to [install
guide](doc/source/installation.rst).

To use it, refer to [user guide](doc/source/guide.rst)

Developer guide
===============

This section describes the operation performed by the plugin.

There are 3 bash script:

* compute.sh: executed on all computes after the deploy
* controller.sh: executed on all controllers after the deploy
* save-image.sh: executed on the primary controller after the deploy

compute.sh
----------

It installs and configures docker and nova-docker.  At the end saves
the listed docker images.

controller.sh
-------------

It installs docker and allow glance to accept docker format
containers.

save-image.sh
-------------

Load to glance the docker images downloaded.

Notes
=====

/usr/lib/python2.7/dist-packages/nova/compute/hvtype.py

At the momement the only way to load a container into openstack is
save the module on docker-compute host; nova-docker cannot load
container from glance. That is a knwon problem [3].  A solution was
proposed [4], but in my tests does't work.

<!---
References
==========
-->

[1]: https://wiki.openstack.org/wiki/Fuel/Plugins

[2]: https://wiki.openstack.org/wiki/Docker

[3]: https://ask.openstack.org/en/question/55125/which-version-of-nova-docker-should-be-used-with-openstack-juno

[4]: https://github.com/fikovnik/nova-docker/commit/1a08ea55df98f46fc5752adc4d5488508dacc827

