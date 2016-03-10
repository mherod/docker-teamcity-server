# Teamcity docker images

Docker images for running teamcity server and agents. Teamcity is an awesome continuous integration server from JetBrains.

## Teamcity Server

### Usage

To run it:

`docker run -d -p 8111:8111 --name teamcity-server -v /your/path:/data/teamcity devsu/teamcity-server:latest`

Now you can use your browser and access the installation page.

Before running you can change the port as needed, or use [nginx-proxy](https://github.com/jwilder/nginx-proxy) to map to a hostname.

You can also change the tag `latest` to match an specific version of teamcity. You can find the available versions as tags in [Docker Hub](https://hub.docker.com/r/devsu/teamcity-server).

#### Mysql Driver

Mysql driver is included, but it's not loaded until:

- You click on "Proceed" on the installation screen, so the folders are created.
- You restart the container so the symlink to the driver is re-created. `docker restart teamcity-server`
- You click on "Refresh JDBC drivers" button on the installation screen.

## Teamcity Agent

### Usage

Make sure that your Teamcity Server is running. Then run:

`docker run -d -P --name teamcity-agent-1 -v /your/path:/home/teamcity devsu/teamcity-agent:base`

Since the agent is downloaded from the running teamcity server, you don't have to worry on matching the versions of the agents with the servers. Actually, the tags on the agents are related to the versions of the additional packages that it includes.

You can take a look of the available variants at the tags page on Docker Hub.

### Variants

Since the agent can have many configurations, depending on the requirements, we have prepared a few images:

#### Base

It adds nothing but a script to download the agent from teamcity server, configure it and run it. Inspired on [centos7-teamcity-agent](https://bitbucket.org/ariya/docker-centos/src/2669cae3c4e7/centos7-teamcity-agent/?at=master).

## Under the hood

- The images are built from [java:8](https://github.com/docker-library/openjdk/blob/master/openjdk-8-jdk/Dockerfile) (installs unzip, openjdk-8-jdk)
- Which is built from [buildpack-deps:jessie-scm](https://github.com/docker-library/buildpack-deps/blob/master/jessie/scm/Dockerfile) (installs bzr, git, mercurial, openssh-client, subversion, procps)
- Which is built from [buildpack-deps:jessie-curl](https://github.com/docker-library/buildpack-deps/blob/master/jessie/curl/Dockerfile) (installs curl)
- Which is built from **debian:jessie**

On the server image we add:

- Utilities: tar, software-properties-common
- Mysql driver (to allow teamcity to connect to a mysql database)
- Teamcity Server (obviously)

See the agent variants above to find out what is added to the agents.

## License

[GNU GPLv3](https://github.com/devsu/docker-teamcity-server/blob/master/LICENSE) © 2016, Devsu LLC