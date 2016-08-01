User Guide
==========

1. Create a new environment

2. In the 'Settings' section:

	a. activate the plugin clicking on 'Nova Docker installer'
	b. write the name of docker containers that automatically will be downloaded and loaded to glance. The official docker container repository is `hub.docker.com`_.
	c. To install on all computes node select the 'Install on all compute' option

	  .. image:: _static/docker-plugin-setting.png
  	    :alt: Plugin Screenshot

	d. To install on one ore more specific nodes rename the nodes with a name containing 'docker'.

    .. image:: _static/fuel-docker-screen.png
        :alt: Node Screenshot

3. Deploy the environment.

4. For how to use nova-docker refers to `official guide`_.

.. target-notes::
.. _hub.docker.com: https://hub.docker.com/
.. _official guide: https://wiki.openstack.org/wiki/Docker#Using_Nova-Docker
