Installation Guide
==================
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
