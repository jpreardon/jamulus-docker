# Jamulus 🎶

Note: This is a fork of [jamulus-docker](https://github.com/grundic/jamulus-docker). This [Docker](https://hub.docker.com/r/jpreardon/jamulus) image uses the precompiled distribution of the latest version of the [Jamulus](https://github.com/jamulussoftware/jamulus) music server (rather than building it from source).

The Jamulus software enables musicians to perform real-time jam sessions over the internet. There is one server running the Jamulus server software which collects the audio data from each Jamulus client, mixes the audio data and sends the mix back to each client.

# Usage

Here is an example snippet to help you get started creating a container.

## Docker

```
docker run \
  -e TZ=America/New_York \
  --name jamulus \
  -d --rm \
  -p 22124:22124/udp \
  -v $(pwd)/jam:/jam \
  jpreardon/jamulus:latest \
  --server --nogui \
  -n -s -p 22124 -l /jam/jamulus.log -w "Welcome to Jamulus docker server."
```

You can monitor output with `docker logs -f jamulus`

| ⚠️ To improve performance, please consider using docker's [realtime scheduler](https://docs.docker.com/config/containers/resource_constraints/#configure-the-realtime-scheduler) |
| --- |

# Parameters

|Parameter   |Description   |
|---|---|
|-a, --servername |server name, required for HTML status |
|-d, --discononquit |disconnect all clients on quit |
|-e, --centralserver |address of the central server (or 'localhost' to be a central server) |
|-f, --listfilter |server list whitelist filter in the format:<br>`[IP address 1];[IP address 2];[IP address 3]; ...` |
|-F, --fastupdate |use 64 samples frame size mode |
|-g, --pingservers |ping servers in list to keep NAT port open (central server only) |
|-l, --log |enable logging, set file name |
|-L, --licence |a licence must be accepted on a new connection |
|-m, --htmlstatus |enable HTML status file, set file name |
|-n, --nogui |disable GUI |
|-o, --serverinfo |infos of the server(s) in the format:<br>`[name];[city];[country as QLocale ID]; ...`<br>`[server1 address];[server1 name]; ...`<br>`[server1 city]; ...`<br>`[server1 country as QLocale ID]; ...`<br>`[server2 address]; ... ` |
|-R, --recording |sets directory to contain recorded jams |
|--norecord |disables recording (when enabled by default by -R) |
|-p, --port |local port number |
|-P, --delaypan |Start with delay panning enabled. |
|-s, --server |start server |
|-T, --multithreading |use multithreading to make better use of multi-core CPUs and support more clients |
|-u, --numchannels |maximum number of channels |
|-w, --welcomemessage |welcome message on connect |
|-z, --startminimized |start minimizied |
