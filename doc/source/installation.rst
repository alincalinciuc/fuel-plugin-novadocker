Installation Guide
==================

1. Prepare your environment for plugin development following the
   `official guide
   <https://wiki.openstack.org/wiki/Fuel/Plugins#Preparing_an_environment_for_plugin_development>`_

2. Clone this repository

  .. code:: bash

    git clone https://github.com/SmartInfrastructures/fuel-plugin-novadocker.git

3. Create the plugin to load into Fuel

  .. code:: bash

    fpb --build fuel-plugin-novadocker

4. Copy the rpm packet to fuel machine

  .. code:: bash

    scp fuel-plugin-novadocker/fuel-plugin-novadocker-*.noarch.rpm root@10.20.0.2:

5. Install the plugin on the Fuel master machine

  .. code:: bash

    fuel plugins --install fuel-plugin-novadocker-*.noarch.rpm
