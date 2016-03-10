# Teamcity Server docker image

## Usage

To run it:

`docker run -d -p 8111:8111 -v /your/path:/data/teamcity devsu/teamcity-server:latest`

Your teamcity server should be available at `http://localhost:8111`. You can change the port as needed, or use [nginx-proxy](https://github.com/jwilder/nginx-proxy) to map to a hostname.

You can also change the tag `latest` to match an specific version of teamcity.

## Under the hood

The image is built over Ubuntu 14.04, it has Java 8 and the mysql library (to allow teamcity to connect to a mysql database).

## License

[GNU GPLv3](https://github.com/devsu/docker-teamcity-server/blob/master/LICENSE) © 2016, Devsu LLC