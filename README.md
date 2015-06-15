fuel-plugin-docker
============

Plugin description


Notes
=====
At the momement the only way to load a container into openstack is save the module on docker-compute host;
nova-docker cannot load container from glance. That is a knwon problem [1].
A solution was proposed [2], but in my tests does't work.

[1]: https://ask.openstack.org/en/question/55125/which-version-of-nova-docker-should-be-used-with-openstack-juno
[2]: https://github.com/fikovnik/nova-docker/commit/1a08ea55df98f46fc5752adc4d5488508dacc827