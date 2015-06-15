fuel-plugin-docker
============

This plugin install nova-docker on compute node.

How to
======
1. Clone this repo and create the plugin. (More info at [3])
2. Copy the rpm packet to fuel machine
```scp fuel-plugin-docker-*.noarch.rpm root@10.20.0.2:```
3. On fuel machine
```fuel plugins --install fuel-plugin-docker-*.noarch.rpm```
4. Create a new environment
5. Change the name of the compute nodes on which docker will be installed with a name that contain 'docker'
6. In the settings section activate docker plugin
7. Deploy!

Notes
=====
At the momement the only way to load a container into openstack is save the module on docker-compute host;
nova-docker cannot load container from glance. That is a knwon problem [1].
A solution was proposed [2], but in my tests does't work.

[1]: https://ask.openstack.org/en/question/55125/which-version-of-nova-docker-should-be-used-with-openstack-juno
[2]: https://github.com/fikovnik/nova-docker/commit/1a08ea55df98f46fc5752adc4d5488508dacc827
[3]: https://wiki.openstack.org/wiki/Fuel/Plugins