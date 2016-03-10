# Teamcity docker images

Docker images for running teamcity server and agents, built over Ubuntu 14.04.

## Teamcity Server

### Usage

To run it:

`docker run -d -p 8111:8111 --name teamcity-server -v /your/path:/data/teamcity devsu/teamcity-server:latest`

Teamcity server should be running at `http://localhost:8111`. 

Before running you can change the port as needed, or use [nginx-proxy](https://github.com/jwilder/nginx-proxy) to map to a hostname.

You can also change the tag `latest` to match an specific version of teamcity. You can find the available versions as tags in [Docker Hub](https://hub.docker.com/r/devsu/teamcity-server).

#### Mysql Driver

Mysql driver is included, but it's not loaded until:
- You click on "Proceed" on the installation screen, so the folders are created.
- You restart the container so the symlink to the driver is re-created. `docker restart teamcity-server`
- You click on "Refresh JDBC drivers" button on the installation screen.

## Under the hood

The images are built over Ubuntu 14.04.

The teamcity-server image has:
- Utilities: git, wget, tar
- Java 8
- Mysql driver (to allow teamcity to connect to a mysql database)
- Teamcity (obviously)

## License

[GNU GPLv3](https://github.com/devsu/docker-teamcity-server/blob/master/LICENSE) © 2016, Devsu LLC