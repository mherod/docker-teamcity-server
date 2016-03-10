# Teamcity Server docker image

## Usage

To run it:

`docker run -d -p 8111:8111 --name teamcity-server -v /your/path:/data/teamcity devsu/teamcity-server:latest`

Your teamcity server should be available at `http://localhost:8111`. 

Before running you can change the port as needed, or use [nginx-proxy](https://github.com/jwilder/nginx-proxy) to map to a hostname.

You can also change the tag `latest` to match an specific version of teamcity. You can find the available versions as tags in [Docker Hub](https://hub.docker.com/r/devsu/teamcity-server).

### Mysql Driver

Mysql driver is included, but it's not loaded until:
- You click on "Proceed" on the installation screen, so the folders are created.
- You restart the container so the symlink to the driver is re-created. `docker restart teamcity-server`
- You click on "Refresh JDBC drivers" button on the installation screen.

## Under the hood

The image is built over Ubuntu 14.04, it has Java 8 and the mysql library (to allow teamcity to connect to a mysql database).

## License

[GNU GPLv3](https://github.com/devsu/docker-teamcity-server/blob/master/LICENSE) © 2016, Devsu LLC