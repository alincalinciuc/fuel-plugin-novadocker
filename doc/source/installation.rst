Installation Guide
==================

1. Prepare your environment for plugin development following the `official guide <https://wiki.openstack.org/wiki/Fuel/Plugins#Preparing_an_environment_for_plugin_development>`_

2. Clone this repository
```
git clone https://github.com/ddepaoli3/fuel-plugin-novadocker.git
```

3. Create the plugin to load into Fuel
```
fpb --build fuel-plugin-novadocker
```

4. Copy the rpm packet to fuel machine
```
scp fuel-plugin-novadocker/fuel-plugin-novadocker-*.noarch.rpm root@10.20.0.2:
```

5. Install the plugin on the Fuel master machine
```
fuel plugins --install fuel-plugin-novadocker-*.noarch.rpm
```
