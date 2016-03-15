# Teamcity Server docker images

Docker images for running teamcity server and agents. Teamcity is an awesome continuous integration server from JetBrains.

After creating a server, you will need agents. You can use [Teamcity Agent Docker Image](https://github.com/devsu/docker-teamcity-agent) to create one.

## Teamcity Server

### Usage

To run it:

`docker run -d -p 8111:8111 --name teamcity-server -v /your/path:/data/teamcity devsu/teamcity-server:latest`

Now you can use your browser and access the installation page.

Before running you can change the port as needed, or use [nginx-proxy](https://github.com/jwilder/nginx-proxy) to map to a hostname.

You can also change the tag `latest` to match an specific version of teamcity. You can find the available versions as tags in [Docker Hub](https://hub.docker.com/r/devsu/teamcity-server).

You can also clone this repo, change the docker file and build the image yourself.

`docker built -t your-username/teamcity-server .`

#### Mysql Driver

Mysql driver is included, but it's not loaded until:

- You click on "Proceed" on the installation screen, so the folders are created.
- You restart the container so the symlink to the driver is re-created. `docker restart teamcity-server`
- You click on "Refresh JDBC drivers" button on the installation screen.

## Under the hood

- The images are built from [java:8](https://github.com/docker-library/openjdk/blob/master/openjdk-8-jdk/Dockerfile) (installs unzip, openjdk-8-jdk)
- Which is built from [buildpack-deps:jessie-scm](https://github.com/docker-library/buildpack-deps/blob/master/jessie/scm/Dockerfile) (installs bzr, git, mercurial, openssh-client, subversion, procps)
- Which is built from [buildpack-deps:jessie-curl](https://github.com/docker-library/buildpack-deps/blob/master/jessie/curl/Dockerfile) (installs curl)
- Which is built from **debian:jessie**

We add:

- Utilities: tar, software-properties-common
- Mysql driver (to allow teamcity to connect to a mysql database)
- Teamcity Server (obviously)

## License

[GNU GPLv3](https://github.com/devsu/docker-teamcity-server/blob/master/LICENSE) © 2016, Devsu LLC